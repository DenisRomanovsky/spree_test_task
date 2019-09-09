# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::ContentProcessor do
  subject { described_class.call(import_file) }
  let(:import_file) { FactoryBot.create(:import_file, :with_content) }

  it 'creates products' do
    expect { subject }.to change { Spree::Product.all.size }.by(3)
    expect(import_file.processed).to be_truthy
  end
end
