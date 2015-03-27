Gem::Specification.new do |s|

  s.platform              = Gem::Platform::RUBY
  s.name                  = 'spree_waiting_list'
  s.version               = '1.4.0'
  s.summary               = 'Add a waiting list to your spree store'
  s.description           = 'The waiting list allows users to signup to be notified via email when an items comes back into stock'
  s.required_ruby_version = '>= 2.1.1'

  s.authors  = ['Joshua Nussbaum', 'Nima Shariatian']
  s.email    = ['joshnuss@gmail.com', 'nima.s@coryvines.com']
  s.homepage = 'http://www.godynamo.com'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'
  
  version = '~> 2.4.1'
  s.add_dependency 'spree_core', version
  s.add_dependency 'rails', '~> 4.1.8'

  s.add_development_dependency 'haml-rails'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'sass-rails', '~> 4.0.0'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails', '~> 4.4.1'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'capybara', '~>2.4.1'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'launchy', '~> 2.4.2'
end
