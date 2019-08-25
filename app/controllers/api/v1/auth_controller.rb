class Api::V1::AuthController < ApplicationController


  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      render json: {id: user.id, username: user.username, token: issue_token({id: user.id})}
    else
      render json: {error: "Could not authenticate"}
    end
  end


  def show
    token = request.headers['Authorization']
    decoded = JWT.decode(token, 'secret', true, {algorithm: 'HS256'}).first
    id = decoded["id"]
    user = User.find_by(id: id)
    # byebug
    if user && user.authenticate(params[:password])
      render json: {id: user.id, username: user.username}
    else
      render json: {error: "Could not authenticate"}
    end
  end



  def refresh
    token = request.headers['Authorization']
    decoded = JWT.decode(token, 'secret', true, {algorithm: 'HS256'}).first
    id = decoded["id"]
    user = User.find_by(id: id)

    if user
      render json: user
    else
      render json: {error: "Could not authenticate"}
    end
  end


end
