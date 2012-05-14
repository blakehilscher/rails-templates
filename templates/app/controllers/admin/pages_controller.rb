class Admin::PagesController < AdminController
  
  respond_to :html, :json
  
  def index
    respond_with @pages = Page.page(params[:page])
  end

  def show
    respond_with @page = Page.find(params[:id])
  end

  def new
    respond_with @page = Page.new
  end

  def edit
    respond_with @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    
    if @page.save
      flash[:success] = 'The page was successfully created.'
      redirect_to edit_admin_page_url(@page)
    else
      flash[:error] = 'There was an error with the page creation.'
      respond_with @page
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    flash[:success] = "The page was successfully updated. <a href='/pages/#{@page.slug}' target='blank'>View it on the live website!</a>"
    respond_with @page, :location => edit_admin_page_url
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_with @page, :location => admin_pages_url
  end
  
end