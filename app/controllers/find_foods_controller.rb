require 'pp'
class FindFoodsController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  @@search_query
  @@food
  # GET /find_foods
  # GET /find_foods.json
  def index
    @find_foods = FindFood.all

    render json: @find_foods
  end

  # GET /find_foods/1
  # GET /find_foods/1.json
  def show
    render json: @find_food
  end

  def create
    @@search_query = params[:name].downcase.gsub(' ', '%20')
    @@num_results = params[:results].to_i
    render status: 200 unless @@search_query.nil?
  end

  # PATCH/PUT /find_foods/1
  # PATCH/PUT /find_foods/1.json
  def update
    @find_food = FindFood.find(params[:id])

    if @find_food.update(find_food_params)
      head :no_content
    else
      render json: @find_food.errors, status: :unprocessable_entity
    end
  end

  def food_info
    if isQuery?
      @search_body_hash = {empty: "No Entries Returned"}
    else
      find_foods
    end
    respond_to do |format|
        format.json {render json: @search_body_hash}
    end
  end

  # DELETE /find_foods/1
  # DELETE /find_foods/1.json
  def destroy
    respond_to do |format|
      format.html { render partial: 'find_foods/dashboard' }
    end
    head :no_content
  end

  def find_food
  end

  def add_food
    @@search_query = params[:add_name].downcase.gsub(' ', '%20')
    respond_to do |format|
      format.html {render partial: "find_foods/dashboard"}
    end
  end

  def dashboard
    respond_to do |format|
      format.html {render partial: "find_foods/dashboard"}
    end
  end

  private

  def isQuery?
    @@search_query.nil? || @@search_query.empty?
  end

  def find_foods
    if FindFood.where(search_query: @@search_query).where(num_results: @@num_results).blank?
      @search_body_hash = FindFood.json_parse_result(@@search_query, @@num_results)
      if @search_body_hash.length < 1 || @search_body_hash[0] == "no results"
        @search_body_hash = {empty: "No Entries Returned"}
      else
        @search_body_hash.each do |h|
          @food = FindFood.new
          @food.search_query = @@search_query
          @food.num_results = @@num_results
          @food.name = h.name
          @food.group = h.group
          @food.nutrients = h.nutrients
          @food.food_id = h.id
          @food.save
        end
      end
    else
      @search_body_hash = FindFood.where(search_query: @@search_query)
    end
  end
end
