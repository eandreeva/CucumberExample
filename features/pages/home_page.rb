class HomePage
  include PageActions

  SEARCH_FORM = {css: '.fast-search__input'}
  SEARCH_RESULTS_BLOCK = {css:'div#fast-search-modal'}
  SEARCH_RESULTS_FRAME = {css:'.modal-iframe'}
  SEARCH_RESULTS_DATA = {css:'div#search-page'}
  FIRST_SEARCH_RESULT = {xpath:"//div[contains(@class,'result__wrapper')]/div[contains(@class,'result__item result__item_product')][1]/a"}

  def path
    'https://www.onliner.by/'
  end

  def search_form
    @driver.find_element(SEARCH_FORM)
  end

  def search_results_block
    @driver.find_element(SEARCH_RESULTS_BLOCK)
  end

  def first_search_result
    @driver.find_element(FIRST_SEARCH_RESULT)
  end

  def search_frame
    @driver.find_element(SEARCH_RESULTS_FRAME)
  end

  def search_data
    @driver.find_element(SEARCH_RESULTS_DATA)
  end

  def search_results_displayed?
    wait_for(15){search_results_block.displayed? }
  end

  def first_result_displayed?
    wait_for(15){first_search_result.displayed? }
  end
end