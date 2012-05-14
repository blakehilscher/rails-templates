class PagesController < ApplicationController
  
  respond_to :html, :json
  
  def show
    query = params[:id]
    if query.match(/^[0-9]+$/)
      @page = Page.find query
    else
      @page = Page.where(:slug => query).first
    end
    respond_with @page
  end
  
end