class Api::V1::FriendshipsController < ApplicationController

  def index
    friendships = Friendship.all
    render json: friendships
  end


  def new
    @users = User.all
    @friendship = Friendship.new
  end

  def show
    render json: friendship
  end

  def create
    @friendship = Friendship.create(user_id: user.id, friend_id: params[:friend_id])
  end

end
