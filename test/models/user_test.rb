require "test_helper"

describe User do
  describe "validations" do
    before do
      @user = User.new(username: "Haben")
    end

    it "is valid when there is a username" do
      expect(@user.valid?).must_equal true
    end

    it "is invalid when there is no username" do
      expect(@user.valid?).must_equal true

      @user.username = nil
      expect(@user.valid?).must_equal false
      expect(@user.errors.messages).must_include :username
    end
  end

  describe "relationships" do
    let (:new_work) {
      Work.create(category: "movie", title: "Get Out", creator: "Jordan Peele", year: "2017", description: "A Scarey and Funny movie")
    }
    let (:work_two) {
      Work.create(category: "book", title: "Becoming", creator: "Michelle Obama", year: "2018", description: "Life")
    }

    let (:user_one) {
      User.create(username: "hello")
    }

    it "can have many votes" do
      vote_1 = Vote.create(user_id: user_one.id, work_id: work_two.id)
      vote_2 = Vote.create(user_id: user_one.id, work_id: new_work.id)

      expect(user_one.votes.count).must_equal 2
      expect(user_one.votes.first).must_be_instance_of Vote
    end
  end
end
