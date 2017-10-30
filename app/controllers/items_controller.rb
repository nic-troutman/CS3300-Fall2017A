class ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end

  def create
    @items = Item.order(params[:link])
    count = 0
    @itemToAdd = Item.new(item_params)
    #loop through all items
    @items.each {|item|
    #if new link already exists in list, add to count
    if item.link == @itemToAdd.link
      count += 1
    end}
    #if count == 0, the link does not exist and can be added to the list
    if count == 0
      if @itemToAdd.save
        #redirect to previous page once saved
        redirect_to '/'
      else
        render 'new'
      end
    else
      redirect_to '/new_item'
    end
  end

  def edit
    @item = Item.find(params[:id])
    session[:edit] = request.original_url
  end

  def update
    session[:update] = request.original_url
    @item = Item.find params[:id]
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.name} was successfully updated."
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] =  "'#{@item.name}' deleted."
    redirect_to '/'
  end
  private

    def item_params
      params.require(:item).permit(:name, :link, :target_price, :current_price)
    end
end
