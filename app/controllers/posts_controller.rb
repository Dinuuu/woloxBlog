class PostsController < InheritedResources::Base
before_action :authenticate_user!
  
  def create
    create!
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
