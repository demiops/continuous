class CcsController < ApplicationController
  before_action :set_cc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  # GET /ccs
  # GET /ccs.json
  def index
    @ccs = current_account.ccs
  end

  # GET /ccs/1
  # GET /ccs/1.json
  def show
  end

  # GET /ccs/new
  def new
    @cc = Cc.new
  end

  # GET /ccs/1/edit
  def edit
  end

  # POST /ccs
  # POST /ccs.json
  def create
    @cc = Cc.new(cc_params)
    @cc.account = current_account
    respond_to do |format|
      if @cc.save
        format.html { redirect_to @cc, notice: 'Cc was successfully created.' }
        format.json { render :show, status: :created, location: @cc }
      else
        format.html { render :new }
        format.json { render json: @cc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ccs/1
  # PATCH/PUT /ccs/1.json
  def update
    respond_to do |format|
      if @cc.update(cc_params)
        format.html { redirect_to @cc, notice: 'Cc was successfully updated.' }
        format.json { render :show, status: :ok, location: @cc }
      else
        format.html { render :edit }
        format.json { render json: @cc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ccs/1
  # DELETE /ccs/1.json
  def destroy
    @cc.destroy
    respond_to do |format|
      format.html { redirect_to ccs_url, notice: 'Cc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cc
      @cc = Cc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cc_params
      params.require(:cc).permit(:ccnumber, :ccname, :ccexp, :ccv)
    end
end
