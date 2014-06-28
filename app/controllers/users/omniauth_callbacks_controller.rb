class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if request.env["omniauth.auth"].extra.raw_info.gender == "male"
      @gender = 'Hombre'
    elsif request.env["omniauth.auth"].extra.raw_info.gender == "female"
      @gender = 'Mujer'
    else
      @gender = ''
    end


    if @user.person.nil?
      @person = @user.create_person(
        name: request.env["omniauth.auth"].info.first_name,
        last_name: request.env["omniauth.auth"].info.last_name,
        image_url: request.env["omniauth.auth"].info.image,
        gender: @gender
        #start_address: request.env["omniauth.auth"].extra.location.name

        )
    else
      @person =@user.person.update_attributes(
        name: request.env["omniauth.auth"].info.first_name, 
        last_name: request.env["omniauth.auth"].info.last_name,
        image_url: request.env["omniauth.auth"].info.image,
        gender: @gender
        #start_address: request.env["omniauth.auth"].extra.location.name
      )
    end

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end