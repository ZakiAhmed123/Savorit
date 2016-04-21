class FollowingController < ApplicationController
  def create

  new_user = User.find_by(id: params[:id])
    @current_user.follow new_user
    redirect_to explore_path
end

def delete
  new_user = User.find_by(id: params[:id])
  @current_user.stop_following new_user
  redirect_to explore_path
end

end
