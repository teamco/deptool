class AppsController < ApplicationController

  include ShellCommand

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apps }
    end
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app }
    end
  end

  # GET /apps/new
  # GET /apps/new.json
  def new
    @data = {
        app: App.new,
        landscapes: Landscape.all.collect { |p| [p.name, p.id] },
        branches: Branch.all.collect { |p| [p.name, p.id] },
        scripts: ExternalScript.all.collect { |p| [p.script, p.id] },
        components: Component.all.collect { |p| [p.name, p.id] },
        users: User.all.collect { |p| [p.name, p.id] }
    }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app }
    end
  end

  # GET /apps/1/edit
  def edit
    @data = {
        app: App.find(params[:id]),
        landscapes: Landscape.all.collect { |p| [p.name, p.id] },
        branches: Branch.all.collect { |p| [p.name, p.id] },
        scripts: ExternalScript.all.collect { |p| [p.script, p.id] },
        components: Component.all.collect { |p| [p.name, p.id] },
        users: User.all.collect { |p| [p.name, p.id] }
    }

  end

  def run_command
    @app = App.find(params[:id])
    script = @app.external_script.script

    @text = system_quietly(script).gsub(/\n/, '<br />')

    respond_to do |format|
      format.js { render :layout => false }
    end

  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(params[:app])
    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created, location: @app }
      else
        format.html { render action: 'new' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apps/1
  # PUT /apps/1.json
  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to apps_url }
      format.json { head :no_content }
    end
  end
end
