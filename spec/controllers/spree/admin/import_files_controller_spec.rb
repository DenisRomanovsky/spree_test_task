# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::Admin::ImportFilesController, type: :controller do
  describe 'GET new' do
    # Need to stub authorization in Spree admin, but have no idea how to do it right now.
    xit 'renders the index template' do
      get :new, params: { use_route: 'admin/import_files/new' }
      expect(response).to render_template('new')
    end
  end
end
