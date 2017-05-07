class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to new_user_session_path anchor: "tab-register"
  end

  def create
    super
    cookies[:action_cable_id] = resource.id
  end
end
