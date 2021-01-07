require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #edit, show, destroy
  describe 'GET #new' do
    it 'renders new users template successfully' do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #show' do
    #how to find a user by indexing id
    #since we have Carlos, his id will be 1
    #expect look up to show carlos' page
    it 'renders the show template' do
      User.create!(username: 'Zack', password: 'piano1')
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context 'if the user does not exist' do
      it 'is not a success' do
        begin
          get :show, id: -1
        rescue
          ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(:show)
      end
    end
  end

  describe 'POST #edit' do
    post :
    expect(response).to be_success
    expect(response).to render_template(:show)
  end
end
