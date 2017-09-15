class ListHookController < ApplicationController
  unloadable

	def index
		@hooks = ListHook.all
  end

  def new
		@hook = ListHook.new
  end

	def edit
		@hook = ListHook.find(params[:id])
	end
		
	def create
		@hook = ListHook.create(list_params)
		if @hook.save
			redirect_to action: :index
		else
			render :action => 'edit'
		end
	end
		
	def update
	  @hook = ListHook.find(params[:id])
	  @hook.update_attributes(list_params)
		if @hook.save
			redirect_to action: :index
		else
			render :action => 'edit'
		end
	end
		
	def destroy
		@hook = ListHook.find(params[:id])	
		@hook.destroy
		redirect_to action: :index
	end
		
	private
			
		def list_params
			params.require(:list_hook).permit(:name)
		end
		
end
