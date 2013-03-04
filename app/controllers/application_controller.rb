class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter do
    add_crumb t("navigation.home"), root_path
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, flash: {error: exception.message}
  end
  
  protected
  
  def self.load_version
    before_filter do |controller|
      if params[:version].present?
        instance_name = params[:controller].sub("Controller", "").underscore.split('/').last.singularize
        instance = controller.instance_variable_get("@#{instance_name}")
        if instance
          # Reified object is the instance at the state before the change happend, so we get the object at the state after the asked version
          new_instance = instance.versions.where("id > ?", params[:version]).first.try(:reify)
          controller.instance_variable_set("@#{instance_name}", new_instance) if new_instance
        end
      end
    end
  end
end
