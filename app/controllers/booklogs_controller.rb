class BooklogsController < ApplicationController
  def index
    @booklogs = Booklog.all
  end

  def create
      @booklog = Item.find_or_initialize_by(isbn: params[:isbn])
      results = RakutenWebService::Books::Book.search(isbn: @item.isbn)
      @item = Item.new(read(results.first))
      @item.save
    end
    render action: :index

  end

  private
  def booklog_params
     params.require(:booklog).permit(:user_id, :book_title, :book_author, :book_img, :book_impression)
  end

  private
  def read(result)
    title = result['title']
    url = result['itemUrl']
    author = result['author']
    isbn = result['isbn']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      url: url,
      author: author ,
      isbn: isbn,
      image_url: image_url,
    }
  end

end
