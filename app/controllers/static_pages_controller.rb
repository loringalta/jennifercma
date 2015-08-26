require "net/https"
require "uri"
require 'pp'

class StaticPagesController < ApplicationController
  def home
    user = Validate::AddUser.new(params)
    if user.valid?
      create_user(user)
    else
      
    end
  end

  private

  def create_user(user)
    new_user = User.new
    new_user.username = user.username
    new_user.email = user.email
    new_user.password = user.password
  end
end
