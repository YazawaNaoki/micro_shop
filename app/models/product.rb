class Product < ApplicationRecord

  attachment :image

  enum genre:{
    ジャンルを選択してください: 0,
    Jポップや邦楽: 1,
    アニメやゲーム（アニソン・ボーカロイド）: 2,
    ロックやポップス: 3,
    ヒップホップやラップ: 4,
    クラブやダンス: 5,
    ソウル: 6,
    クラシック: 7,
    ハードロックやヘビーメタル: 8,
    レゲエ: 9,
    ブルース: 10,
    ワールド（韓流・Kポップなど）: 11,
    洋楽ジャズ: 12,
    邦楽ジャズ: 13,
    フュージョン: 14,
    サントラ（洋画・韓国ドラマ）: 15,
    サントラ（邦画・テレビドラマ）: 16,
    イージーリスニング（オムニバス・教材）: 17,
    キッズ（アニメ主題歌・ディズニー）: 18,
    演歌や民謡: 19,
    童謡（わらべ歌・手遊び歌）: 20,
    バラエティ（落語・その他）: 21,
    その他: 22
  }

  enum product_status:{
    商品状況を選択してください: 0,
    準備中: 1,
    在庫あり: 2,
    在庫なし: 3,
    在庫なし（近日入荷予定）: 4,
    生産終了: 5
  }

  has_many :cds, inverse_of: :product, :dependent => :destroy
  accepts_nested_attributes_for :cds, reject_if: :all_blank, allow_destroy: true

  belongs_to :artist

  belongs_to :label

  has_many :arrivals, dependent: :destroy

  has_many :cart_items, dependent: :destroy

  has_many :order_products, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :album_name
    validates :sell_at
    validates :price
    validates :product_status
    validates :genre
  end
end
