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

    it 'is invalid without a title' do
      # arrange
      @work.title = nil
      
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

    describe 'relations' do
      it "has category" do
        expect(@work.category).must_equal 'album'
      end
  
      it "can set the category" do
        work = Work.new(title: "test work")
        work.category = 'album'
        expect(work.category).must_equal 'album'
      end
    end
  end

   
end

