
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "record_medium/version"

Gem::Specification.new do |spec|
  spec.name          = "record_medium"
  spec.version       = RecordMedium::VERSION
  spec.authors       = ["vickodin"]
  spec.email         = ["vick.orel@gmail.com"]

  spec.summary       = "RecordMedium.com API"
  spec.description   = "RecordMedium.com API gem (import and export)"
  spec.homepage      = "https://github.com/vickodin/record_medium"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",  "~> 1.16"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "rspec",    "~> 3.0"
  spec.add_development_dependency 'webmock',  '~> 3.3'
  spec.add_development_dependency 'vcr',      '~> 4.0'
  spec.add_development_dependency 'rubocop',  '~> 0.52.1'

  spec.add_runtime_dependency     'httparty', '~> 0.15.6'
end
