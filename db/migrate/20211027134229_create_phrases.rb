class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.text :sentence
      t.string :from

      t.timestamps
    end
  end
end
