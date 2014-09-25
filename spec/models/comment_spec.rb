require 'spec_helper'

describe Comment do

  before(:each) do
    @post = Post.create(title: 'This is a Title', text: 'This is a text')
  end

  describe '#initialize' do
    context 'When creating a valid comment' do
      it 'creates a new comment' do
        expect(Comment.create(post_id: @post.id, commenter: 'Dinuu',
                              body: 'This is a valid comment')).to be_valid
      end
    end
    context 'When creating a comment with NO attributes' do
      it 'not creates a new comment' do
        expect(Comment.create).not_to be_valid
      end
    end
    context 'When creating a comment with NO post_id' do
      it 'not creates a new comment' do
        expect(Comment.create(commenter: 'Dinuuu', body: 'This is an invalid comment'))
          .not_to be_valid
      end
    end
    context 'When creating a comment with NO commenter' do
      it 'not creates a new comment' do
        expect(Comment.create(post_id: @post_id,  body: 'posts text')).not_to be_valid
      end
    end
    context 'When creating a comment with NO body' do
      it 'not creates a new comment' do
        expect(Comment.create(post_id: @post_id, commenter: 'Dinuuu')).not_to be_valid
      end
    end
  end
end
