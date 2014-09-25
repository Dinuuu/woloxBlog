require 'spec_helper'

describe Post do
  describe '#initialize' do
    context 'When creating a valid post' do
      it 'creates a new post' do
        expect(Post.create(title: 'A New Post', text: 'sum text')).to be_valid
      end
    end
    context 'When creating a post with NO attributes' do
      it 'not creates a new post' do
        expect(Post.create).not_to be_valid
      end
    end
    context 'When creating a post with short (less than 5 characters) title' do
      it 'not creates a new post' do
        expect(Post.create(title: 'post', text: 'this is text')).not_to be_valid
      end
    end
    context 'When creating a post with NO title' do
      it 'not creates a new post' do
        expect(Post.create(text: 'posts text')).not_to be_valid
      end
    end
    context 'When creating a post with NO text' do
      it 'not creates a new post' do
        expect(Post.create(title: 'This is a Post')).not_to be_valid
      end
    end
  end
end
