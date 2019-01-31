# frozen_string_literal: true

module Administration
  class ItemsController < ApplicationController
    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)

      if item.save
        flash[:notice] = "Item was successfully created!"
        redirect_to items_path
      else
        render 'new'
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])

      if item.update
        flash[:notice] = "Item was successfully updated!"
        redirect_to items_path
      else
        render 'edit'
      end
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to item_path
    end

    private

    def item_params
      params.require(:item).permit(:name, :description, :original_price, :photo, :quantity, :has_discount, :discount_percentage)
    end
  end
end
