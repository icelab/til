xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title data.site.name
  xml.id data.site.host
  xml.link "href" => data.site.host
  xml.link "href" => URI.join(data.site.host, '/feed.xml'), "rel" => "self"
  xml.updated(page_articles.first.date.to_time.iso8601) unless page_articles.empty?
  xml.author { xml.name "Icelab" }

  page_articles[0..50].each do |article|
    xml.entry do
      xml.title md_line(article.title), "type" => "html"
      xml.link "rel" => "alternate", "href" => URI.join(data.site.host, article.url)
      xml.id URI.join(data.site.host, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name article.data["author"] }
      xml.content article.body, "type" => "html"
    end
  end
end
