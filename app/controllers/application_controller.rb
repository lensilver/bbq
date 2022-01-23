class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_user_can_edit?
  helper_method :event_organizer?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
        keys: [:password, :password_confirmation, :current_password]
    )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у неё взять .event
    # Если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && (
    model.user == current_user ||
    (model.try(:event).present? && model.event.user == current_user)
    )
  end

  def event_organizer?(event)
    unless current_user.nil?
      event.user == current_user || event.subscriptions.map(&:user_name).include?(current_user.name)
    end
  end
end
