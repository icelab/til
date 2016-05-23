xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://til.icelab.com.au/"
  xml.title data.site.name
  xml.id site_url
  xml.link "href" => site_url
  xml.link "href" => site_url, "rel" => "self"
  xml.updated(page_articles.first.date.to_time.iso8601) unless page_articles.empty?
  xml.author { xml.name "Icelab" }

  page_articles[0..50].each do |article|
    xml.entry do
      xml.title md_line(article.title)
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name article.data["author"] }
      xml.content article.body, "type" => "html"
    end
  end
end
