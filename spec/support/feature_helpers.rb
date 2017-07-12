module FeatureHelpers
  def sign_in_user(user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Login"
  end

  def sign_out_user
    click_link "Sign Out"
  end

  def open_side_panel
    within "#side-panel-trigger" do
      find(".icon-line-layout").click
    end
  end

  def close_side_panel
    find(".body-overlay").click
  end

  def open!
    save_and_open_page
  end

  def screenshot!
    save_and_open_screenshot
  end

  def select2(choice, options)
    find(".#{options[:from]} span.select2").click
    find(".select2-results__option", text: choice).click
  end
end
