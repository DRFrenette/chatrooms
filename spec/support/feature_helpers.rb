module FeatureHelpers
  def sign_in_user(user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
  end

  def open!
    save_and_open_page
  end

  def screenshot!
    screenshot = page.send(:open_file, screenshot)
  end
end
