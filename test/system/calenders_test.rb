require "application_system_test_case"

class CalendersTest < ApplicationSystemTestCase
  setup do
    @calender = calenders(:one)
  end

  test "visiting the index" do
    visit calenders_url
    assert_selector "h1", text: "Calenders"
  end

  test "should create calender" do
    visit calenders_url
    click_on "New calender"

    fill_in "Begin time", with: @calender.begin_time
    fill_in "Close time", with: @calender.close_time
    fill_in "Day", with: @calender.day
    fill_in "Interval e", with: @calender.interval_e
    fill_in "Interval s", with: @calender.interval_s
    check "No use" if @calender.no_use
    fill_in "Unit minute", with: @calender.unit_minute
    click_on "Create Calender"

    assert_text "Calender was successfully created"
    click_on "Back"
  end

  test "should update Calender" do
    visit calender_url(@calender)
    click_on "Edit this calender", match: :first

    fill_in "Begin time", with: @calender.begin_time
    fill_in "Close time", with: @calender.close_time
    fill_in "Day", with: @calender.day
    fill_in "Interval e", with: @calender.interval_e
    fill_in "Interval s", with: @calender.interval_s
    check "No use" if @calender.no_use
    fill_in "Unit minute", with: @calender.unit_minute
    click_on "Update Calender"

    assert_text "Calender was successfully updated"
    click_on "Back"
  end

  test "should destroy Calender" do
    visit calender_url(@calender)
    click_on "Destroy this calender", match: :first

    assert_text "Calender was successfully destroyed"
  end
end
