path = File.expand_path '../helper', __FILE__
$LOAD_PATH.unshift path unless $LOAD_PATH.include?(path)

require 'AccessBrowserV2.rb'

class GlobalDateFilter < AccessBrowserV2
  include Singleton
  def initialize
    super
    date_filter = AccessHtmlElement.new(:id, "date-region-minimized")
    add_action(CucumberLabel.new("Control - Overview - Date Filter"), ClickAction.new, date_filter)
    add_action(CucumberLabel.new("Control - Coversheet - Date Filter Toggle"), ClickAction.new, date_filter)

    apply_button = AccessHtmlElement.new(:id, "custom-range-apply-global")
    add_action(CucumberLabel.new("Control - Coversheet - Apply"), ClickAction.new, apply_button)
    add_action(CucumberLabel.new("Control - Overview - Apply"), ClickAction.new, apply_button)

    from_date =  AccessHtmlElement.new(:id, "filter-from-date-global")
    to_date = AccessHtmlElement.new(:id, "filter-to-date-global")
    add_action(CucumberLabel.new("Control - Coversheet - From Date"), SendKeysAction.new, from_date)
    add_action(CucumberLabel.new("Control - Coversheet - To Date"), SendKeysAction.new, to_date)
    add_action(CucumberLabel.new("Control - Overview - From Date"), SendKeysAction.new, from_date)
    add_action(CucumberLabel.new("Control - Overview - To Date"), SendKeysAction.new, to_date)
    
    #add_action(CucumberLabel.new("Control - Coversheet - Date Filter Toggle"), ClickAction.new, AccessHtmlElement.new(:id, "navigation-dateButton"))
    #add_action(CucumberLabel.new("Control - Coversheet - Date Filter Toggle"), ClickAction.new, AccessHtmlElement.new(:id, "date-region-minimized"))
    add_action(CucumberLabel.new("Control - Coversheet - Date Filter Close"), ClickAction.new, AccessHtmlElement.new(:css, "#navigation-date #close-global-date-view"))
    add_verify(CucumberLabel.new("Element - Date Filter"), VerifyContainsText.new, AccessHtmlElement.new(:css, "#navigation-date .grid-filter-daterange"))
    add_verify(CucumberLabel.new("Element - Range Text"), VerifyContainsText.new, AccessHtmlElement.new(:css, "#date-region-minimized > div > span:nth-child(2)"))
    
    add_action(CucumberLabel.new("Control - Coversheet - Cancel"), ClickAction.new, AccessHtmlElement.new(:id, "cancel-global"))
    add_action(CucumberLabel.new("Control - Coversheet - All"), ClickAction.new, AccessHtmlElement.new(:id, 'all-range-global'))
    add_action(CucumberLabel.new("Control - Coversheet - 24hr"), ClickAction.new, AccessHtmlElement.new(:id, '24hr-range-global'))

    add_verify(CucumberLabel.new('Trend History Chart'), VerifyContainsText.new, AccessHtmlElement.new(:id, 'trend-history-chart'))
    add_verify(CucumberLabel.new('Empty Row'), VerifyContainsText.new, AccessHtmlElement.new(:css, '#globalDate-region #data-grid-newsfeed tr.empty'))

    add_verify(CucumberLabel.new('All Activities Title'), VerifyText.new, AccessHtmlElement.new(:id, 'allActivitiesTitle'))
    add_verify(CucumberLabel.new('GDF Panel Title'), VerifyText.new, AccessHtmlElement.new(:css, '#timeline-summary h5.panel-title-label'))

    add_verify(CucumberLabel.new('Header - Date & Time'), VerifyContainsText.new, AccessHtmlElement.new(:css, "#data-grid-newsfeed-gdt [data-header-instanceid=newsfeed-activityDateTime]"))
    add_verify(CucumberLabel.new('Header - Activity'), VerifyContainsText.new, AccessHtmlElement.new(:css, "#data-grid-newsfeed-gdt [data-header-instanceid=newsfeed-activity]"))
    add_verify(CucumberLabel.new('Header - Type'), VerifyContainsText.new, AccessHtmlElement.new(:css, "#data-grid-newsfeed-gdt [data-header-instanceid=newsfeed-displayType]"))
    rows = AccessHtmlElement.new(:css, '#data-grid-newsfeed-gdt tbody tr.selectable')
    add_verify(CucumberLabel.new('GDF summary rows'), VerifyXpathCount.new(rows), rows)
    add_action(CucumberLabel.new('GDF first row'), ClickAction.new, AccessHtmlElement.new(:xpath, "//table[@id='data-grid-newsfeed-gdt']/descendant::tr[contains(@class, 'selectable')][1]"))
    rows = AccessHtmlElement.new(:css, "#modal-body div.row")
    add_verify(CucumberLabel.new('GDF summary detail rows'), VerifyXpathCount.new(rows), rows)
    
    def applet_loaded?
      return true if am_i_visible? 'Empty Row'
      return TestSupport.driver.find_elements(:css, '#globalDate-region #data-grid-newsfeed-gdt tbody tr.selectable').length > 0
    rescue => e 
      # p e
      false
    end
  end
