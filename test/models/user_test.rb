require "test_helper"

describe User do

  before do
    # arrange
    @user = User.new(username: 'Haben')
  end

  it 'is valid when there is a username' do

    # act & assert
    expect(@user.valid?).must_equal true
  end

  it 'is invalid when there is no username' do

    # act & assert
    expect(@user.valid?).must_equal true
   
    # act
    @user.username = nil

    # assert
    expect(@user.valid?).must_equal false
    expect(@user.errors.messages).must_include :username
  end
  

end
