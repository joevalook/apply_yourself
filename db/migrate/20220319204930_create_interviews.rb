class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.integer :interview_number
      t.date :interview_date
      t.references :app, index: true, foreign_key: {on_delete: :cascade}
      t.string :interview_type
      t.text :interview_notes
      t.boolean :thank_you

      t.timestamps
    end
  end
end
