require_relative 'lib/yandex_translate_api_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "yandex_translate_api_gem"
  spec.version       = YandexTranslateApiGem::VERSION
  spec.authors       = ["Malakhova Natasha"]
  spec.email         = ["8430654@gmail.com"]

  spec.summary       = %q{Yandex Translate API}
  spec.description   = %q{Library for Yandex Translate API}
  spec.homepage      = "https://github.com/NatashaMalakhova/yandex_translate_api_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
