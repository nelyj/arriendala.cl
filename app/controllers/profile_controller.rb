class ProfileController < ApplicationController
  def index
    @person = current_user.person

    respond_to do |format|
      format.json { render json: @person }
    end
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = current_user.build_person(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to root_path }
      else
        format.html { render action: "new" }
      end
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
