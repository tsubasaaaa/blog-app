class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text          :blog
      t.references    :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
