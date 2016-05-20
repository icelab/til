module AssetHelpers
  def render_asset(path)
    path = path.gsub(/^\//, '')
    sitemap.resources.find {|r| r.path == path }.render
  end
end
