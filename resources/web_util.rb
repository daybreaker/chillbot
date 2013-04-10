class WebUtil < Rubot::WebResource
  def self.title(link)
    doc = get_url_follow(link.to_s)

    title = doc.search("meta[name='title']").first
    if title
      title.attributes["content"].text.strip.gsub(/\s+/, ' ')
    else
      doc.css("head title").text.strip.gsub(/\s+/, ' ')
    end
  end
end
