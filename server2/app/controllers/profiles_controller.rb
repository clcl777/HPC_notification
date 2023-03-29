class ProfilesController < ApplicationController
  before_action :basic_auth
  BASIC_AUTH_NAME = '123'
  BASIC_AUTH_PASSWORD = '123'

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == BASIC_AUTH_NAME && password == BASIC_AUTH_PASSWORD
    end
  end

  def index
    @users_profiles = UsersProfile.all
  end
end
