class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :email
      t.string :key
    end
  end
end
