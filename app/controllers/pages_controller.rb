class PagesController < ApplicationController
  def home
  	redirect_to publications_path unless current_user.nil?
  end
end
