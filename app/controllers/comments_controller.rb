class CommentsController  < InheritedResources::Base
	belongs_to :post
  before_action :authenticate_user!
  after_action :mail_interesed, only: :create
  def create
  	create! { post_path(@post) }
  end

  def destroy
  	destroy! { post_path(@post) }
  end

  def mail_interesed
    MailWorker.perform_async(@post.id)
  end


  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
