class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.string :job_title
      t.string :resume
      t.string :cover_letter
      t.string :project
      t.date :project_deadline
      t.date :application_deadline
      t.date :applied_date
      t.string :application_status
      t.boolean :archive
      t.references :company, index: true, foreign_key: {on_delete: :cascade}
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.text :notes

      t.timestamps
    end
  end
end
