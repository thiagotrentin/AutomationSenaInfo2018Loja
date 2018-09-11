After do |scenario|
  begin
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    take_screenshot(scenario_name.downcase!, scenario.failed? ? 'failed' : 'passed')
  rescue StandardError => exception
    puts exception
  end
  ## kills instance when not headless
  Capybara.current_session.driver.quit
end
