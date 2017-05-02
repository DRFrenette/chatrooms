class SessionsController < Devise::SessionsController
  def create
    super
    cookies[:action_cable_id] = current_user.id
  end

  def destroy
    cookies[:action_cable_id] = "signed out"
    super
  end
end
