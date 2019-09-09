# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::ImportFileProcessJob do
  let(:importing_file) { FactoryBot.create(:importing_file) }

  it 'runs a processor' do
    expect(Importing::ContentProcessor).to receive(:call).with(importing_file.file_contents)
    described_class.perform_now(importing_file.id)
  end
end
