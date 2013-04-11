class DeploymentsController < ApplicationController
  include ShellCommand

  # GET /apps
  # GET /apps.json

  def index
    @data = {
        landscapes: Landscape.all.collect { |p| [p.name, p.id] },
        landscape: Landscape.first
    }

    case params[:id]
      when 'select_data'
        select_data
      when 'maintenance'
        maintenance
      else
        respond_to do |format|
          format.html # index.html.erb
        end
    end

  end

  def select_data
    landscape = Landscape.find(params[:landscape][:id])

    @data = {
        landscape: landscape,
        accounts: landscape.accounts.all.collect { |p| [p.name, p.id] },
        apps: landscape.apps.all.collect { |p| [p.name, p.id] }
    }

    render :action => :select_data
  end

  def maintenance
    @data = {
        #apps: App.all.collect { |p| [p.name, p.id] },
        app: App.find(params[:landscape][:apps]),
        account: Account.find(params[:landscape][:accounts]),
        #landscapes: Landscape.all.collect { |p| [p.name, p.id] },
        #branches: Branch.all.collect { |p| [p.name, p.id] },
        #users: User.all.collect { |p| [p.name, p.id] },
        #components: Component.all.collect { |p| [p.name, p.id] },
        properties_paths: PropertiesPath.all,
        build_results: BuildResult.all
    }

    render :action => :maintenance
  end

  def generate_command
    logger.info ">>>>>>>>>> #{@data.inspect}"
    app = App.find(params[:id])
    branch = Branch.find(params[:app][:branch_id])
    landscape = app.landscape
    account = Account.find(params[:app][:account_id])
    user = User.find(params[:app][:user_id])
    component = Component.find(params[:app][:component_id])
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
    account = "-a #{account.name}"
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
