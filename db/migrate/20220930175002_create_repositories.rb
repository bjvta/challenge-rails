# frozen_string_literal: true

class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :name, null: false, limit: 255
      t.text :tags, null: false, limit: 1024
      t.references :profile, index: true
      t.timestamps
    end
  end
end
