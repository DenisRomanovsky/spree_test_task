# frozen_string_literal: true

class CreateImportFilesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :import_files do |t|
      t.string :file_name
      t.string :content_type
      t.binary :file_contents
      t.boolean :processed, default: false
      t.string :processing_errors
      t.timestamps
    end
  end
end
