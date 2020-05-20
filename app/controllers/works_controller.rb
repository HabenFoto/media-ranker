class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
 
  def index
    @books = Work.books
    @albums = Work.albums
    @movies = Work.movies
  

  end
  

  # GET /works/1
 
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  
  def create
    @work = Work.new(work_params)

      if @work.save
        redirect_to @work, notice: 'Work was successfully created.' 
      else
        render :new 
      end
    
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
  
      if @work.update(work_params)
        redirect_to @work, notice: 'Work was successfully updated.'
      else
       render :edit 
      end
    
  end

  # DELETE /works/1
 
  def destroy
    @work.destroy
     redirect_to works_url, notice: 'Work was successfully destroyed.' 
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:category, :title, :creator, :year, :description)
    end
end
