class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions, id: :uuid do |t|
      t.string :reference
      t.string :title
      t.string :company_name
      t.string :update_uri

      t.timestamps
    end
  end
end
