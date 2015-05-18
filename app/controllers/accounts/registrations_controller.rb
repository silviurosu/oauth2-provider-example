module Accounts
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_inactive_sign_up_path_for(_resource)
      '/awaiting_confirmation'
    end
  end
end
