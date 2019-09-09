# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importing::ImportFileProcessJob do
  let(:import_file) { FactoryBot.create(:import_file) }

  it 'runs a processor' do
    expect(Importing::ContentProcessor).to receive(:call).with(import_file)
    described_class.perform_now(import_file.id)
  end
end
