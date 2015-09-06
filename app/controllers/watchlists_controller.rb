class WatchlistsController < ApplicationController
	before_action :logged_in_user

  def create
    @movie = Movie.find(params[:movie_id])
  end
=begin
  def create
    if params[:asin]
      @item = Item.find_or_initialize_by(asin: params[:asin])
    else
      @item = Item.find(params[:item_id])
    end

    # itemsテーブルに存在しない場合はAmazonのデータを登録する。
    if @item.new_record?
      begin
        # TODO 商品情報の取得 Amazon::Ecs.item_lookupを用いてください
        response = Amazon::Ecs.item_lookup(params[:asin] , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      rescue Amazon::RequestError => e
        return render :js => "alert('#{e.message}')"
      end
      
      #p response
      
      amazon_item       = response.items.first
      @item.title        = amazon_item.get('ItemAttributes/Title')
      @item.small_image  = amazon_item.get("SmallImage/URL")
      @item.medium_image = amazon_item.get("MediumImage/URL")
      @item.large_image  = amazon_item.get("LargeImage/URL")
      @item.detail_page_url = amazon_item.get("DetailPageURL")
      @item.raw_info        = amazon_item.get_hash
      @item.save!
    end

    # TODO ユーザにwant or haveを設定する
    # params[:type]の値ににHaveボタンが押された時にはの時は「Have」,
    # Wantボタンがされた時には「Want」が設定されています。
    if params[:type] == "Have"
      current_user.have(@item)
    else
      current_user.want(@item)
    end

  end
=end
	def destroy
		
	end
=begin
  def destroy
    if params[:type] == "Wathed"
      @movie = current_user.watched_movies.find(params[:movie_id])
      current_user.watched(@movie)
    else
      @movie = current_user.want_movies.find(params[:movie_id])
      current_user.unwant(@movie)
    end
    # TODO 紐付けの解除。 
    # params[:type]の値ににHavedボタンが押された時にはの時は「Have」,
    # Wantedボタンがされた時には「Want」が設定されています。

  end
=end
end
