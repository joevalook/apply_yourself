class AddJobTitleToApps < ActiveRecord::Migration[6.1]
  def change
    add_column :apps, :job_title, :string
  end
end
