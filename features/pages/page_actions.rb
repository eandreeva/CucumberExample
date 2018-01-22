module PageActions

  def initialize(driver)
    @driver = driver
  end

  def visit
    @driver.navigate.to(path)
  end

  def wait_for (seconds)
    Selenium::WebDriver::Wait.new(timeout: seconds).until {yield}
  end

  def page_title
    @driver.title
  end

  def switch_to frame
    @driver.switch_to.frame frame
  end

  def switch_to_default
    @driver.switch_to.default_content
  end

end