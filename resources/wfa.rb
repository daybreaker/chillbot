class Wfa < Rubot::WebResource
	get :search, "http://api.wolframalpha.com/v2/query" do |doc|
		properties = doc.css('plaintext').map(&:text)[1] || "No Results Found"
	end
end