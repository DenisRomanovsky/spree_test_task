# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::ImportFile, type: :model do
  let(:params) { { file_name: 'new.csv', file_contents: 'test content' } }

  it 'is valid with valid attributes' do
    expect(described_class.new(params)).to be_valid
  end

  context 'when params are not valid' do
    let(:params) { { file_name: '', file_contents: '' } }

    it 'is not valid' do
      expect(described_class.new(params)).to_not be_valid
    end
  end
end
