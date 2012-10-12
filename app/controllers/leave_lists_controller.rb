class LeaveListsController < ApplicationController
  # GET /leave_lists
  # GET /leave_lists.json
  def index
    @leave_lists = LeaveList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_lists }
    end
  end

  # GET /leave_lists/1
  # GET /leave_lists/1.json
  def show
    @leave_list = LeaveList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave_list }
    end
  end

  # GET /leave_lists/new
  # GET /leave_lists/new.json
  def new
    @leave_list = LeaveList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leave_list }
    end
  end

  # GET /leave_lists/1/edit
  def edit
    @leave_list = LeaveList.find(params[:id])
  end

  # POST /leave_lists
  # POST /leave_lists.json
  def create
    @leave_list = LeaveList.new(params[:leave_list])

    respond_to do |format|
      if @leave_list.save
        format.html { redirect_to @leave_list, notice: 'Leave list was successfully created.' }
        format.json { render json: @leave_list, status: :created, location: @leave_list }
      else
        format.html { render action: "new" }
        format.json { render json: @leave_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leave_lists/1
  # PUT /leave_lists/1.json
  def update
    @leave_list = LeaveList.find(params[:id])

    respond_to do |format|
      if @leave_list.update_attributes(params[:leave_list])
        format.html { redirect_to @leave_list, notice: 'Leave list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_lists/1
  # DELETE /leave_lists/1.json
  def destroy
    @leave_list = LeaveList.find(params[:id])
    @leave_list.destroy

    respond_to do |format|
      format.html { redirect_to leave_lists_url }
      format.json { head :no_content }
    end
  end
end
