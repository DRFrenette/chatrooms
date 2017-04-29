class SessionsController < Devise::SessionsController
  def create
    cookies[:action_cable_id] = current_user.id
    super
  end

  def destroy
    cookies[:action_cable_id] = "signed out"
    super
  end
end
