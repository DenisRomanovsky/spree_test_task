module Importing
  class ContentProcessor

    require 'csv'

    def initialize(file_content)
      @file_content = file_content
    end

    def self.call(file_content)
      new(file_content).call
    end

    def call
      csv = CSV.parse(file_content, :headers => true, col_sep: ';')
      csv.each do |row|
        item = Spree::Product.new(item_attributes(row))
        item.save if item.valid?
      end
    end

    private

    attr_reader :file_content

    def item_attributes(row)
      row.to_h.slice(*Spree::Product.attribute_names)
    end
  end
end
