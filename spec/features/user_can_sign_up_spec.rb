require "spec_helper"

feature "user can sign in -", :js do
  specify "successfully" do
    visit "/"
    click_link "No"

    within "#tab-register" do
      fill_in "user_name", with: "King Henry"
      fill_in "user_email", with: "KingHenry123@example.com"
      fill_in "user_password", with: "P@ssw0rd"
      fill_in "user_password_confirmation", with: "P@ssw0rd"

      click_on "Sign Up"
    end

    expect(page).to have_content "Signed In as King Henry".upcase
  end

  specify "unsuccessfully" do
    invalid_password = "!"

    visit "/"
    click_link "No"

    within "#tab-register" do
      fill_in "user_name", with: "King Henry"
      fill_in "user_email", with: "KingHenry123@example.com"
      fill_in "user_password", with: invalid_password
      fill_in "user_password_confirmation", with: invalid_password

      click_on "Sign Up"
    end

    expect(page).to have_content "Password is too short"
  end
end
