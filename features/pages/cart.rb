class Cart
  include PageActions

  CART_ITEMS = {css: 'div.cart-product'}
  CART_DATA = {css: '.cart-panels'}
  CART_ITEM_XPATH = "//div[contains(@class,'cart-product')][%s]"

  def path
    "https://cart.onliner.by/"
  end

  def cart_items
    @driver.find_elements(CART_ITEMS)
  end

  def cart_data
    @driver.find_element(CART_DATA)
  end

  def cart_data_displayed?
    wait_for(10){cart_data.displayed?}
  end

  def cart_item(number)
    ci_xpath = CART_ITEM_XPATH % [number]
    @driver.find_element({xpath: ci_xpath})
  end
end