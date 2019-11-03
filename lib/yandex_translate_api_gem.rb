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

# translate = YandexTranslateApiGem::Translate
# translate.api_key = "trnsl.1.1.20191025T110335Z.4b11526739cc9f02.61937478c797b0f19512e761bc467d4ef9a89d54"
# translate.default_lang = "default_lang"
# translate.langs
# translate.translate('Men', lang: 'fi')