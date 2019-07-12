module Api::V1

  class ItemsController < ApiController
    before_action :set_items, only: [:show,:update]
    def index
      @items = Item.all
      render json: @items
    end
    def show
      render json: @item
    end
    def create 
      @item = Item.new(item_params)
      if @item.save 
        render json: @item
      else
        render json: @item.errors, status: 400
      end
    end

    def update
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: 400
      end
    end

    private
    def set_items
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name,:price,:desc, :menu_id)
    end

  end

end