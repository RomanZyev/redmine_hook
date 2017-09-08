
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
      		update_main
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

  def update_main
    id = params[:id]
    @new_list = params[:listhook_id]
    @old_list = SetingText.where("text_hook_id" =>id).pluck("list_hook_id")

    if @new_list != nil
      @new_list.each do |l|
        if !@old_list.include?(l.to_i)
          SetingText.new("text_hook_id" =>id,"list_hook_id" =>l.to_i).save
        end
      end
      @old_list.each do |l|
        if !@new_list.include?(l.to_s) && l != nil
          SetingText.where("text_hook_id" =>id,"list_hook_id" =>l).first.destroy
        end
      end
    else
      @old_list.each do |l|
        SetingText.where("text_hook_id" =>id,"list_hook_id" =>l).first.destroy
      end
    end   
   
  end   

end
