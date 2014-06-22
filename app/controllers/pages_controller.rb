class PagesController < ApplicationController
  def home
  	unless current_user.nil?
  		if current_user.person.nil?
  			redirect_to perfil_informacion_path
  		else
  			redirect_to publicaciones_path
  		end
  	end
  end
end
