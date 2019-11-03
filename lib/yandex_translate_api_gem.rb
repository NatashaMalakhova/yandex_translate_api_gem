require 'yandex_translate_api_gem/version'
require 'net/http'
require 'json'
require 'uri'

module YandexTranslateApiGem
  class Translate
    class << self 
      def api_key=(key)
        @api_key = key
      end

      def default_lang=(lang)
        @default_lang = lang
      end

      def translate(text, opt = {})
        lang = opt[:lang] || @default_lang || 'ru'
        uri = URI("https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{@api_key}&text=#{URI.encode(text)}&lang=#{lang}")
        result = Net::HTTP.get(uri) 
        JSON.parse(result)['text'] 
      end

      def langs
        uri = URI("https://translate.yandex.net/api/v1.5/tr.json/getLangs?ui=en&key=#{@api_key}")
        result = Net::HTTP.get(uri)
        JSON.parse(result)['langs']
      end
    end
  end
end