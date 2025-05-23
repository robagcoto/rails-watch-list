class BookmarksController < ApplicationController
  #   def index
  #   @lists = List.all
  # end

  # def show
  #   @list = List.find(params[:id])
  # end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end

    def destroy

    end

  end

private

  def bookmark_params
    params.require(:bookmark).permit(:name, :comment, :list_id, :movie_id)
  end
end
