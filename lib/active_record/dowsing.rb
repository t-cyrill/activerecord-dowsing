require 'active_record/dowsing/version'

module ActiveRecord
  module Dowsing
    class Railtie < ::Rails::Railtie
      initializer 'ActiveRecord::Dowsing patch' do
        require 'active_record/dowsing/patch'
      end
    end
  end
end
