require 'rails_helper'

RSpec.describe Sudoku, type: :model do
  # it { should belong_to(:user) }
  # it { should belong_to(:departured).class_name('Airport')
  #                                   .with_foreign_key('departured_id') }
  # it { should belong_to(:arrived).class_name('Airport')
  #                                 .with_foreign_key('arrived_id') }

  before(:all) do
    # @admin = create(:user, role: 'admin')
    # @user = create(:user)
    # @airport1 = create(:airport, iata_code: 'VLC')
    # @airport2 = create(:airport, iata_code: 'LGW')
    # @flight = create(:flight, user_id: @user.id, departured_id: @airport1.id,
    #                   arrived_id: @airport2.id)
  end

  context 'generate a new sudoku values' do
    it 'it has 9 rows' do
      expect(Sudoku.generate.size).to Sudoku::NCOLUMNS
    end

    it 'it has 9 columns' do

    end

    it '' do

    end
  end
  # context "with 2 or more comments" do
  #   it "orders them in reverse chronologically" do
  #     post = Post.create!
  #     comment1 = post.comments.create!(:body => "first comment")
  #     comment2 = post.comments.create!(:body => "second comment")
  #     expect(post.reload.comments).to eq([comment2, comment1])
  #   end
  # end
end
