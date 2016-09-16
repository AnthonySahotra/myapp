class MonstersController < ApplicationController
	before_action :authenticate_user!

	def index 
	  @monsters = Monster.joins(:user).where('user_id=?',current_user)
	end 

	def new 
	  @monster = current_user.monsters.build
 	end 

	def create
	   @monster = current_user.monsters.build(monster_params)
	   if @monster.save 
	   	redirect_to monsters_path
	   else
	   	render new_monster_path
	   end 
	end

	def edit
		@monster = Monster.find(params[:id])
 	end

 	def update
 		monster = Monster.find(params[:id]) 
 		if monster.update_attributes(monster_params)
 		 	redirect_to monsters_path
 		end 
 	end  

	def destroy
		monster = Monster.find(params[:id])
		if monster.destroy
			redirect_to monsters_path
		end 
	end

	def show 
		@monster = Monster.find(params[:id])
	end  

	private 
		def monster_params 
			params.require(:monster).permit(:name,:power,:type)
		end  
end
