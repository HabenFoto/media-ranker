require "application_system_test_case"

describe "Works", :system do
  let(:work) { works(:one) }

  it "visiting the index" do
    visit works_url
    assert_selector "h1", text: "Works"
  end

  it "creating a Work" do
    visit works_url
    click_on "New Work"

    fill_in "Category", with: @work.category
    fill_in "Creator", with: @work.creator
    fill_in "Description", with: @work.description
    fill_in "Title", with: @work.title
    fill_in "Year", with: @work.year
    click_on "Create Work"

    assert_text "Work was successfully created"
    click_on "Back"
  end

  it "updating a Work" do
    visit works_url
    click_on "Edit", match: :first

    fill_in "Category", with: @work.category
    fill_in "Creator", with: @work.creator
    fill_in "Description", with: @work.description
    fill_in "Title", with: @work.title
    fill_in "Year", with: @work.year
    click_on "Update Work"

    assert_text "Work was successfully updated"
    click_on "Back"
  end

  it "destroying a Work" do
    visit works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work was successfully destroyed"
  end
end
