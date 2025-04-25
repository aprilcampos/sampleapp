class CommentBroadcastJob < ApplicationJob
  queue_as :default

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end