# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/dowsing/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-dowsing'
  spec.version       = ActiveRecord::Dowsing::VERSION
  spec.authors       = ['cyrill']
  spec.email         = ['siril.taka@gmail.com']
  spec.license       = "MIT"

  spec.summary       = %q{Mark tiny callers (stacktrace) in your sql.}
  spec.description   = %q{Add comment where is it called in your sql automatically. It's useful for code reading.}
  spec.homepage      = 'http://gitlab.pixiv.private/pixiv/activerecord-dowsing'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems-soto.meganezaru.info'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'activerecord', '~> 4.2'
end
