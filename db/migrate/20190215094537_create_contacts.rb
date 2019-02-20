class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :username
      t.string :email
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
