class ProfileController < ApplicationController
  def show
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new(param[:person])
  end

  def informacion
  	@user = current_user
  	@user.build_person
  end
end
