require "spec_helper"

describe "attach page videos" do
  login_refinery_user

  before(:each) do
    Factory(:page)

    visit refinery.admin_pages_path

    click_link "Edit this page"
  end

  it "shows videos tab" do
    within "#custom_videos_tab" do
      page.should have_content("Videos")
    end
  end

  # This spec actually is broken in a way because Add Video link would
  # be visible to capybara even if we don't click on Videos tab.
  it "shows add video link" do
    within "#custom_videos_tab" do
      click_link "Videos"
    end

    page.should have_content("Add Video")
  end
end
