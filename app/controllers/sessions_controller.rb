class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @user = User.new
  end

  def destroy
    reset_session
  end
end
