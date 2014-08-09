class RegistrationsController < Devise::RegistrationsController
  protected

    def after_sign_up_path_for(resource)
      search_index_path
    end

    def after_inactive_sign_up_path_for(resource)
      search_index_path
    end
end
