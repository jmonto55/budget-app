class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
