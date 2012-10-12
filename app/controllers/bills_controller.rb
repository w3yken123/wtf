class BillsController < ApplicationController
  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.json
  def new
    @bill = Bill.new
    10.times {@bill.expend_events.build} # added this
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
	(10-@bill.expend_events.size).times {@bill.expend_events.build} # added this
  end

  # POST /bills
  # POST /bills.json
  def create
	10.times { |i|
	if !params[:bill][:expend_events_attributes]["#{i}"][:service_id].blank?
	  @service = Service.where("id = ?",params[:bill][:expend_events_attributes]["#{i}"][:service_id].to_i).first
	  @bill_price = @bill_price.to_i + ( @service.s_price-(@service.s_price*@service.s_discount/100).round  )
	  @assistant_score = @assistant_score.to_i + ( (@service.s_price-(@service.s_price*@service.s_discount/100).round)*@service.s_acom/100  )
	  params[:bill][:expend_events_attributes]["#{i}"][:e_name] = @service.s_name
	  params[:bill][:expend_events_attributes]["#{i}"][:e_type] = @service.s_type
	  params[:bill][:expend_events_attributes]["#{i}"][:e_price] = @service.s_price
	  params[:bill][:expend_events_attributes]["#{i}"][:e_discount] = @service.s_discount
	  params[:bill][:expend_events_attributes]["#{i}"][:e_dcom] = @service.s_dcom
	  params[:bill][:expend_events_attributes]["#{i}"][:e_acom] = @service.s_acom
	  params[:bill][:expend_events_attributes]["#{i}"][:e_combine] = @service.s_combine
	end
	}
	
	params[:bill][:bill_price] = @bill_price
	params[:bill][:assistant_score] = @assistant_score

	@bill = Bill.new(params[:bill])
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render json: @bill, status: :created, location: @bill }
      else
        format.html { render action: "new" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.json
  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end
end