end

class CoversheetContainer < GlobalDateFilter
  include Singleton

  def initialize
    super
    # add_action(CucumberLabel.new("Control - Coversheet - Date Filter Toggle"), ClickAction.new, AccessHtmlElement.new(:css, "#navigation-date #date-region2"))
  end # initialize
end # CoversheetContainer

Before do
  @cc = CoversheetContainer.instance
end

# ######################## functions ########################

# ######################## When ########################

When(/^the user opens the Global Date Filter$/) do
  expect(@cc.perform_action('Control - Coversheet - Date Filter Toggle')).to eq(true)
  wait = Selenium::WebDriver::Wait.new(:timeout => DefaultTiming.default_table_row_load_time)
  wait.until { @cc.applet_loaded? }
end

When(/^the user sets Global Date Filter to All$/) do
  expect(@cc.perform_action('Control - Coversheet - All')).to eq(true)
  wait = Selenium::WebDriver::Wait.new(:timeout => DefaultTiming.default_table_row_load_time)
  wait.until { @cc.applet_loaded? }
end

When(/^the user clicks the date control "(.*?)" (?:on|in) the "(.*?)"$/) do |control_name, parent_name|
  driver = TestSupport.driver

  key_append = ""

  case parent_name
  when "Coversheet"
    key_append = "range-global"
  when "Orders applet"
    key_append = "range-orders"
  when "Numeric Lab Results applet"
    key_append = "range-lab_results_grid"
  when "Narrative Lab Results applet"
    key_append = "range-narrative_lab_results_grid"
  when "Numeric Lab Results modal"
    key_append = "Range"
  when "Text Search"
    key_append = "range-text-search"
  when "Documents Applet"
    key_append = "range-global"
  when "Med Review Applet"
    key_append = "range-global"
  when "NewsFeed Applet"
    key_append = "range-global"
  when "Overview"
    key_append = "range-global"
  end

  # All was changed to Any without updating css selectors
  if control_name.downcase == "any"
    control_name = "all"
  end

  if parent_name == "Numeric Lab Results modal"
    control_key = "#{control_name.downcase}#{key_append}"
  else
    control_key = "#{control_name.downcase}-#{key_append}"
  end

  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  wait.until { driver.find_element(:id, control_key) }

  element = driver.find_element(:id, control_key)

  wait.until { element.displayed? }

  element.click
end

# ######################## Then ########################

Then(/^the "(.*?)" should be "(.*?)" on the Coversheet$/) do |element_name, display_state|
  map_key = "Element - #{element_name}"
  verify_element_displayed(@cc, map_key, display_state)
end

Then(/^the following choices should be displayed for the "(.*?)" Date Filter$/) do |parent_name, expected_choices|
  driver = TestSupport.driver
  expected_displays = expected_choices.headers

  key_append = ""

  case parent_name
  when "Coversheet"
    key_append = "range-global"
  when "Numeric Lab Results applet"
    key_append = "range-numeric_lab_results_grid"
  when "Orders applet"
    key_append = "range-orders"
  when "Text Search"
    key_append = "range-text-search"
  when "Documents Applet"
    key_append = "range-global"
  when "Med Review Applet"
    key_append = "range-global"
  when "NewsFeed Applet"
    key_append = "range-global"
  when "Overview"
    key_append = "range-global"
  end

  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  expected_displays.each do |expected_display|
    expected_display = "all" if expected_display.downcase == "any"
    actual_element = driver.find_element(:id, "#{expected_display.downcase}-#{key_append}")
    begin
      wait.until { actual_element.displayed? }
    rescue
      p "!! Not displayed: #{expected_display} !!"
      raise
    end #begin/rescue
  end
end

