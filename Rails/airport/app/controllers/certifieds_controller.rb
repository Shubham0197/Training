class CertifiedsController < ApplicationController
  def index
    @certifieds = Certified.includes(:pilots, :aircraft)
  end

  def new
    @certified = Certified.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    certified = Certified.find(params[:id])
    if certified.destroy
      flash[:notice] = 'Certifieds destroyed'
      redirect_to(certifieds_path)
    end
  end

end
