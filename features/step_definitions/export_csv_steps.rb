require 'selenium/webdriver'
require 'capybara/cucumber'
require 'capybara/session'
require 'csv'

# Based on a comment from http://collectiveidea.com/blog/archives/2012/01/27/testing-file-downloads-with-capybara-and-chromedriver/
Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = DownloadHelpers::PATH.to_s
  # means save to the 'browser.download.dir' as opposed to ~/Downloads
  profile['browser.download.folderList'] = 2
  # prevents "open with" dialog for CSV files
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv'

  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Before do
  Capybara.current_driver = :firefox
end

After do
  Capybara.use_default_driver
end

Then(/^I should receive a valid CSV file$/) do
  CSV.parse(download_content)
end
