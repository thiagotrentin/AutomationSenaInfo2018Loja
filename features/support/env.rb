require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'pry'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,browser: :chrome,options: chrome_options)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'http://automationpractice.com'
end

Capybara.default_max_wait_time = 10

def chrome_options
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')
  options.add_argument('--no-sandbox')
  options.add_argument('ignore-certificate-errors')
  options.add_argument('disable-popup-blocking')
  options.add_argument('disable-translate')
  options.add_argument('disable-infobars')
  options
end