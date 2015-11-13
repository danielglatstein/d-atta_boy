class ChangeColumnNameTypeToResult < ActiveRecord::Migration
  def change
    rename_column :pitches, :type, :result
  end
end
