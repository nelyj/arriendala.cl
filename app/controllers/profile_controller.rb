class ProfileController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json  

  def index
    @person = current_user
    respond_with @person
  end

  def create
  	@person = current_user.build_person(params[:person])

    if @person.save
      render :json => "hi #{params[:name]} #{params[:person]}"
    end
  end

  def update
    redirect_to root_path
  end

  def informacion
  	@user = current_user
  	@user.build_person if @user.person.nil?
  end
end
