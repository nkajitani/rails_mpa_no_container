class Front::CommentCounterService
  def initialize(id)
    @post = Post.find(id)
  end

  def perform
    @post.increment!(:comments_count)
  end
end
