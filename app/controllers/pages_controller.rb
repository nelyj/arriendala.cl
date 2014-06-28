class PagesController < ApplicationController
  def home
  	unless current_user.nil?
  		if current_user.person.nil?
  			redirect_to perfil_informacion_path
  		else
  			if attributes_validate(current_user.person)
  				redirect_to publicaciones_path
  			else
  				redirect_to perfil_informacion_path
  			end
  		end
  	end
  end

  def privacy
  end



  private

  	def attributes_validate(person)
  		if person.name.nil?
  			false
  		elsif person.gender.nil?
  			false
  		elsif person.start_address.nil?
  			false
  		elsif person.end_address.nil?
  			false
  		else
  			true
  		end		
  	end
end
