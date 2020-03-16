class AddressesController < ApplicationController
  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)
    @address.save
    redirect_to user_path(current_user)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(current_user), notice: 'お届け先住所を更新しました。'
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :prefecture, :city, :street_number, :building, :last_name, :given_name, :last_name_furigana, :given_name_furigana)
  end

end
