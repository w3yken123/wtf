class LeaveApplicationsController < ApplicationController
  # GET /leave_applications
  # GET /leave_applications.json
  def index
    @leave_applications = LeaveApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_applications }
    end
  end

  # GET /leave_applications/1
  # GET /leave_applications/1.json
  def show
    @leave_application = LeaveApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave_application }
    end
  end

  # GET /leave_applications/new
  # GET /leave_applications/new.json
  def new
    @leave_application = LeaveApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leave_application }
    end
  end

  # GET /leave_applications/1/edit
  def edit
    @leave_application = LeaveApplication.find(params[:id])
  end

  # POST /leave_applications
  # POST /leave_applications.json
  def create
    @leave_application = LeaveApplication.new(params[:leave_application])

    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to @leave_application, notice: 'Leave application was successfully created.' }
        format.json { render json: @leave_application, status: :created, location: @leave_application }
      else
        format.html { render action: "new" }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leave_applications/1
  # PUT /leave_applications/1.json
  def update
    @leave_application = LeaveApplication.find(params[:id])

    respond_to do |format|
      if @leave_application.update_attributes(params[:leave_application])
        format.html { redirect_to @leave_application, notice: 'Leave application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_applications/1
  # DELETE /leave_applications/1.json
  def destroy
    @leave_application = LeaveApplication.find(params[:id])
    @leave_application.destroy

    respond_to do |format|
      format.html { redirect_to leave_applications_url }
      format.json { head :no_content }
    end
  end
end
