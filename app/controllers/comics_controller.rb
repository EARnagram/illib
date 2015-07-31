class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit]

  before_action :authenticate, except: [:index, :show ]

  def edit
    @comic = Comic.find(params[:id])
  end

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def show
  end

  def create
    @comic = Comic.new(comic_params)
      if @comic.save
        current_user.comics << @comic
        redirect_to current_user
      else
        render 'new'
      end
  end

  def update
    @comic = current_user.comics.find(params[:id])
    if @comic.update_attributes(comic_params)
      redirect_to user_path(current_user), notice: 'Comic updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to current_user
  end


  def loan
    @comic = Comic.find(params[:comic_id])
    @comic.loan = true
    @comic.checkin = params[:checkin]
    @comic.save
    redirect_to current_user
  end

  def loan_check
    @comic = Comic.find(params[:comic_id])
  end

  def checkin
    @comic = Comic.find(params[:comic_id])
    @comic.loan = false
    @comic.checkin = ''
    @comic.save
    redirect_to current_user
  end

  def checkin_check
    @comic = Comic.find(params[:comic_id])
  end

private
    def set_comic
      @comic = Comic.find(params[:id])
    end


    def comic_params
      params.require(:comic).permit(:title, :series, :issue_no, :loan, :checkin, :creator, :author, :publisher, :penciller, :inker, :colorist, :letterist, :publish_date, :img_url, :print_num)
    end

end
