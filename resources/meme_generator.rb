require 'json'

class MemeGenerator < Rubot::WebResource
  CONFIG = YAML.load_file "meme_generator.yml"
  get :generate, 'http://version1.api.memegenerator.net/Instance_Create' do |doc|
    response = JSON.parse doc

    if response['success']
      response['result']['instanceImageUrl']
    else
      response['errorMessage']
    end
  end

  def self.create generator_id, image_id, text0, text1
    self.generate :username => CONFIG['username'], :password => CONFIG['password'],
      :languageCode => 'en', :generatorID => generator_id, :imageID => image_id,
      :text0 => text0, :text1 => text1
  end

  def self.good_news text
    self.create '60382', '1430917', 'GOOD NEWS EVERYONE', text
  end
end
