class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit]

  before_action :authenticate, except: [:index, :show ]

  def edit
  end

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def show
  end

  def loan
    @comic = Comic.find(params[:id])
    current_user.comics << comic
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :series, :issue_no, :loan, :checkin, :author, :publisher, :penciller, :inker, :colorist, :letterist, :publish_date, :img_url, :print_num)
    end

end
