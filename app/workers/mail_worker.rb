class MailWorker
  include Sidekiq::Worker

  def perform(id)
    post = Post.find(id)
    already_sent = []
    post.comments.each do |comment|
      unless already_sent.include?(comment.commenter)
        already_sent.push(comment.commenter)
        send_mail(comment.commenter)
      end
    end
  end

  def send_mail(commenter)
    puts commenter
  end
end
