
module Commons
  def take_screenshot(file_name, result)
    timer_path = Time.now.strftime('%Y_%m_%d').to_s
    file_path = "reports/screenshots/test_#{result}/run_#{timer_path}/"
    file_name_normalized = file_name.gsub(/[^0-9A-Za-z]/, '') + '.png'
    screenshot = file_path + file_name_normalized
    puts "Screenshot URL: #{Capybara.current_session.driver.browser.current_url}"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'SCREENSHOT')
  end

  def scroll_to(element)
    page_height = Capybara.current_session.driver.browser.manage.window.size.height
    element_axis_y = element.native.location.y
    element_offset = element.native.size.height
    final_screen_axis = (element_axis_y + element_offset) - page_height / 2
    final_screen_axis = final_screen_axis >= 0 ? final_screen_axis : 0
    Capybara.current_session.driver.browser.execute_script("scrollTo(0,#{final_screen_axis})")
  end

  def highlight(selector)
    page.execute_script("$('#{selector}').css({'border': '3px solid #cc008f'});")
  end

  def highlight_element(elemento)
    highlight elemento.instance_variable_get(:@query).locator
  end

  def wait_for(timeout = Capybara.default_max_wait_time)
    timeout.times do
      break if yield
      sleep(1)
    end
  rescue Selenium::WebDriver::Error::StaleElementReferenceError
    puts 'Elemento avaliado não está mais na tela'
  rescue StandardError => exception
    raise exception
  end

  def wait_page_ready_state_complete
    wait_page_ready_state('complete')
  end

  def wait_page_ready_state_interactive
    wait_page_ready_state('interactive')
  end

  def wait_page_ready_state(state)
    wait_for { page.execute_script('return document.readyState').eql?(state) }
  end
end
## Disponibiliza o Commons de forma global
World(Commons)
