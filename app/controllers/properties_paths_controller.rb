class PropertiesPathsController < ApplicationController
  # GET /properties_paths
  # GET /properties_paths.json
  def index
    @properties_paths = PropertiesPath.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties_paths }
    end
  end

  # GET /properties_paths/1
  # GET /properties_paths/1.json
  def show
    @properties_path = PropertiesPath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @properties_path }
    end
  end

  # GET /properties_paths/new
  # GET /properties_paths/new.json
  def new
    @properties_path = PropertiesPath.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @properties_path }
    end
  end

  # GET /properties_paths/1/edit
  def edit
    @properties_path = PropertiesPath.find(params[:id])
  end

  # POST /properties_paths
  # POST /properties_paths.json
  def create
    @properties_path = PropertiesPath.new(params[:properties_path])

    respond_to do |format|
      if @properties_path.save
        format.html { redirect_to @properties_path, notice: 'Properties path was successfully created.' }
        format.json { render json: @properties_path, status: :created, location: @properties_path }
      else
        format.html { render action: "new" }
        format.json { render json: @properties_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties_paths/1
  # PUT /properties_paths/1.json
  def update
    @properties_path = PropertiesPath.find(params[:id])

    respond_to do |format|
      if @properties_path.update_attributes(params[:properties_path])
        format.html { redirect_to @properties_path, notice: 'Properties path was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @properties_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties_paths/1
  # DELETE /properties_paths/1.json
  def destroy
    @properties_path = PropertiesPath.find(params[:id])
    @properties_path.destroy

    respond_to do |format|
      format.html { redirect_to properties_paths_url }
      format.json { head :no_content }
    end
  end
end
