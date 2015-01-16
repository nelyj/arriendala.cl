class PublicationsController < ApplicationController
  before_filter :authenticate_user!

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publications }
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication = current_user.publications.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publication }
    end
  end

  # GET /publications/new
  # GET /publications/new.json
  def new
    @publication = current_user.publications.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: publicacione_path(@publication) }
    end
  end

  # GET /publications/1/edit
  def edit
    @publication = current_user.publications.find(params[:id])
  end

  # POST /publications
  # POST /publications.json
  def create

    @publication = current_user.publications.new(params[:publication])

    respond_to do |format|
      if @publication.save
        format.html { redirect_to publicacione_path(@publication), notice: 'Publication was successfully created.' }
        format.json { render json: publicacione_path(@publication), status: :created, location: publicacione_path(@publication) }
      else
        format.html { render action: "new" }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publications/1
  # PUT /publications/1.json
  def update
    @publication = current_user.publications.find(params[:id])

    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication = current_user.publications.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url }
      format.json { head :no_content }
    end
  end

  private
  
  def validates_profile
    redirect_to perfil_informacion_path if current_user.person.nil?
  end
end
