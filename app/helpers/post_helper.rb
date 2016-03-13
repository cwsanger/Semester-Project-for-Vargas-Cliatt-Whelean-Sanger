module PostHelper
  def like_post_path(post)
    "post/#{post.id}/like"
  end
end
