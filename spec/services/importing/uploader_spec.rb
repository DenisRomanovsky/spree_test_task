# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::Uploader do
  subject { described_class.call(file) }
  let(:file) { Rack::Test::UploadedFile.new('spec/fixtures/test.csv', 'csv') }

  it 'creates import file' do
    expect(Importing::ImportFileProcessJob).to receive(:perform_later)
    expect { subject }.to change {
                            Importing::ImportFile.where(file_name: 'test.csv',
                                                        processed: false,
                                                        content_type: 'csv').size
                          } .by(1)
  end

  context 'when input is not valid' do
    before do
      allow(Importing::ImportFile).to receive(:new).and_return(double(valid?: false))
    end

    it 'does not create import file' do
      expect(Importing::ImportFileProcessJob).to_not receive(:perform_later)
      expect { subject }.to_not change { Importing::ImportFile.all.size }
    end
  end
end
