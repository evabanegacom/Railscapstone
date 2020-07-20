class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @user_deals ||= current_user.deals.order('created_at DESC')
    @user_deals.includes(:group)
    @sum = @user_deals.sum(:amount)
    @groups = Group.all
  end

  def make_deals
    @user = current_user
    @sum = @user.deals.sum(:amount)
    @deals = Deal.all
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id).includes(:dealings, groups: :icon_attachment).to_a
  end

  def external
    @user = current_user
    @sum = @user.deals.sum(:amount)
    @deals = Deal.all
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id)
    @external = current_user.deals - @user_deals
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, { group_ids: [] })
  end
end
