class BuildResultsController < ApplicationController
  # GET /build_results
  # GET /build_results.json
  def index
    @build_results = BuildResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @build_results }
    end
  end

  # GET /build_results/1
  # GET /build_results/1.json
  def show
    @build_result = BuildResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @build_result }
    end
  end

  # GET /build_results/new
  # GET /build_results/new.json
  def new
    @build_result = BuildResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @build_result }
    end
  end

  # GET /build_results/1/edit
  def edit
    @build_result = BuildResult.find(params[:id])
  end

  # POST /build_results
  # POST /build_results.json
  def create
    @build_result = BuildResult.new(params[:build_result])

    respond_to do |format|
      if @build_result.save
        format.html { redirect_to @build_result, notice: 'Build result was successfully created.' }
        format.json { render json: @build_result, status: :created, location: @build_result }
      else
        format.html { render action: "new" }
        format.json { render json: @build_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /build_results/1
  # PUT /build_results/1.json
  def update
    @build_result = BuildResult.find(params[:id])

    respond_to do |format|
      if @build_result.update_attributes(params[:build_result])
        format.html { redirect_to @build_result, notice: 'Build result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @build_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /build_results/1
  # DELETE /build_results/1.json
  def destroy
    @build_result = BuildResult.find(params[:id])
    @build_result.destroy

    respond_to do |format|
      format.html { redirect_to build_results_url }
      format.json { head :no_content }
    end
  end
end
