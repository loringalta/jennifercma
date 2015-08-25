class CreateFindFoods < ActiveRecord::Migration
  def change
    create_table  :find_foods do |t|
      t.string    :search_query
      t.integer   :num_results
      t.string    :name
      t.string    :group
      t.integer   :food_id
      t.text      :nutrients
      t.timestamps null: false
    end

    create_table   :food_items do |f|
      f.belongs to :find_foods
      f.integer    :food_id
      f.string     :name
      f.string     :group
      f.text       :nutrients
    end

    create_table   :food_nutrients do |n|
      n.belongs to :food_items
      n.string     :name
      n.string     :unit
      n.string     :value
      n.text       :measures
    end
  end
end
