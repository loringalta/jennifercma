require 'pp'
class FindFoodsController < ApplicationController
  include Rails.application.routes.url_helpers
  skip_before_filter :verify_authenticity_token
  @@search_query
  @@num_results = 10
  def create
    validate_params
  end

  def food_info
    find_foods
    respond_to do |format|
      format.json { render json: @search_body_hash }
    end
  end

  def dashboard
    respond_to do |format|
      format.html { render partial: 'find_foods/dashboard' }
    end
  end

  def destroy
    FindFood.delete_all
    respond_to do |format|
      format.html { render partial: 'find_foods/dashboard' }
    end
    head :no_content
  end

  def update
    search = Validate::AddFood.new(params)
      if search.valid?
        @@search_query = search.add_name.gsub(' ', '%20')
        # render(html: { render partial: 'find_foods/dashboard' })
      else
        render(json: { error: search.errors })
      end
  end

  private

  def validate_params
    search = Validate::FindFood.new(params)
    if search.valid?
      @@search_query = search.search.gsub(' ', '%20')
      @@num_results = search.num_results
      render(json: { success: "yay" })
    else
      render(json: { error: search.errors })
    end
  end

  def find_foods
    if FindFood.where(search_query: @@search_query).where(num_results: @@num_results).blank?
      @search_body_hash = FindFood.json_parse_result(@@search_query, @@num_results)
      check_error_status
    else
      @search_body_hash = FindFood.where(search_query: @@search_query).where(num_results: @@num_results)
    end
  end

  def create_find_food
    @search_body_hash.each do |h|
      @food = FindFood.new
      @food.search_query = @@search_query
      @food.num_results = @@num_results
      @food.name = h.name
      @food.group = h.group
      @food.nutrients = h.nutrients
      @food.food_id = h.id
      @food.save!
    end
  end

  def check_error_status
    if @search_body_hash[0]['status']
      @search_body_hash = @search_body_hash[0]
    else
      create_find_food
    end
  end

  def isQuery?
    @@search_query.nil? || @@search_query.empty?
  end
end
