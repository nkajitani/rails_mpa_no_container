class Front::CommentCounterJob < ApplicationJob
  discard_on StandardError do |_job, error|
    logger.error({ exception: { class: error.class, message: error.message, backtrace: error.backtrace } }.to_json)
  end

  def perform(id)
   Front::CommentCounterService.new(id).perform
  end
end
