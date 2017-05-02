class RegistrationsController < Devise::RegistrationsController
  def create
    super
    cookies[:action_cable_id] = resource.id
  end
end
