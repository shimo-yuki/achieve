class RemoveColumnToBlogs < ActiveRecord::Migration[5.2]
  def up
    remove_column :blogs, :status
  end
  def down
    add_column :blogs, :title, :integer
  end
end
