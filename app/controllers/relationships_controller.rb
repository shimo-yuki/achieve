class RelationshipsController < ApplicationController


  def create
    relationship = current_user.active_relationships.create(followed_id: params[:user_id])
    redirect_to users_path, notice: "#{relationship.followed.name}さんをフォローしました。"
  end

  def destroy
    relationship = current_user.active_relationships.find_by(followed_id: params[:user_id])
    relationship.destroy
    redirect_to users_path, notice: "#{relationship.followed.name}さんのフォローを解除しました。"
  end
end
