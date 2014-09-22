class CommentsController  < InheritedResources::Base
	belongs_to :post
  before_action :authenticate_user!

  def create
  	create! { post_path(@post) }
  end

  def destroy
  	destroy! { post_path(@post) }
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
