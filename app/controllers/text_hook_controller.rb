
class TextHookController < ApplicationController
  unloadable

  def index
  	@list = TextHook.all
  end

  def new
  	@txt = TextHook.new
  end

  def edit
  	@txt = TextHook.find(params[:id])
  end

  def create
   @txt = TextHook.create(text_params)
    if @txt.save
      redirect_to action: :index
    else
      render :action => 'edit'
    end
   end

   def update
   	@txt = TextHook.find(params[:id])
   	@txt.update_attributes(text_params)
		if @txt.save
      		redirect_to action: :index
    	else
      		render :action => 'edit'
    	end
    end

    def destroy
    	@txt = TextHook.find(params[:id])	
    	@txt.destroy
    	redirect_to action: :index
    end

    def update_text
    	update_main

    	redirect_to action: :index	
   	end	
   	
  private
  
  def text_params
    params.require(:text_hook).permit(:txt)
  end

end
