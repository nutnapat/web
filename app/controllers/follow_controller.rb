class FollowController < ApplicationController
	def follow
      @cartoon=Cartoon.find_by(name:params[:name])
      Current.user.cartoons << @cartoon
      redirect_to "/#{@cartoon.name}"
    end

    def unfollow
      @cartoon=Cartoon.find_by(name:params[:name])
      Current.user.follows.find_by(cartoon: @cartoon).destroy
      redirect_to "/#{@cartoon.name}"
    end
    
end
