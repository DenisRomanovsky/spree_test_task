# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::ContentProcessor do
  subject { described_class.call(file.read) }
  let(:file) { Rack::Test::UploadedFile.new('spec/fixtures/test.csv', 'csv') }

  it 'creates products' do
    expect { subject }.to change { Spree::Product.all.size }.by(3)
  end
end
