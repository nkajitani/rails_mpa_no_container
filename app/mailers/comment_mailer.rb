class CommentMailer < ApplicationMailer
  def comment_notification(comment)
    @comment = comment
    @post = comment.post
    mail(
      to: Settings.notification_email,
      subject: "新しいコメントが投稿されました: #{@post.title}"
    )
  end
end
