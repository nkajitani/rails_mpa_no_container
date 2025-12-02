require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  describe '#comment_notification' do
    let(:post_record) { create(:post, title: 'Test Post') }
    let(:comment) { create(:comment, post: post_record, name: 'Test User', body: 'Test Comment') }
    let(:mail) { CommentMailer.comment_notification(comment) }

    it 'renders the headers' do
      expect(mail.subject).to eq('新しいコメントが投稿されました: Test Post')
      expect(mail.to).to eq([ Settings.notification_email ])
      expect(mail.from).to eq([ 'admin@example.com' ])
    end

    it 'renders the body' do
      expect(mail.body.parts[0].decoded).to match('新しいコメントが投稿されました')
      expect(mail.body.parts[0].decoded).to match('Test Post')
      expect(mail.body.parts[0].decoded).to match('Test User')
      expect(mail.body.parts[0].decoded).to match('Test Comment')
    end
  end
end
