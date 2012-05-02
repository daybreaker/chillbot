require "cgi"

class Google < Rubot::WebResource
  get :calc, "http://www.google.com/search" do |doc|
    doc.css(".r")[0].text
  end
  
  def self.search_url_for(query)
    "http://www.google.com/search?q=#{CGI.escape(query)}"
  end
  
  def self.lmgtfy_url_for(query)
    "http://www.lmgtfy.com/?q=#{CGI.escape(query)}"
  end
end