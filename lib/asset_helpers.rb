module AssetHelpers
  def render_asset(path)
    # Remove leading slash
    path = File.basename(path, '*')

    # Infer whether `activate :asset_hash` is active matching against a hash
    # with a format like foo-bar-b785915a.js
    path_components = path.split("-")
    asset_hash_active = if path_components.length == 0
      false
    elsif path_components.last.length === 8 && path_components.last =~ /(?:[0-9]+[a-z]|[a-z]+[0-9])/
      true
    else
      false
    end

    if asset_hash_active != nil
      path = components[0...-1].join("-")
      sitemap.resources.find {|r|
        # Remove the extension
        File.basename(r.path, '*') == path
      }.render
    else
      path = components.join("-")
      sitemap.resources.find {|r|
        # Remove the leading `/`
        File.basename(r.path, '*') == path
      }.render
    end
  end
end
