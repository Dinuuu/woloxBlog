require 'spec_helper'

describe PostsController do
  describe "POST #create" do

    context "with valid attributes" do
      let(:a_post) { attributes_for(:post) }
      it "increments the count of Posts" do
        expect{ post :create, post: a_post }.to change(Post,:count).by(1) 
      end
      it 'redirects to the campaign view' do
        post :create , post: a_post
        expect(response).to redirect_to post_path(Post.last)
      end
    end
    context "with invalid attributes" do 
      let(:invpost){ attributes_for(:post , title: nil )}
      it "does not save the new contact" do 
        expect{ post :create, post: invpost }.to_not change(Post,:count) 
      end 
      it "re-renders the new method" do 
        post :create, post: invpost 
        expect(response).to render_template :new
      end 
    end
  end
end
