require 'spec_helper'

describe ActiveRecord::Dowsing do
  it 'has a version number' do
    expect(ActiveRecord::Dowsing::VERSION).not_to be nil
  end

  class DummyAdapter
    def execute(sql, name = nil)
      sql
    end
    include ActiveRecord::Dowsing::Patch
  end

  it 'returns caller-contained sql' do
    sql = 'SELECT `id` FROM `foo`'
    adapter = DummyAdapter.new
    expect(adapter.execute(sql)).to match %r(#{sql} /\* #{__FILE__}:\d+:in .+ */)
  end
end
