class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article) 
   
# Even this code works (just like we created the article)
#    @comment = @article.comments.new(comment_params)
#    if @comment.save
#    redirect_to article_path(@article)   
#    else
#      puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    end
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
