class AddNumberRequestToApis < ActiveRecord::Migration
  def change
    add_column :apis, :number_request, :integer, default: 0
  end
end
