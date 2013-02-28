class DeploymentsController < ApplicationController
  include ShellCommand

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all.collect { |p| [p.name, p.id] }
    @app = App.first
    @landscapes = Landscape.all.collect { |p| [p.name, p.id] }
    @branches = Branch.all.collect { |p| [p.name, p.id] }

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def generate_command
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def run_command
    @app = App.find(params[:id])
    script = @app.external_script.script

    @text = system_quietly(script).gsub(/\n/, '<br />')

    respond_to do |format|
      format.js { render :layout => false }
    end

  end

end
