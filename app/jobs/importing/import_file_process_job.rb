# frozen_string_literal: true

module Importing
  class ImportFileProcessJob < ApplicationJob
    def perform(import_file_id)
      ContentProcessor.call(ImportFile.find(import_file_id))
    end
  end
end
