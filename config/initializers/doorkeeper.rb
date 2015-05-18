Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    current_account || warden.authenticate!(scope: :account)
  end

  admin_authenticator do
    if Rails.env.production? || Rails.env.staging?
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == 'secret'
      end
    end
  end

  use_refresh_token

  default_scopes :public
  optional_scopes :write, :admin

  # access_token_expires_in 2.hours
  force_ssl_in_redirect_uri false
end