Then(/^the Custom date fields should be "(.*?)" (?:on|in) the "(.*?)"/) do |enabled_or_disabled, parent_name|
  from_element = nil
  to_element = nil

  case parent_name
  when "Coversheet"
    @cc = CoversheetContainer.instance
    from_element = @cc.get_element("Control - Coversheet - From Date")
    to_element = @cc.get_element("Control - Coversheet - To Date")
  when "Numeric Lab Results applet"
    @lr = LabResultsContainer.instance
    from_element = @lr.get_element("Control - applet - From Date")
    to_element = @lr.get_element("Control - applet - To Date")
  when "Numeric Lab Results modal"
    @lr = LabResultsContainer.instance
    from_element = @lr.get_element("Control - modal - From Date")
    to_element = @lr.get_element("Control - modal - To Date")
  when "Text Search"
    @ts = TextSearchContainer.instance
    from_element = @ts.get_element("Control - modal - From Date")
    to_element = @ts.get_element("Control - modal - To Date")
  end

  verify_element_enabled(from_element, enabled_or_disabled)
  verify_element_enabled(to_element, enabled_or_disabled)
end

Then(/^the active date control (?:on|in) the "(.*?)" is the "(.*?)" button$/) do |parent_name, control_name|
  driver = TestSupport.driver

  parent_key = nil
  append = nil

  case parent_name
  when "Coversheet"
    parent_key = "#globalDate-region"
    append = "range-global"
  when "Numeric Lab Results applet"
    parent_key = "[data-appletid=lab_results_grid]"
    append = "range-lab_results_grid"
  when "Numeric Lab Results modal"
    parent_key = "#modal-body"
    append = "range"
  when "Orders applet"
    parent_key = "[data-appletid=orders]"
    append = "range-orders"
  end

  control_name = "all" if control_name.downcase == "any"

  expected_element = driver.find_element(:css, parent_key).find_element(:id, "#{control_name.downcase}-#{append}")

  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  wait.until { expected_element.displayed? }

  expected_element_id = expected_element.attribute("id")

  active_element_id = driver.find_element(:css, "#{parent_key} .active-range").attribute("id")

  verify_elements_equal(expected_element_id, active_element_id)
end

Then(/^there is no active date control (?:on|in) the "(.*?)"$/) do |parent_name|
  driver = TestSupport.driver

  parent_key = nil

  case parent_name
  when "Coversheet"
    parent_key = "#globalDate-region"
  when "Numeric Lab Results applet"
    parent_key = "[data-appletid=lab_results_grid]"
  when "Numeric Lab Results modal"
    parent_key = "#modal-body"
  when "Orders applet"
    parent_key = "[data-appletid=orders]"
  end

  number_active_controls = driver.find_elements(:css, "#{parent_key} .active-range").size

  expect(number_active_controls).to eq(0)
end

Then(/^the "(.*?)" text is correctly set to "(\d+)" months in the past and "(\d+)" months in the future$/) do |_checked_text, months_past, months_future|
  date_format_template = "%m/%d/%Y"

  expected_from_date = DateTime.now.prev_month(months_past.to_i).strftime(date_format_template)
  expected_to_date = DateTime.now.next_month(months_future.to_i).strftime(date_format_template)

  expected_text = "#{expected_from_date} - #{expected_to_date}"

  expect(@cc.perform_verification('Element - Range Text', expected_text)).to be_true
  #actual_text = @cc.get_element("Element - Range Text").text

  #verify_elements_equal(expected_text, actual_text)
end

When(/^the "(.*?)" text is correctly set to "(.*?)" days in the past and "(.*?)" months in the future$/) do |_checked_text, days_past, months_future|
  date_format_template = "%m/%d/%Y"

  expected_from_date = DateTime.now.prev_day(days_past.to_i).strftime(date_format_template)
  expected_to_date = DateTime.now.next_month(months_future.to_i).strftime(date_format_template)

  expected_text = "#{expected_from_date} - #{expected_to_date}"

  #actual_text = @cc.get_element("Element - Range Text").text

  #verify_elements_equal(expected_text, actual_text)
  expect(@cc.perform_verification('Element - Range Text', expected_text)).to be_true
end

Then(/^the "(.*?)" input is correctly set to "(\d+)" months in the "(.*?)"$/) do |_custom_field, months, time|
  date_format_template = "%m/%d/%Y"

  if time == "past"
    expected_from_date = DateTime.now.prev_month(months.to_i).strftime(date_format_template)
    actual_from_date = @cc.get_element("Control - Coversheet - From Date").attribute("value")
    p actual_from_date
    verify_elements_equal(expected_from_date, actual_from_date)
  end

  if time == "future"
    expected_to_date = DateTime.now.next_month(months.to_i).strftime(date_format_template)
    actual_to_date = @cc.get_element("Control - Coversheet - To Date").attribute("value")
    verify_elements_equal(expected_to_date, actual_to_date)
  end
end

