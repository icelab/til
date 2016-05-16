require 'slim'

# General configuration --------------------------------------------------------

activate :dotenv

# Set time zone
Time.zone = ENV["TIME_ZONE"] || "Melbourne"

# Set Markdown engine to use redcarpet
set :markdown_engine, :redcarpet
set :markdown,        :fenced_code_blocks => true,
                      :autolink => true,
                      :smartypants => true,
                      :hard_wrap => true,
                      :smart => true,
                      :superscript => true,
                      :no_intra_emphasis => true,
                      :lax_spacing => true,
                      :with_toc_data => true

# Helpers ----------------------------------------------------------------------

require "lib/typography_helpers"
helpers TypographyHelpers

# Methods defined in the helpers block are available in templates
# Add custom ones below
#
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Page options -----------------------------------------------------------------

# Example configuration options:
# With no layout:
#
#   page "/path/to/file.html", :layout => false
#
# With alternative layout:
#
#   page "/path/to/file.html", :layout => :other_layout
#
# A path which all have the same layout:
#
#   with_layout :admin do
#     page "/admin/*"
#   end

# Proxy (fake) files:
#   page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#     @which_fake_page = "Rendering a fake page with a variable"
#   end

page /(tags|page)\//, layout: "layouts/base"
page "/", layout: "layouts/base"
page "*", layout: "layouts/blog"

# Pages without layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }


# Blog configuration -----------------------------------------------------------

activate :blog do |blog|
  blog.permalink = "/{title}"
  blog.default_extension = ".md"

  # Matcher for blog source files
  blog.sources = "posts/{title}.html"

  # Enabled tags
  blog.tag_template = "tag.html"
  blog.taglink = "tags/{tag}.html"

  # Disable dated pages
  blog.generate_day_pages = false
  blog.generate_month_pages = false
  blog.generate_year_pages = false

  # Enabled pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

# Webpack configuration --------------------------------------------------------

ignore 'assets/**/*.css'
ignore 'assets/**/*.js'

activate :external_pipeline,
         name: :webpack,
         command: build? ? 'npm run build' : 'npm run watch',
         source: ".tmp/dist",
         latency: 1


# General configuration --------------------------------------------------------

activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration -------------------------------------------------

configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

# Deployment configuration -----------------------------------------------------

activate :deploy do |config|
  config.deploy_method = :git
  config.branch = 'gh-pages'
  config.build_before = true
end
