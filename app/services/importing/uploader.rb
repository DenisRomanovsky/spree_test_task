# frozen_string_literal: true

module Importing
  class Uploader
    def initialize(file)
      @file = file # params[:file]
    end

    def self.call(file)
      new(file).call
    end

    def call
      initiate_import_file
      validate_import_file
      save_import_file.tap do
        trigger_processing_job
      end
    end

    private

    attr_reader :file, :import_file, :import_file_valid

    def initiate_import_file
      @import_file = ImportFile.new(import_file_attributes)
    end

    def import_file_attributes
      {
        file_name: file.original_filename,
        content_type: file.content_type,
        file_contents: file.read
      }
    end

    def validate_import_file
      @import_file_valid = import_file.valid?
    end

    def save_import_file
      return unless import_file_valid

      import_file.save
    end

    def trigger_processing_job
      Importing::ImportFileProcessJob.perform_later(import_file.id) if import_file_valid
    end
  end
end
