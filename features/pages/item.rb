class Item
  include PageActions

  PRODUCT_NAME = {css: '.catalog-masthead__title'}
  DISPLAY_SIZE = {xpath: "//table[contains(@class,'product-specs__table')]//tr[td[contains(text(),'Размер экрана')]]/td[2]"}
  SENSOR_PIXEL={xpath:"//table[contains(@class,'product-specs__table')]//tr[td[contains(text(),'Количество точек матрицы')]]/td[2]"}
  SENSOR_SIZE={xpath:"//table[contains(@class,'product-specs__table')]//tr[td[contains(text(),'Физический размер матрицы')]]/td[2]"}
  ADD_TO_CART={xpath:"//div[contains(@class,'product-aside__item')][1]//a[contains(@class,' product-aside__item-button')]"}
  CART_LINK = {css: 'a.b-top-navigation-cart__link'}

  def path
    "https://catalog.onliner.by/" #+product_path
  end

  def product_name
    @driver.find_element(PRODUCT_NAME)
  end

  def sensor_size
    @driver.find_element(SENSOR_SIZE)
  end

  def sensor_pixel
    @driver.find_element(SENSOR_PIXEL)
  end

  def display_size
    @driver.find_element(DISPLAY_SIZE)
  end

  def add_to_cart
    @driver.find_element(ADD_TO_CART)
  end

  def cart_link
    @driver.find_element(CART_LINK)
  end

end