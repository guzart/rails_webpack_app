require 'active_support/concern'
require 'action_view/helpers'

module Webpack
  #:nodoc:
  module AssetTagHelper
    extend ::ActiveSupport::Concern

    include ::ActionView::Helpers

    included do
      alias_method :orig_javascript_include_tag, :javascript_include_tag
      alias_method :orig_stylesheet_link_tag, :stylesheet_link_tag

      def javascript_include_tag(*sources)
        orig_javascript_include_tag(*sources)
      end

      def stylesheet_link_tag(*sources)
        return nil if Rails.application.config.webpack.dev_server
        orig_stylesheet_link_tag(*sources)
      end
    end
  end
end
