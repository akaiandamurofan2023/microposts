class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    current_user.follow(@user)
  end

  def destroy
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
