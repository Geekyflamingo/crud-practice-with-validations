class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :description
      t.string :user
      t.integer :number_of_likes
      
      t.timestamps
    end
  end
end
