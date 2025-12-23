require 'rails_helper'

RSpec.describe Front::CommentCounterService do
  let (:post) { create(:post) }
  subject { described_class.new(post.id) }

  describe '#perform' do
    it 'successfully' do
      expect {
        subject.perform
      }.to change { post.reload.comments_count }.by(1)
    end
  end
end
