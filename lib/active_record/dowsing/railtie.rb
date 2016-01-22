module ActiveRecord
  module Dowsing
    class Railtie < ::Rails::Railtie
      initializer 'ActiveRecord::Dowsing patch' do
        ActiveSupport.on_load :active_record do
          ActiveRecord::ConnectionAdapters::Mysql2Adapter.module_eval do
            include ActiveRecord::Dowsing::Patch
          end
        end
      end
    end
  end
end
