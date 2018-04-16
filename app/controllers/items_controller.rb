class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  # Authorized routes require setting headers:
  # X-User-Token and X-User-Email in the client's request
  # (see simple_token_authentication gem documentation)

  # GET /items
  def index
    @items = Item.all
    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    if current_user
      # authorized
      @item = Item.new(item_params)

      if @item.save
        render json: @item, status: :created, location: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    else
      return head(:unauthorized)
    end
  end

  # PATCH/PUT /items/1
  def update
    if current_user
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    else
      return head(:unauthorized)
    end
  end

  # DELETE /items/1
  def destroy
    if current_user
      # authorized
      if @item.destroy
        render json: {
          status: 200,
          message: "'#{@item.artist} - #{@item.title}' removed"
        }
      else
        render json: {
          message: "Item was not removed"
        }
      end
    else
      return head(:unauthorized)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:artist, :title, :cost, :image, :description)
    end
end
