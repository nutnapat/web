class MainController < ApplicationController
	def main
        @popular = Cartoon.all.sort{|a,b| b.users.count<=>a.users.count}.first(3)
		if Current.user
			@folltoon = Current.user.cartoons
		end
        @chapters = Chapter.all.order("created_at DESC")
        if params[:q]!= nil
            @daytoons = Cartoon.where(:daytoupdate => params[:q])
        else
            @daytoons = Cartoon.all
        end
    end

    def genre
        @tags = Genre.all
		if params[:q]!= nil
            @cartoons = Cartoon.where( ['? = ANY(tags)', params[:q]])
        else
            @cartoons = Cartoon.all
        end
    end

    def allcartoons
        if params[:sort]=="complete"
            @cartoons = Cartoon.where(:status => params[:sort])
        elsif params[:sort]=="continue"
            @cartoons = Cartoon.where(:status => params[:sort])
        elsif params[:sort]=="a-z"
            @cartoons = Cartoon.order("name ASC")
        elsif params[:sort]=="z-a"
            @cartoons = Cartoon.order("name DESC")
        else
            @cartoons = Cartoon.all
        end

    end

    def cartoon
    	@cartoon=Cartoon.find_by(name:params[:name])
    	@chapters=@cartoon.chapters.order(created_at: :desc)
    end

    def chapter
    	@cartoon=Cartoon.find_by(name:params[:name])
    	@chapter=@cartoon.chapters.find_by(num:params[:chapter])
    	@comment=Comment.new
    	@comments=@chapter.comments.order("created_at DESC")
    end

    def search
    	@cartoons=Cartoon.where("name LIKE?","%" + params[:q] + "%")
    end

    def update
        if Current.user==nil
            redirect_to main_path
        elsif Current.user.mode != "admin"
            redirect_to main_path
        end
        
    end
end
