module Importing
  class ContentProcessor

    require 'csv'

    def initialize(import_file)
      @import_file = import_file
      @file_content = import_file.file_contents
    end

    def self.call(file_content)
      new(file_content).call
    end

    def call
      Spree::Product.import!(products)
    rescue ActiveRecord::RecordInvalid => error
      save_error(error)
    ensure
      finalize_import_file
    end

    private

    attr_reader :file_content, :import_file

    def products
      parsed_csv.inject([]) do |memo, row|
        memo << Spree::Product.new(item_attributes(row))
      end
    end

    def parsed_csv
      CSV.parse(file_content, :headers => true, col_sep: ';')
    end

    def item_attributes(row)
      row.to_h.slice(*Spree::Product.attribute_names)
    end

    def save_error(error)
      import_file.update(processing_errors: error.message)
    end

    def finalize_import_file
      import_file.update(processed: true)
    end
  end
end
