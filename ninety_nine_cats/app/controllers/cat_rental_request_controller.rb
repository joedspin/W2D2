class CatRentalRequests < ApplicationController

  
  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :show
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :edit
  end
  def create
    cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if cat_rental_request.save
      redirect_to cat_rental_request_url(cat_rental_request)
    else
      render json: cat_rental_request.errors.full_messages, status: 422
    end
  end

  def update
    cat_rental_request = CatRentalRequest.find(params[:id])
    if cat_rental_request.update(cat_rental_request_params)
      redirect_to cat_rental_request_url(params[:id])
    else
      render json: cat_rental_request.errors.full_messages
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end


end