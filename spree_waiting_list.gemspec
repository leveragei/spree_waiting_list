Gem::Specification.new do |s|

  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_waiting_list'
  s.version     = '1.3.3'
  s.summary     = 'Add a waiting list to your spree store'
  s.description = 'The waiting list allows users to signup to be notified via email when an items comes back into stock'
  s.required_ruby_version = '>= 1.8.7'

  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Joshua Nussbaum'
  s.email             = 'joshnuss@gmail.com'
  s.homepage          = 'http://www.godynamo.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false


  s.add_dependency(%q<spree_core>, ["~> 2.0.0"])
  s.add_dependency(%q<capybara>, ["~> 2.1.0"])
  s.add_dependency(%q<ffaker>, [">= 0"])
  s.add_development_dependency 'factory_girl_rails', '~> 1.5.0'
  s.add_development_dependency 'coffee-rails'
  s.add_dependency(%q<rspec-rails>, ["~> 2.13"])
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
