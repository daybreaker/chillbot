class UrbanDictionary < Rubot::WebResource
	get :search, "http://www.urbandictionary.com/define.php" do |doc|
		word = doc.css('.word').first
		definition = doc.css('.definition').first
    example = doc.css('.example').first

    # ugly ass irc formatting in here, not sure I like how most clients
    # handle italics
		if word && definition && example
      result = "\u0002#{word.text.strip}:\u000F #{definition.text.strip}"
      example_text = example.text.strip

      unless example_text.empty?
        result << " -- \u0016\"#{example_text}\""
      end

      result
    else
      'Not defined yet.'
		end
	end
end
