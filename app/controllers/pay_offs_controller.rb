class PayOffsController < ApplicationController
  # GET /pay_offs
  # GET /pay_offs.json
  def index
    @pay_offs = PayOff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pay_offs }
    end
  end

  # GET /pay_offs/1
  # GET /pay_offs/1.json
  def show
    @pay_off = PayOff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pay_off }
    end
  end

  # GET /pay_offs/new
  # GET /pay_offs/new.json
  def new
    @pay_off = PayOff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pay_off }
    end
  end

  # GET /pay_offs/1/edit
  def edit
    @pay_off = PayOff.find(params[:id])
  end

  # POST /pay_offs
  # POST /pay_offs.json
  def create
  @product = Product.find(params[:pay_off][:product_id])
  params[:pay_off][:pay_type] = @product.p_type
  params[:pay_off][:pay_name] = @product.p_name  
  @pay_off = PayOff.new(params[:pay_off])

    respond_to do |format|
      if @pay_off.save
	    @product = Product.find(@pay_off.product_id)
		@product.p_stock = @product.p_stock+@pay_off.pay_num
		@product.save
        format.html { redirect_to @pay_off, notice: 'Pay off was successfully created.' }
        format.json { render json: @pay_off, status: :created, location: @pay_off }
      else
        format.html { render action: "new" }
        format.json { render json: @pay_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pay_offs/1
  # PUT /pay_offs/1.json
  def update
    @product = Product.find(params[:pay_off][:product_id])
	@ori_pay_off = PayOff.find(params[:id])
    @pay_off = PayOff.find(params[:id])
    respond_to do |format|
      if @pay_off.update_attributes(params[:pay_off])
	    @product.p_stock = @product.p_stock+@pay_off.pay_num-@ori_pay_off.pay_num
		@product.save
        format.html { redirect_to @pay_off, notice: 'Pay off was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pay_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_offs/1
  # DELETE /pay_offs/1.json
  def destroy
    @pay_off = PayOff.find(params[:id])
    @pay_off.destroy

    respond_to do |format|
      format.html { redirect_to pay_offs_url }
      format.json { head :no_content }
    end
  end
end
