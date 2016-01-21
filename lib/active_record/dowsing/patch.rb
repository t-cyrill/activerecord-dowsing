module ActiveRecord
  module ConnectionAdapters
    class Mysql2Adapter < AbstractMysqlAdapter
      def filter(stack)
        unless @cleaner
          @cleaner = ActiveSupport::BacktraceCleaner.new
          @cleaner.add_filter   { |line| line.gsub(Rails.root.to_s, '') }
          @cleaner.add_silencer { |line| line =~ /gems/ }
        end
        @cleaner.clean(stack)
      end

      def execute(sql, name = nil)
        super("#{sql} /* #{filter(caller).first} */", name)
      end
    end
  end
end

