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
    it 'renders edit user template successfully' do
      # User.create!(username: 'Zack', password: 'piano1')
      get :edit, id: 1
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end
  
  describe 'GET #index' do 
  it 'renders all users template' do
    get :index
    expect(response).to be_success
    expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'when given valid params' do 
      it 'logs in the user and redirects to their show page' do 
        post :create, user: { username: "julia", password: 'password' }
        #create user = for julia
        expect(response).to redirect_to(user_url(User.find_by(username: "julia")))
        expect(session[:session_token]).to eq(user.session_token)
      end
    end
  end
end
