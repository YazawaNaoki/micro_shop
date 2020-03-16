class Admins::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new

    @artist_hash = {}
    artists = Artist.all
    artists.each do |artist|
      @artist_hash.merge!(artist.name => artist.id)
    end

    @label_hash = {}
    labels = Label.all
    labels.each do |label|
      @label_hash.merge!(label.name => label.id)
    end

    @cd = @product.cds.build
    @music = @cd.musics.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product.id), notice: "商品を追加しました。"
    else
      @artist_hash = {}
      artists = Artist.all
      artists.each do |artist|
        @artist_hash.merge!(artist.name => artist.id)
      end

      @label_hash = {}
      labels = Label.all
      labels.each do |label|
        @label_hash.merge!(label.name => label.id)
      end

      @cd = @product.cds.build
      @music = @cd.musics.build
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @stock_quantity = 0
    @product.arrivals.each do |arrival|
      @stock_quantity += arrival.count
    end
  end

  def edit
    @product = Product.find(params[:id])

    @artist_hash = {}
    artists = Artist.all
    artists.each do |artist|
      @artist_hash.merge!(artist.name => artist.id)
    end

    @label_hash = {}
    labels = Label.all
    labels.each do |label|
      @label_hash.merge!(label.name => label.id)
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product.id), notice: "商品を編集しました。"
    else
      @artist_hash = {}
      artists = Artist.all
      artists.each do |artist|
        @artist_hash.merge!(artist.name => artist.id)
      end

      @label_hash = {}
      labels = Label.all
      labels.each do |label|
        @label_hash.merge!(label.name => label.id)
      end

      @cd = @product.cds.build
      @music = @cd.musics.build
      render :edit
    end
  end

  def alert
  end

  private
  def product_params
    params.require(:product).permit(:image, :artist_id, :label_id, :album_name, :sell_at, :price, :product_status, :genre,
    cds_attributes: [:id, :cd_num, :_destroy,
    musics_attributes: [:id, :track_num, :name, :_destroy]])
  end
end
