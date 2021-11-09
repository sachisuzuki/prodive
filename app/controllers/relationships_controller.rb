class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    @msg = "#{@user.name}さんをフォローしました！"
    respond_to do |format|
      format.js { render :follow }
      format.html { redirect_to conditions_url }
    end
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.unfollow(@user)
    @msg = "#{@user.name}さんへのフォローを解除しました"
    respond_to do |format|
      format.js { render :unfollow }
      format.html { redirect_to conditions_url }
    end
  end
end
