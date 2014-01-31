require 'selenium-webdriver'

Dir.glob('spec/**/*steps.rb') { |f| load(f, true) }
