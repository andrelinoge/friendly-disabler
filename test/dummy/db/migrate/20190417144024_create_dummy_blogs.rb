class CreateDummyBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_blogs do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
