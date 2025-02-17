# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username, limit: 255, null: false
      t.boolean :superuser, null: false, default: false
      t.timestamps

      t.index :username, unique: true
    end
  end
end
