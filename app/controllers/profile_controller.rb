class ProfileController < ApplicationController
  respond_to :json  

  def index
    @person = current_user.person
    respond_with @person
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = current_user.build_person(params[:person])
    respond_with @person, location: root_path
  end

  def update
    redirect_to root_path
  end

  def informacion
  	@user = current_user
  	@user.build_person if @user.person.nil?
  end
end
