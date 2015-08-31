class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    user = Validate::AddUser.new(params)
    if user.valid?
      user = check_user(params)
      render template: 'static_pages/home'
    else
      render template: 'sessions/new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log the user in and redirect to the user show page

    else
      # create an error message
    end
  end

  def destroy
    reset_session
  end

  private

  def check_user(params)

  end
end
