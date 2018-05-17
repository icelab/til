require "slim"

# General configuration --------------------------------------------------------

activate :dotenv

# Set Markdown engine to use redcarpet
set :markdown_engine, :redcarpet
set :markdown,        fenced_code_blocks: true,
                      autolink: true,
                      smartypants: true,
                      hard_wrap: true,
                      smart: true,
                      superscript: true,
                      no_intra_emphasis: true,
                      lax_spacing: true,
                      with_toc_data: true

config[:js_dir] = ''
config[:css_dir] = ''
config[:images_dir] = ''

# Helpers ----------------------------------------------------------------------

require "lib/typography_helpers"
helpers TypographyHelpers
require "lib/asset_helpers"
helpers AssetHelpers

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

# Pages without layout
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

# page /(topics|page)\//, layout: "layouts/base" # this doesn’t work
page "/", layout: "layouts/base"
page "*", layout: "layouts/blog"

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
  blog.taglink = "topics/{tag}.html"

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

activate :external_pipeline,
         name: :webpack,
         command: build? ? "npm run build" : "npm run watch",
         source: ".tmp/dist",
         latency: 1


# Other configuration --------------------------------------------------------

activate :directory_indexes
activate :syntax
activate :asset_hash

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration -------------------------------------------------

ignore "assets/**/*.css"
ignore "assets/**/*.js"

configure :build do
  activate :asset_host, host: "https://til.icelab.com.au"
end

# Deployment configuration -----------------------------------------------------

activate :deploy do |config|
  config.deploy_method = :git
  config.branch = "gh-pages"
  config.build_before = true
end
