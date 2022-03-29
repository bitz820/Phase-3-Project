class ApplicationController < Sinatra::Base

      # Add this line to set the Content-Type header for all responses
      set :default_content_type, 'application/json'

  get '/users/' do
    users = User.all
    users.to_json(include: [:likers, :liked])

  end

  get '/matches/' do
    users = Match.all
    users.to_json

  end

  get '/user/:id' do
    user = User.find(params[:id])
    user.to_json

    patch '/user/:id' do
      user = User.find(params[:id])
      user.update(
        name: params[:name],
        bio: params[:bio],
        hobby: params[:hobby],
        preference: params[:preference],
        age: params[:age],
        picture: params[:picture],
        location: params[:location],
      )
      user.to_json
    end

    delete '/matchs/:id' do
        match = Match.find(params[:id])
        match.destroy
        match.to_json
    end

  end

  get '/match/:id' do
      match = Match.find(params[:id])
      match.to_json
  end

  #update user info
  patch '/user/:id' do
    user = User.find(params[:id])
    user.update(
      name: params[:name],
      bio: params[:bio],
      hobby: params[:hobby],
      preference: params[:preference],
      age: params[:age],
      picture: params[:picture],
      location: params[:location]
    )
    user.to_json
  end

  # delete user
  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  # delete matches
  delete '/matches/:id' do
      match = Match.find(params[:id])
      match.destroy
      match.to_json
  end

end
