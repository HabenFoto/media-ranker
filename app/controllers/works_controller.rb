class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy, :upvote]

  # GET
  def index
    @books = Work.books
    @albums = Work.albums
    @movies = Work.movies
  end

  # GET
  def show
  end

  # GET
  def new
    @work = Work.new
  end

  # POST
  def create
    @work = Work.new(work_params)

    if @work.save ## save returns true if the database insert succeeds
      flash[:success] = "Work was successfully created."
      redirect_to @work  # go to the index so we can see the book in the list
      return
    else # save failed
      flash.now[:error] = "Work was not created."
      render :new, status: :bad_request # show the new book form view again
      return
    end
  end

  # GET
  def edit
  end

  # PATCH/PUT

  def update
    if @work.update(work_params)
      flash[:success] = "Work was successfully updated."
      redirect_to @work
      return
    else
      flash.now[:error] = "Work was not found."
      render :edit, status: :bad_request
      return
    end
  end

  # DELETE

  def destroy
    @work.destroy
    redirect_to works_url, notice: "Work was successfully deleted."
  end

  # POST
  def upvote # should be a post, and redirect to homepage
    if session[:user_id]
      user = current_user
      @vote = Vote.new(user_id: user.id, work_id: @work.id)

      if @vote.save # save returns true if the database insert succeeds
        flash[:success] = " Thank you, your vote has been saved."
        redirect_to works_path  # go to the index so we can see the book in the list
        return
      else
        flash[:danger] = "Voting for the same work is not allowed."
        redirect_to works_path # back to voting
        return
      end
    elsif session[:user_id] == nil
      flash[:danger] = "You must be loggen in to vote. "
      redirect_to works_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work
    @work = Work.find(params[:id])

    if @work.nil?
      head :not_found
      return
    end
  end

  # Only allow a list of trusted parameters through.
  def work_params
    params.require(:work).permit(:category, :title, :creator, :year, :description)
  end
end