Then(/^the "(.*?)" input is correctly set to "(\d+)" days in the "(.*?)"$/) do |_custom_field, days, time|
  date_format_template = "%m/%d/%Y"

  if time == "past"
    expected_from_date = DateTime.now.prev_day(days.to_i).strftime(date_format_template)
    actual_from_date = @cc.get_element("Control - Coversheet - From Date").attribute("value")
    verify_elements_equal(expected_from_date, actual_from_date)
  end

  if time == "future"
    expected_to_date = DateTime.now.next_day(days.to_i).strftime(date_format_template)
    actual_to_date = @cc.get_element("Control - Coversheet - To Date").attribute("value")
    verify_elements_equal(expected_to_date, actual_to_date)
  end
end

Then(/^the "(.*?)" text is correctly set to "(.*?)"$/) do |_checked_text, expected_text|
  actual_text = @cc.get_element("Element - Range Text").text

  # the actual word of "Viewing" is not being tested here, just that "All","Any", etc is being used
  expected_text.sub!(/Viewing /, "")

  verify_elements_equal(expected_text, actual_text)
end

Then(/^the Custom date field "(.*?)" button should be "(.*?)" (?:on|in) the "(.*?)"$/) do |control_name, enabled_state, parent_name|
  container = nil
  modal_or_applet = nil

  case parent_name
  when "Coversheet"
    container = CoversheetContainer.instance
    modal_or_applet = "Coversheet"
  when "Numeric Lab Results applet"
    container = LabResultsContainer.instance
    modal_or_applet = "applet"
  when "Numeric Lab Results modal"
    container = LabResultsContainer.instance
    modal_or_applet = "modal"
  end

  element = container.get_element("Control - #{modal_or_applet} - #{control_name}")

  verify_element_enabled(element, enabled_state)
end

Given(/^the user has selected All within the global date picker$/) do
  
  # When the user clicks the control "Date Filter Toggle" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - Date Filter Toggle')).to be_true, "Was not able to select Control - Coversheet - Date Filter Toggle"
  @cc.wait_until_action_element_visible 'Trend History Chart'

  # deliberate use of sleep
  sleep 5
  # And the user clicks the date control "All" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - All')).to be_true, "Was not able select Control - Coversheet - All"
  # And the user clicks the control "Apply" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - Apply')).to be_true, "was not able to select Global Date Filter: Apply button"
  @cc.wait_until_action_element_invisible 'Trend History Chart'

  expect(@cc.perform_verification('Element - Range Text', 'All')).to be_true
end

Given(/^the user has selected 24h within the global date picker$/) do
  
  # When the user clicks the control "Date Filter Toggle" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - Date Filter Toggle')).to be_true, "Was not able to select Control - Coversheet - Date Filter Toggle"
  @cc.wait_until_action_element_visible 'Trend History Chart'

  # deliberate use of sleep
  sleep 5
  # And the user clicks the date control "All" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - 24hr')).to be_true, "Was not able select Control - Coversheet - 24hr"
  # And the user clicks the control "Apply" on the "Coversheet"
  expect(@cc.perform_action('Control - Coversheet - Apply')).to be_true, "was not able to select Global Date Filter: Apply button"
  @cc.wait_until_action_element_invisible 'Trend History Chart'

  # expect(@cc.perform_verification('Element - Range Text', 'All')).to be_true
end

Then(/^the "([^"]*)" input is set to the patients birthday "([^"]*)"$/) do |arg1, arg2|
  actual_to_date = @cc.get_element("Control - Coversheet - #{arg1}").attribute("value")
  expect(actual_to_date).to eq(arg2)
end

Then(/^the GDF displays a "(.*?)" button$/) do |arg1|
  expect(@cc.wait_until_action_element_visible('Control - Coversheet - Cancel')).to eq(true)
end

Then(/^the GDF AllActivities Title is "(.*?)"$/) do |arg1|
  expect(@cc.perform_verification('All Activities Title', arg1.upcase)).to eq(true)
end

Then(/^the GDF Panel Title is "(.*?)"$/) do |arg1|
  expect(@cc.perform_verification('GDF Panel Title', arg1.upcase)).to eq(true)
end

Then(/^the GDF headers are$/) do |table|
  table.rows.each do | row |
    p "Header - #{row[0]}"
    expect(@cc.perform_verification("Header - #{row[0]}", row[0])).to eq(true)
  end
end

Given(/^the GDF displays rows in the Timeline Summary$/) do
  expect(@cc.wait_until_xpath_count_greater_than('GDF summary rows', 0)).to eq(true)
end

When(/^the user selects the first row in the Timeline Summary$/) do
  expect(@cc.perform_action('GDF first row')).to eq(true)
end

Then(/^a Timeline detail displays$/) do
  # #modal-body div.row
  expect(@cc.wait_until_xpath_count_greater_than('GDF summary detail rows', 0)).to eq(true)
end
