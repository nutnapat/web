class CommentsController < ApplicationController
	
  before_action :set_chapter

  def create
    @comment = @chapter.comments.new(comment_params)
    @comment.user = Current.user
    @comment.save
    redirect_to "/#{@chapter.cartoon.name}/#{@chapter.num}"
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:chapter_id)
  end

  def set_chapter
    @cartoon=Cartoon.find_by(name:params[:name])
    @chapter=@cartoon.chapters.find_by(num:params[:num])
  end
   
end
