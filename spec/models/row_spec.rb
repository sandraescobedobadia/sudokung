require 'rails_helper'

RSpec.describe Row, type: :model do
  before(:all) do
    @row1 = Row.generate([], 0)
    @rows = [@row1]
    @row2 = Row.generate(@rows, 0)
  end

  context 'generate a new row' do
    let(:n_values) { 9 }

    it 'it has 9 values' do
      expect(@row2.size).to eq(n_values)
    end

    it 'it row values are differents' do
      expect(@row2.uniq.size).to eq(@row2.size)
    end
  end
end
