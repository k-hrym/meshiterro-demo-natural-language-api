class FavoritesController < ApplicationController
	def create
		postimage = PostImage.find(params[:postimage_id])
        favorite = current_user.favorites.new(post_image_id: postimage.id)
        # favorite = Favorite.new
        # favorite.user_id = current_user.id
        # favorite.post_image_id = postimage.id
        favorite.save
        redirect_to postimages_path
	end

	def destroy
		favorite = current_user.favorites.find_by(postimage_id: params[:postimage_id])
        favorite.destroy
        redirect_to postimages_path
	end
end