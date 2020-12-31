class CatsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cats, :birth_date, false
    change_column_null :cats, :color, false
    change_column_null :cats, :name, false
    change_column_null :cats, :sex, false
    change_column_null :cats, :description, false
  end
end
