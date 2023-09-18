class HomeController < ApplicationController
  def top; 
    @users_profiles = UsersProfile.all
  end
end
