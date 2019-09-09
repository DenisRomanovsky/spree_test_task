# frozen_string_literal: true

FactoryBot.define do
  factory :import_file, :class => Importing::ImportFile do
    file_name { 'test_file.csv' }
    content_type { 'csv' }
    file_contents { 'basic content' }

    trait :with_content do
      file_contents { File.read('spec/fixtures/test.csv') }
    end
  end
end
