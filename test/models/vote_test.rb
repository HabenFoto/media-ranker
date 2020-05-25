require "test_helper"

describe Vote do

  let (:new_user) {
    User.create(username: "new_user1")  
  }

  let (:new_work) {
    Work.create(category: "book", title: "Becoming", creator: "Michelle Obama", year: "2018", description: "Life.")
  }
  

   let (:new_vote) {
    Vote.new(work_id: new_work.id, user_id: new_user.id)
  
   }

  it "can be instantiated" do
    expect(new_vote.valid?).must_equal true
  end
   
 
  describe 'validations' do

  
      before do 
      
      @user = User.create(username: "new user")
      end
    
      
      it "is valid when there is a user" do
      expect(@user.valid?).must_equal true
      end

    it "must have a user_id" do
    
      new_vote.user_id = nil
      
      expect(new_vote.valid?).must_equal false
      expect(new_vote.errors.messages).must_include :user_id
      expect(new_vote.errors.messages[:user_id]).must_equal ["can't be blank"]
    end


    it "return true when given a valid user_id" do
 
      new_vote.user_id = users(:user_1).id

    
      expect(new_vote.valid?).must_equal true
    end

  
    it "return true when given a valid work_id" do
     
      new_vote.work_id = works(:us).id

     
      expect(new_vote.valid?).must_equal true
    end

   end
  
    
    describe "relationships" do

      let (:work) {
        Work.create(category: "movies", title: "Lord of the Rings", creator: "Peter Jackson", year: "2001", description: "The Fellowship of the Ring")
      }
  
      let (:user) {
        User.create(username: "peterjackson")
      }
      let (:vote_one) {
        Vote.new(user_id: user.id, work_id: work.id)
      }

      it "can have one user" do
        vote_one.save
        expect(vote_one.user).must_be_instance_of User
      end

      it "can have one work" do
        vote_one.save
        expect(vote_one.work).must_be_instance_of Work
      end

      it "belongs to a work and user" do 
        expect(new_vote.work).must_be_instance_of Work
        expect(new_vote.user).must_be_instance_of User
  
        expect(new_vote.work.title).must_equal "Becoming"
        expect(new_vote.user.username).must_equal "new_user1"
      end
    
  end
end