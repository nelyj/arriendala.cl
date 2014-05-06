class PagesController < ApplicationController
  def home
  	redirect_to publicaciones_path unless current_user.nil?
  end
end
