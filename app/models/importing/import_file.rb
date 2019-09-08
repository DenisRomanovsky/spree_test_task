# frozen_string_literal: true

module Importing
  class ImportFile < ActiveRecord::Base
    validates_presence_of :file_name, :file_contents
  end
end
