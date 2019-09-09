# frozen_string_literal: true

module Spree
  module Admin
    class ImportFilesController < Admin::BaseController
      def new; end

      def create
        if Importing::Uploader.call(import_file_params[:file])
          flash[:notice] = 'File imported sucessfully.'
          redirect_to admin_import_files_path
        else
          flash[:error] = 'Something went wrong, please, try again.'
          redirect_to new_admin_import_file_path
        end
      end

      def index
        @import_files = Importing::ImportFile.last(10)
      end

      private

      def import_file_params
        params.require(:import_file).permit(:file)
      end
    end
  end
end
