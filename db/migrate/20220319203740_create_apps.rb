class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.string :job_title
      t.date :application_deadline
      t.date :applied_date
      t.string :application_status
      t.references :company, index: true, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
