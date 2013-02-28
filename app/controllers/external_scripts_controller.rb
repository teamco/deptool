class ExternalScriptsController < ApplicationController
  # GET /external_scripts
  # GET /external_scripts.json
  def index
    @external_scripts = ExternalScript.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @external_scripts }
    end
  end

  # GET /external_scripts/1
  # GET /external_scripts/1.json
  def show
    @external_script = ExternalScript.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @external_script }
    end
  end

  # GET /external_scripts/new
  # GET /external_scripts/new.json
  def new
    @external_script = ExternalScript.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @external_script }
    end
  end

  # GET /external_scripts/1/edit
  def edit
    @external_script = ExternalScript.find(params[:id])
  end

  # POST /external_scripts
  # POST /external_scripts.json
  def create
    @external_script = ExternalScript.new(params[:external_script])

    respond_to do |format|
      if @external_script.save
        format.html { redirect_to @external_script, notice: 'External script was successfully created.' }
        format.json { render json: @external_script, status: :created, location: @external_script }
      else
        format.html { render action: "new" }
        format.json { render json: @external_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /external_scripts/1
  # PUT /external_scripts/1.json
  def update
    @external_script = ExternalScript.find(params[:id])

    respond_to do |format|
      if @external_script.update_attributes(params[:external_script])
        format.html { redirect_to @external_script, notice: 'External script was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @external_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_scripts/1
  # DELETE /external_scripts/1.json
  def destroy
    @external_script = ExternalScript.find(params[:id])
    @external_script.destroy

    respond_to do |format|
      format.html { redirect_to external_scripts_url }
      format.json { head :no_content }
    end
  end
end
