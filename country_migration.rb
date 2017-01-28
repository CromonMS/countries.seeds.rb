# frozen_string_literal: true
# rails g model Country name:string iso_two_letter_code:string

# Create Countries migration
class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_two_letter_code

      t.timestamps null: false

      add_index(:countries, :name)
      add_index(:countries, :iso_two_letter_code)
    end
  end
end
