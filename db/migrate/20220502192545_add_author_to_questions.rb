class AddAuthorToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :author_id, :integer, column_options: { null: true }
    add_index :questions, :author_id
  end
end
