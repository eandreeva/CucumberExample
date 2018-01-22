require_relative '../pages/page_actions'
require 'require_all'
require_all 'features/pages'

Before do
  browser = ENV['DRIVER']

  case browser
    when 'firefox'
      @driver = Selenium::WebDriver.for :firefox
    when 'chrome'
      @driver = Selenium::WebDriver.for :chrome
    else
      @driver = Selenium::WebDriver.for :chrome
  end

  set_window_size(1280,1024)

  @home_page = HomePage.new @driver
  @item = Item.new @driver
  @cart = Cart.new @driver
end

def set_window_size(screen_width, screen_height)
  screen_width   ? screen_width   : screen_width   = 1280
  screen_height  ? screen_height  : screen_height  = 1024

  @driver.manage.window.resize_to(screen_width, screen_height)
end

After do |scenario|
  if scenario.failed?
    screenshots_dir = File.join(File.dirname(__FILE__), "..", "..", "screenshots")
    unless File.directory?(screenshots_dir)
      FileUtils.mkdir_p(screenshots_dir)
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_at_%H.%M.%S").to_s
    screenshot_name = "#{time_stamp}_failure_#{scenario.name.gsub(/[^\w`~!@#\$%&\(\)_\-\+=\[\]\{\};:',]/, '-')}.png"
    screenshot_file = File.join(screenshots_dir, screenshot_name)
    @driver.save_screenshot(screenshot_file)
    embed("#{screenshot_file}", 'image/png')
  end
  @driver.quit
end