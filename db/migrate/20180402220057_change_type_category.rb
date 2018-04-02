class ChangeTypeCategory < ActiveRecord::Migration[5.0]
  def change
    change_column(:comments, :comment, :string)
  end
end
