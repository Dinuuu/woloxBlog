class MailWorker
  include Sidekiq::Worker

  def perform(id)
    post = Post.find(id)
    alreadySent = Array.new
    post.comments.each do |comment|
      unless alreadySent.include?(comment.commenter) 
        alreadySent.push(comment.commenter)
        send_mail(comment.commenter)
      end
    end 
  end

  def send_mail(commenter)
    puts commenter
  end
end