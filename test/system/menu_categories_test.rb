require "application_system_test_case"

class MenuCategoriesTest < ApplicationSystemTestCase
  setup do
    @menu_category = menu_categories(:one)
  end

  test "visiting the index" do
    visit menu_categories_url
    assert_selector "h1", text: "Menu categories"
  end

  test "should create menu category" do
    visit menu_categories_url
    click_on "New menu category"

    fill_in "Description", with: @menu_category.description
    fill_in "Name", with: @menu_category.name
    click_on "Create Menu category"

    assert_text "Menu category was successfully created"
    click_on "Back"
  end

  test "should update Menu category" do
    visit menu_category_url(@menu_category)
    click_on "Edit this menu category", match: :first

    fill_in "Description", with: @menu_category.description
    fill_in "Name", with: @menu_category.name
    click_on "Update Menu category"

    assert_text "Menu category was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu category" do
    visit menu_category_url(@menu_category)
    click_on "Destroy this menu category", match: :first

    assert_text "Menu category was successfully destroyed"
  end
end
