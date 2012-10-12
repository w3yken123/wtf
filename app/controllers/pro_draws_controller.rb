#encoding: utf-8
class ProDrawsController < ApplicationController
  # GET /pro_draws
  # GET /pro_draws.json
  def index
    @pro_draws = ProDraw.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pro_draws }
    end
  end

  # GET /pro_draws/1
  # GET /pro_draws/1.json
  def show
    @pro_draw = ProDraw.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pro_draw }
    end
  end

  # GET /pro_draws/new
  # GET /pro_draws/new.json
  def new
    @pro_draw = ProDraw.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pro_draw }
    end
  end

  # GET /pro_draws/1/edit
  def edit
    @pro_draw = ProDraw.find(params[:id])
  end

  # POST /pro_draws
  # POST /pro_draws.json
  def create
    @product = Product.find(params[:pro_draw][:product_id])
	if @product.p_stock.to_i-params[:pro_draw][:draw_num].to_i < 0
	  redirect_to new_pro_draw_path, :notice => "目前剩餘#{@product.p_stock},庫存不足"
	  return
	end
    params[:pro_draw][:draw_type] = @product.p_type
	params[:pro_draw][:draw_name] = @product.p_name
    @pro_draw = ProDraw.new(params[:pro_draw])
    respond_to do |format|
      if @pro_draw.save
	    @product = Product.find(@pro_draw.product_id)
		@product.p_stock = @product.p_stock-@pro_draw.draw_num
		@product.save
		
        format.html { redirect_to @pro_draw, notice: 'Pro draw was successfully created.' }
        format.json { render json: @pro_draw, status: :created, location: @pro_draw }
      else
        format.html { render action: "new" }
        format.json { render json: @pro_draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pro_draws/1
  # PUT /pro_draws/1.json
  def update
    @product = Product.find(params[:pro_draw][:product_id])
	@ori_pro_draw = ProDraw.find(params[:id])
	@pro_draw = ProDraw.find(params[:id])
	if @product.p_stock.to_i+@ori_pro_draw.draw_num.to_i-params[:pro_draw][:draw_num].to_i < 0
	  redirect_to new_pro_draw_path, :notice => "目前剩餘#{@product.p_stock},庫存不足"
	  return
	end
    respond_to do |format|
      if @pro_draw.update_attributes(params[:pro_draw])
		@product.p_stock = @product.p_stock.to_i+@ori_pro_draw.draw_num.to_i-params[:pro_draw][:draw_num].to_i
		@product.save
        format.html { redirect_to @pro_draw, notice: 'Pro draw was successfully updated.' }
        format.json { head :no_content }
		
      else
        format.html { render action: "edit" }
        format.json { render json: @pro_draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_draws/1
  # DELETE /pro_draws/1.json
  def destroy
    @pro_draw = ProDraw.find(params[:id])
    @pro_draw.destroy

    respond_to do |format|
      format.html { redirect_to pro_draws_url }
      format.json { head :no_content }
    end
  end
end
