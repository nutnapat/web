require "application_system_test_case"
class MainTest < ApplicationSystemTestCase

  test "login_fail" do
    visit "/login"
    fill_in "email", with: 'aaaaaa'
    fill_in "password", with: 'aaaaa'
    click_on "Login"
    assert_selector "h1", text: 'Invalid email or password'
  end

  test "login_success and main" do
    visit "/login"
    fill_in "email", with: "x.com"
    fill_in "password", with: "1111"
    click_on "Login"
    assert_selector "h1", text: 'Logged in successfully'
  end

  test "main not login" do
    visit "/main"
    assert_selector "h1", text: 'POPULAR'
  end

  test "allcartoon" do
    visit "/cartoon"
    click_on "sort by"
    click_on "complete"
    assert_text "one" 
  end

  test "genre" do
    visit "/genre"
    assert_selector "h1", text: 'Genre'
  end

  test "search" do
    visit "/main"
    fill_in "Search", with: "t"
    click_on "Search"
    assert_text "two" 
  end

  test "logout" do
    visit "/login"
    fill_in "email", with: "x.com"
    fill_in "password", with: "1111"
    click_on "Login"
    click_on "Logout"
    assert_selector "h1", text: 'Logged out'
  end

  test "click name chapter lastpage nextpage" do
    visit "/cartoon"
    click_on "one"
    click_on "2"
    click_on "last page"
    click_on "next page"
    click_on "chapter"
    click_on "1"
    assert_text "one chapter 1"
  end

  test "comment" do
    visit "/login"
    fill_in "email", with: "x.com"
    fill_in "password", with: "1111"
    click_on "Login"
    visit "/cartoon"
    click_on "one"
    click_on "2"
    fill_in "comment", with: "test"
    click_on "comment"
    assert_text "test"
  end

  test "filter" do
    visit "/main"
    click_on "friday"
    assert_text "four"
  end

end