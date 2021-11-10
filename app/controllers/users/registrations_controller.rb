# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_account_update_params, only: [:update]

    def build_resource(hash = {})
      hash[:uid] = User.create_unique_string
      super
    end

    private

    def after_sign_up_path_for(resource)
      mypage_user_url(resource)
    end

    def after_update_path_for(resource)
      mypage_user_url(resource)
    end

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
  end
end
