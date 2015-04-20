class SetDefaultValueForChaletOwner < ActiveRecord::Migration
  def change
    change_column :users, :chalet_owner?, :boolean, default: false
  end
end
