class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    user = Validate::AddUser.new(params)
    if user.valid?
      user = create_user(params)
      @user = user
      render template: 'static_pages/home'
    else
      render template: 'sessions/new'
    end
  end

  private

  def create_user(user)
    new_user = User.new
    new_user.name = user['username']
    new_user.email = user['email']
    new_user.password = user['password']
    new_user.save!
    new_user
  end
end
