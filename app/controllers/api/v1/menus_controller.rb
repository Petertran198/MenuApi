module Api::V1

  class MenusController < ApiController
    before_action :set_menu, only: [:show,:update]
    before_action :authenticate_user


    def index
      @menus = Menu.all
      render json: @menus 
    end
    
    def show 
      render json: @menu
    end

    def create 
      @menu = Menu.new(menu_params)
      if @menu.save
        render json: @menu
      else
        render json: @menu.errors, status: 400
      end
    end

    def update
      if @menu.update
        render json: @menu
      else
        render json: @menu.errors, status: 400
      end
    end
    

    private

    def set_menu
      @menu = Menu.find(params[:id])
    end
    def menu_params 
      params.require(:menu).permit(:name)
    end


  end
end