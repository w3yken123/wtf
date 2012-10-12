class ExpendEventsController < ApplicationController
  # GET /expend_events
  # GET /expend_events.json
  def index
    @expend_events = ExpendEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expend_events }
    end
  end

  # GET /expend_events/1
  # GET /expend_events/1.json
  def show
    @expend_event = ExpendEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expend_event }
    end
  end

  # GET /expend_events/new
  # GET /expend_events/new.json
  def new
    @expend_event = ExpendEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expend_event }
    end
  end

  # GET /expend_events/1/edit
  def edit
    @expend_event = ExpendEvent.find(params[:id])
  end

  # POST /expend_events
  # POST /expend_events.json
  def create
    @expend_event = ExpendEvent.new(params[:expend_event])

    respond_to do |format|
      if @expend_event.save
        format.html { redirect_to @expend_event, notice: 'Expend event was successfully created.' }
        format.json { render json: @expend_event, status: :created, location: @expend_event }
      else
        format.html { render action: "new" }
        format.json { render json: @expend_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expend_events/1
  # PUT /expend_events/1.json
  def update
    @expend_event = ExpendEvent.find(params[:id])

    respond_to do |format|
      if @expend_event.update_attributes(params[:expend_event])
        format.html { redirect_to @expend_event, notice: 'Expend event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expend_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expend_events/1
  # DELETE /expend_events/1.json
  def destroy
    @expend_event = ExpendEvent.find(params[:id])
    @expend_event.destroy

    respond_to do |format|
      format.html { redirect_to expend_events_url }
      format.json { head :no_content }
    end
  end
end
