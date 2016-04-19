module ActiveRecord
  module Dowsing
    module Patch
      def self.included(klass)
        klass.class_eval do
          alias_method :_original_execute, :execute
          alias_method :execute, :custom_execute

          @@app_name = ''
          if Rails.configuration.x.activerecord_dowsing.try(:with_app_name)
            @@app_name = "##{Rails.application.class.parent_name.downcase}"
          end
        end
      end

      def filter(stack)
        unless @cleaner
          @cleaner = ActiveSupport::BacktraceCleaner.new
          @cleaner.add_filter   { |line| line.gsub(Rails.root.to_s, '') }
          @cleaner.add_silencer { |line| line =~ /gems/ }
        end
        @cleaner.clean(stack)
      end

      def custom_execute(sql, name = nil)
        _original_execute("#{sql} /* #{filter(caller).first}#{@@app_name} */", name)
      end
    end
  end
end
