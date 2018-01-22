Given /^I'm on Home page$/ do
  @home_page.visit
end

Given /^I search for "(.*?)"$/ do |search_term|
  input = @home_page.search_form
  input.clear
  input.send_keys(search_term)
  input.send_keys(:enter)
end

Then /^I should see the search results block$/ do
  @home_page.search_results_displayed?
  @home_page.switch_to @home_page.search_frame
  expect(@home_page.search_data.text).not_to be_empty
  @home_page.switch_to_default
end

When /^I click first result link$/ do
  @home_page.switch_to @home_page.search_frame
  @home_page.first_result_displayed?
  @home_page.first_search_result.click
end

When /^I go to cart$/ do
  @item.cart_link.click
  @cart.cart_data_displayed?
end

Then /^I should see the cart page$/ do
  @cart.cart_data_displayed?
  expect(@cart.cart_data.text).not_to be_empty
end

Then /^there is (.*?) item on cart page$/ do |amount|
  expect(@cart.cart_items.length).to eq(Integer(amount))
end

Then /^product (.*?) has "(.*?)" name$/ do |number, name|
  product = @cart.cart_item(Integer(number))
  expect(product.text).to include name
end

Then /^I should see the product "(.*?)" page$/ do |product|
  expect(@item.page_title).to include product
end

Then /^product name is "(.*?)"$/ do |product|
  expect(@item.product_name.text).to include(product)
end

Then /^sensor size is "(.*?)"$/ do |ssize|
  expect(@item.sensor_size.text).to include(ssize)
end

Then /^sensor pixel recording is "(.*?)"/ do |pixel_rec|
  expect(@item.sensor_pixel.text).to include(pixel_rec)
end

Then /^display size is "(.*?)"$/ do |dsize|
  expect(@item.display_size.text).to include(dsize)
end

When /^I add item to cart$/ do
  @item.add_to_cart.click
end

Then /^there is (.*?) item in cart$/ do |amount|
  @item.wait_for(10){@item.cart_link.text.match(amount)}
  expect(@item.cart_link.text).to include amount
end