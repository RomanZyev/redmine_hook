class ListHookController < ApplicationController
  unloadable

	def index
		@list = ListHook.all
  	end

  	def new
		@hook = ListHook.new
  	end

  def show
  end
end
