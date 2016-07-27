require 'rails'
require 'rails/railtie'
require 'active_support/ordered_options'
require 'webpack/asset_tag_helper'

module Webpack
  #:nodoc:
  class Railtie < ::Rails::Railtie
    config.webpack = ActiveSupport::OrderedOptions.new
    config.webpack.dev_server = true

    initializer 'webpack.configure_rails_initialization' do
      ::ActiveSupport.on_load :action_view do
        include ::Webpack::AssetTagHelper
      end
    end
  end
end
