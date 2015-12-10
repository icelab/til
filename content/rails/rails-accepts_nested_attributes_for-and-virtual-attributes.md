Rails, `accepts_nested_attributes_for` and virtual attributes.

I recently implemented a smallish new feature in one of our apps and ran into a rather annoying gotcha with `accepts_nested_attributes_for` and a model with virtual attributes.

Let’s say we have two models, Event and EventTime. As follows:

'' Event < ActiveRecord::Base
''  has_many :event_times
''  accepts_nested_attributes_for :event_times
'' end

'' EventTime < ActiveRecord::Base
''  # properties: starts_at, ends_at, event_id
''  belongs_to :event
''  
''  attr_accessor :starts_at_date
''  attr_accessor :starts_at_time
''  
''  attr_accessor :ends_at_date
''  attr_accessor :ends_at_time
''  
''  before_validation :set_starts_at
''  before_validation :set_ends_at
''  
'' end

In order to make the form friendlier, we have a date picker and a time picker as two seperate fields for both `sarts_at` and `ends_at` — which is reason for the `attr_accessor`s. We use a `before_validation` callback to combine those two bits of data and satisfy our backing data model.

This all works fine when adding a new event time through the event form. The issue arises when we try and update an existing record through the parent form because we’re trying to run a before validation callback and rails doesn’t think we’ve made any changes.

The way to remedy this, is to define a custom setter for each of the virtual attributes which calls `attribute_will_change!`

'' def starts_at_date=(date)
''    attribute_will_change!(:starts_at_date)
''     @starts_at_date = date
'' end

Or to add a before validation callback in the parent (Event) model that marks each of its children as changes:

'' Event < ActiveRecord::Base
''  has_many :event_times
''  accepts_nested_attributes_for :event_times
''  
''  before_validation :mark_event_times_as_changed
''  
''  def mark_event_times_as_changed
''    event_times.each(&:updated_at_will_change!)
''  end
'' end

which seems a little bit weird to me, but we’re hacking around `accepts_nested_attributes_for` anyway, so, *shrugs*.
