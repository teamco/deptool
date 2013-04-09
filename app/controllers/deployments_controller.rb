class DeploymentsController < ApplicationController
  include ShellCommand

  # GET /apps
  # GET /apps.json
  def index
    @data = {
        apps: App.all.collect { |p| [p.name, p.id] },
        app: App.first,
        landscapes: Landscape.all.collect { |p| [p.name, p.id] },
        branches: Branch.all.collect { |p| [p.name, p.id] },
        users: User.all,
        components: Component.all,
        properties_paths: PropertiesPath.all,
        build_results: BuildResult.all
    }

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def generate_command
    logger.info ">>>>>>>>>> #{params.inspect}"
    app = App.find(params[:id])
    branch = Branch.find(params[:app][:branch_id])
    landscape = app.landscape
    user = User.find(params[:user_id])
    component = Component.find(params[:component_id])
    properties_path = PropertiesPath.find(params[:properties_path_id])
    build_result = BuildResult.find(params[:build_results_id])
    # neo deploy props.properties
    # -M 2 -m 2 (max / min of VM's)
    # -s (path to build results)\\\\iltlvp01.tlv.sap.corp\\dev\\... - path (branch)
    # -a (account) portal
    # -b (application - truncate) app
    # -c component
    # -h (landscape domain name) netweaver.ondemand.com
    # -p abcd1234
    # -u i031410

    vm = "-M #{params[:vms_max] || 1} -m #{params[:vms_min] || 1}"
    account = "-a #{landscape.account.name}"
    name = "-b #{app.name.titlecase.gsub(/ /, '')}"
    component = "-c #{component.name}"
    login = "-u #{user.name}"
    password = "-p #{user.password}"
    domain = "-h #{landscape.domain.name}"
    build_result = "-s #{build_result.name}#{branch.name}\\..."

    @command = "neo deploy #{properties_path.name}props.properties #{build_result} #{vm} #{account} #{name} #{component} #{domain} #{login} #{password}"

   logger.info ">>>>>>>>>\n #{@command}"

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def run_command
    app = App.find(params[:id])
    script = app.external_script.script

    @text = system_quietly(script).gsub(/\n/, '<br />')

    respond_to do |format|
      format.js { render :layout => false }
    end

  end

end
