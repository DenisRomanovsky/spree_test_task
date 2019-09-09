# frozen_string_literal: true

FactoryBot.define do
  factory :importing_file, :class => Importing::ImportFile do
    file_name { 'test_file.csv' }
    content_type { 'csv' }
    file_contents { 'basic content' }
  end
end
