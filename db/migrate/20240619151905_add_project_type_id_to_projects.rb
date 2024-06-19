class AddProjectTypeIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :project_type_id, :integer
  end
end
