class BooklogsController < ApplicationController
  def index
    @booklogs = Booklog.all
  end

  def show
    @booklog = Booklog.find(params[:id])
  end

  def create
    @booklog = Booklog.find_or_initialize_by(isbn: params[:isbn])
    results = RakutenWebService::Books::Book.search(isbn: @booklog.isbn)
    @booklog = Booklog.new(read(results.first))
    @booklog.user_id = current_user.id
    @booklog.save!
    redirect_to booklogs_path
  end

 private
   def read(result)
    title = result['title']
    url = result['itemUrl']
    isbn = result['isbn']
    author = result['author']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      book_title: title,
      isbn: isbn,
      book_author: author,
      book_img_url: image_url,
    }
  end

end
