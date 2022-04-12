
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'a2/version'

Gem::Specification.new do |spec|
  spec.name          = 'a2'
  spec.version       = A2::VERSION
  spec.authors       = ['gscho']
  spec.email         = ['greg.c.schofield@gmail.com']
  spec.summary       = %q{A gem for interacting with the Chef Automate 2+ API}
  spec.description   = %q{A gem for interacting with the Chef Automate 2+ API}
  spec.homepage      = 'https://github.com/gscho/a2'
  spec.license       = 'MIT'
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    "source_code_uri" => spec.homepage,
    "changelog_uri" => "#{spec.homepage}/CHANGELOG.md"
  }
  spec.add_development_dependency 'bundler', '~> 2.2.15'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'github_changelog_generator'
  spec.add_dependency 'cmdparse'
  spec.add_dependency 'httparty'
end
