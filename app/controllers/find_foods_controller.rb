require 'pp'
require 'json'
class FindFoodsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  @@search_query
  def create
    @@search_query = params[:name].downcase.gsub(" ", "%20")
    if @@search_query != nil
      render :status => 200
    end
  end

  def dashboard
    respond_to do |format|
      format.html {render partial: "find_foods/dashboard"}
    end
  end

  def food_info
    search_body_hash = FindFood.json_parse_result(@@search_query)
    respond_to do |format|
      format.html { render partial: "find_foods/food_info",
                    locals: {search_body: search_body_hash}}
      format.json {render json: search_body_hash}
    end
  end
end
