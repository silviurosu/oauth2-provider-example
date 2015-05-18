class AccountsController < ApplicationController
  before_action :doorkeeper_authorize! # Require access token for all actions
  respond_to :json

  def show
    if current_account

      # TODO: return account.id and migrate all authorization
      # uid = current_account.id.to_s

      uid = current_account.email
      payload = {
        uid: uid, name: current_account.name,
        email: current_account.email, phone: current_account.phone
      }
      render json: payload
    else
      render json: { error: { code: 401, message: 'not authorized' } }
    end
  end

  private

  def current_account
    @current_account ||= Account.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
