require "spec_helper"

feature "user can sign in -" do
  let(:user) { create :user }

  specify "successfully" do
    visit "/"

    within "#tab-login" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password

      click_on "Login"
    end

    expect(page).to have_content "Signed In as #{user.name}"
  end

  specify "unsuccessfully" do
    visit "/"

    within "#tab-login" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: "WrongPassword"

      click_on "Login"
    end

    expect(page).to have_content "Login to your Account"
  end
end
