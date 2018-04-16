class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :map, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
