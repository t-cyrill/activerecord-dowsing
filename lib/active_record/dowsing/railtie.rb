module ActiveRecord
  module Dowsing
    class Railtie < ::Rails::Railtie
      config.activerecord_dowsing = ActiveSupport::OrderedOptions.new

      initializer 'ActiveRecord::Dowsing patch' do
        if Rails.configuration.activerecord_dowsing.enabled
          ActiveSupport.on_load :active_record do
            ActiveRecord::ConnectionAdapters::Mysql2Adapter.module_eval do
              include ActiveRecord::Dowsing::Patch
            end
          end
        end
      end
    end
  end
end
