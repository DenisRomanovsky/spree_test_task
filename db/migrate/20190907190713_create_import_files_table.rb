class CreateImportFilesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :import_files do |t|
      t.string :name
      t.binary :content
      t.boolean :processed
      t.string :processing_errors
      t.timestamps
    end
  end
end
