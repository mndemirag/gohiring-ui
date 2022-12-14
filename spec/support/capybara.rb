# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara/rails'

Capybara.javascript_driver = :headless_firefox

Capybara.register_driver :headless_firefox do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Firefox::Options.new
  browser_options.args << '-headless'
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: browser_options)
end
