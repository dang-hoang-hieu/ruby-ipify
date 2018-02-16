
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ipify/version"

Gem::Specification.new do |spec|
  spec.name          = "ipify"
  spec.version       = Ipify::VERSION
  spec.date        = '2018-02-14'
  spec.summary     = "Public id address getter"
  spec.description = "gem for retrieving public ip address from Ipify API service"
  spec.authors     = ["Hieu Dang"]
  spec.email       = 'hoanghieu3690@gmail.com'
  spec.homepage    = 'https://github.com/dang-hoang-hieu/ruby-ipify'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
