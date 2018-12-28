class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.column :search, :string
      t.timestamps
    end
  end
end
