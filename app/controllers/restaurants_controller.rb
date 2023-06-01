class RestaurantsController < ApplicationController
  #before_action :set_restaurant, only: %i[ show edit update destroy ]
  before_action :confirm_delete?, only: %i[:destroy]
  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])
    restaurant_params = params.require(:restaurant).permit(:name, :address)
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
    if confirm_delete?
      Restaurant.transaction do
        @items.destroy_all
        @restaurant.destroy
      end
      if @restaurant.destroyed?
        flash[:notice] = "El restaurante y sus items asociados han sido eliminados correctamente."
      else
        flash[:alert] = "Ocurrió un error al eliminar el restaurante."
      end
    else
      flash[:alert] = "La eliminación del restaurante ha sido cancelada."
    end
    redirect_to restaurants_url unless performed?
  end

  private

  def confirm_delete?
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.items
    confirm_message = "¿Estás seguro de que deseas eliminar el restaurante?\n\nLos siguientes items también serán eliminados:\n\n"
    confirm_message += @items.map(&:name).join(', ') + "\n\nHaz clic en 'Aceptar' para eliminarlos o en 'Cancelar' para mantenerlos."

    if params[:confirm_delete] == 'true'
      true
    else
      respond_to do |format|
        format.html { render 'confirm_delete', layout: false } unless performed?
        format.js { render 'confirm_delete.js.erb' } unless performed?
      end
      false
    end
  end
    # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
