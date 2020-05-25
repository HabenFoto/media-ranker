require "test_helper"

describe Work do

  describe 'validations' do
    before do
      # arrange
      @work = Work.new(title: 'test work', category: 'album')
    end

    it 'is valid when title and category are present' do
      # act
      result = @work.valid?

      # assert
      expect(result).must_equal true
    end

    it 'is invalid if title is nil' do
      # arrange
      @work.title = nil
      
      # act
      result = @work.valid?

      # assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title
    end

    it 'is invalid if title is "" 'do
      # arrange
      @work.title = ""
      
      # act
      result = @work.valid?

      # assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title
    end

    it 'is invalid if the title in the same category already exists' do
      # arrange
      unique_work = Work.create!(title: 'original title', category: 'album' )
      @work.title = unique_work.title

      # act
      result = @work.valid?

      # assert
      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title
    end

    it "has category" do
      expect(@work.category).must_equal 'album'
    end

    it "can set the category" do
      work = Work.new(title: "test work")
      work.category = 'album'
      expect(work.category).must_equal 'album'
    end
  end



    # describe 'relationship' do
  
    #   it "has votes" do

    #   end

    #   it "has users through votes" do
        
    #   end
    # end

  describe 'relationship' do

    let (:new_work) {
      Work.create(category: "book", title: "Hello Town", creator: "Laury Walter", year: "2005", description: "Est sed ut asperiores sed fugiat.")
    }

    let (:user_one) {
      User.create(username: "laury")
    }

    let (:user_two) {
      User.create(username: "walter")
    }
      it "can have many votes" do

        vote_1 = Vote.create(user_id: user_one.id, work_id: new_work.id)
        vote_2 = Vote.create(user_id: user_two.id, work_id: new_work.id)

        expect(new_work.votes.count).must_equal 2
        expect(new_work.votes.first).must_be_instance_of Vote
      end
    end

   describe ' custome method test' do
    before do
      user1 = users(:user_1).id
      user2 = users(:user_2).id
      work1 = works(:black_panther).id
      work2 = works(:lovely).id
      work3 = works(:vegetarian).id
      vote_1 = Vote.create(user_id: user2, work_id: work2)
      vote_2 = Vote.create(user_id: user1, work_id: work2)
      vote_3 = Vote.create(user_id: user2, work_id: work1)
      vote_4 = Vote.create(user_id: user1, work_id: work3)
     end

   it "spotlight" do
    top = Work.spotlight
    expect(top).must_be_instance_of Work
    expect(top.votes.count).must_equal 2
   end
   
  end
end
