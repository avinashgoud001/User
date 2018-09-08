class UsersController < ApplicationController
	def index
		@users=List.all
	end

	def new
		@user=List.new
	end

	def show
		@list=List.find_by_id(params[:id])
	end

	def create
		  List.create(user_params)
		  redirect_to users_path
	end
	def destroy
		@user = List.find_by_id(params[:id])
		@user.destroy
		redirect_to users_path
	end	
	def edit
		@user= List.find_by_id(params[:id])
		
	end

	def update
		@user = List.find_by_id(params[:id])
        @user.update(user_params)
		redirect_to users_path(@user)
	end		

	private
	def user_params
		params.require(:user).permit(:title, :note)
	end
end
