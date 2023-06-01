class ItemsController < ApplicationController
  #before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @items = @restaurant.items.all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
    @restaurant = @item.restaurant
  end

  # GET /items/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.build
  end

  # GET /items/1/edit
  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.find(params[:id])
  end

  # POST /items or /items.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.build(item_params) # Usar build en lugar de new

    respond_to do |format|
      if @item.save
        format.html { redirect_to restaurant_item_url(@restaurant, @item), notice: "Item was successfully created." } # Ajustar la redirección
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /items/1 or /items/1.json
  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = @restaurant.items.find(params[:id])
    item_params = params.require(:item).permit(:name, :price, :callories, :restaurant_id, :dish_id)
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to restaurant_item_url(@restaurant, @item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @restaurant = @item.restaurant
    @item.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_items_url(@restaurant), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :callories, :restaurant_id, :dish_id, :_method)
    end
end
