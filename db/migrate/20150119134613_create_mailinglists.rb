class CreateMailinglists < ActiveRecord::Migration
  def change
    create_table :mailinglists do |t|
      t.string :name
      t.string :list

      t.timestamps
    end
  end
end
