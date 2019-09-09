# frozen_string_literal: true

module Importing
  class ImportFileProcessJob < ApplicationJob
    def perform(import_file_id)
      import_file = ImportFile.find(import_file_id)
      ContentProcessor.call(import_file.file_contents)
    end
  end
end
