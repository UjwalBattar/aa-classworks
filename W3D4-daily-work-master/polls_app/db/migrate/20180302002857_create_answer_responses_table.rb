class CreateAnswerResponsesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_responses do |t|
      t.integer :answer_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
