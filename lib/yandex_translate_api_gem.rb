require "yandex_translate_api_gem/version"
require 'net/http'
require 'json'
require 'uri'

module YandexTranslateApiGem
  class Error < StandardError; end

  class Translate
    attr_accessor :api_key
  
    def self.get_api_key(key)
      @api_key = key
    end

    def self.def_lang(lang)
      @def_lang = lang
    end

    def self.translate(opt = {})
      text = opt[:text] || 'Hello'
      lang = opt[:lang] || 'ru'
      uri = URI("https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{@api_key}&text=#{URI.encode(text)}&lang=#{lang}")
      result = Net::HTTP.get(uri) 
      JSON.parse(result)['text'] 
    end

    def self.get_langs
      uri = URI("https://translate.yandex.net/api/v1.5/tr.json/getLangs?ui=en&key=#{@api_key}")
      result = Net::HTTP.get(uri)
      JSON.parse(result)['langs']
    end
  end

# translate = YandexTranslateApiGem::Translate
# translate.get_api_key("trnsl.1.1.20191025T110335Z.4b11526739cc9f02.61937478c797b0f19512e761bc467d4ef9a89d54")
# translate.get_langs
# translate.translate(text: 'Men', lang: 'fi')

end
