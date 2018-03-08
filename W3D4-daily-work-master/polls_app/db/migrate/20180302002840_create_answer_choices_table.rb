class CreateAnswerChoicesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.string :text, null: false
      t.integer :user_id, null: false
      t.integer :quetion_id, null: false
      t.timestamps
    end
  end
end
