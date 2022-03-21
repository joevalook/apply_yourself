class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :website
      t.text :company_notes

      t.timestamps
    end
  end
end
