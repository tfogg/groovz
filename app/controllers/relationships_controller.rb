class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find_by_profile_name(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to profile_path(user)
  end

  def destroy
    @user = Relationship.find_by_profile_name(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to profile_path(user)
  end
end