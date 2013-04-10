class UrbanDictionaryController < Rubot::Controller
	command :urban do
		reply UrbanDictionary.search(:term => message.text)
	end
end
