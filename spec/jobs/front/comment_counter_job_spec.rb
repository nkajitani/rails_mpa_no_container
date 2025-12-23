require 'rails_helper'

RSpec.describe Front::CommentCounterJob, type: :job do
  let (:post) { create(:post) }
  let (:service) { instance_double(Front::CommentCounterService) }
  let (:service_class) { class_double(Front::CommentCounterService).as_stubbed_const }

  describe '#perform' do
    it 'successfully' do
      allow(service_class).to receive(:new).with(post.id).and_return(service)

      expect(service).to receive(:perform).once
      described_class.perform_now(post.id)
    end
    it 'raise Error' do
      error = StandardError.new

      allow(service_class).to receive(:new).with(post.id).and_raise(error)
      expect(Rails.logger).to receive(:error).at_least(:once)
      expect {
        described_class.perform_now(post.id)
      }.not_to raise_error
    end
  end
end
