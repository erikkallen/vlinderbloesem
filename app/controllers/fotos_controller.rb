class FotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_fotos, :only => [:show, :index]
  # GET /fotos
  # GET /fotos.json

  def show
    @selected = @fotos.select{|p| p.id == params[:id]}.first || @fotos.first


    respond_to do |format|
      format.html # show.html.erb
      format.js 
    end
  end


  def index
    @selected = @fotos.first

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  private
    def get_fotos
      @album = Foto.find_by_title "website"
      @fotos = @album.photos
    end

end
