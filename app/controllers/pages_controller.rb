class PagesController < ApplicationController
#  before_action :set_page, except: [:index, :new, :create]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
#    render plain: @page.title
  end

  def new
    @page = Page.new
  end

  def create
#    @page = Page.new(params)
#    render plain: params.to_json
    @page = Page.new(page_params)
    @page.save
    redirect_to @page
  end

  def edit
  end

  def update
    @page.update(page_params)
    redirect_to @page
  end

  def destroy
    @page.destroy
    redirect_to pages_path
  end

  private

    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end

    def set_page
      @page = Page.find(params[:id])
    end
end
