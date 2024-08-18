# frozen_string_literal: true

# Create Countries migration
class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :official_name
      t.string :iso_alpha_two
      t.string :iso_alpha_three
      t.string :iso_numeric
      t.string :subdivision_codes
      t.string :tld
      t.string :public_id
      t.string :sovereignty

      t.timestamps null: false
    end

    add_index :countries, :name, unique: true
    add_index :countries, :iso_alpha_two, unique: true
    add_index :countries, :iso_alpha_three, unique: true
    add_index :countries, :iso_numeric, unique: true
    add_index :countries, :public_id, unique: true
  end
end
