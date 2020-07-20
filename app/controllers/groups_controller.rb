class GroupsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :authenticate_user!
  helper_method :filter_groups

  # GET /deals
  # GET /deals.json
  def index
    @groups = Group.all.order('name ASC').includes(icon_attachment: :blob)
    @user = current_user
  end

  # GET /deals/1
  # GET /deals/1
  def show
    @group = Group.find(params[:id])
    @group_deals = @group.deals
  end

  # GET /deals/new
  def new
    @group = current_user.groups.build
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals
  # POST /deals.json
  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @group.update(deal_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def filter_groups
    @group = Group.find(params[:id])
    puts @group.name
  end
end
