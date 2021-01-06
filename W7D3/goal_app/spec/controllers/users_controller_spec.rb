require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #edit, show, destroy
  describe 'GET #new' do
    get :new
    expect(response).to be_success
    expect(response).to render_template(:new)
  end

  describe 'GET #show' do
    #how to find a user by indexing id
    get :show, id: ???
    expect(response).to be_success
    expect(response).to render_template(:show)
  end

  describe 'POST #edit' do
    post :
    expect(response).to be_success
    expect(response).to render_template(:show)
  end
end
