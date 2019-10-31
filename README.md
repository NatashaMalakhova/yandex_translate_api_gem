# YandexTranslateApiGem

## Installation

Add this line to your application's Gemfile:

    gem 'yandex_translate_api_gem'


And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install yandex_translate_api_gem

## Usage

    translator = YandexTranslateApiGem::Translate


Create API Key 

    translator.get_api_key('your.key')

### Get api_key from https://translate.yandex.ru/developers/keys.


To get list of possible translation directions use langs method:

    translator.langs


To translate text use translate method:

    translate.translate(text: 'Men', lang: 'fi')


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
