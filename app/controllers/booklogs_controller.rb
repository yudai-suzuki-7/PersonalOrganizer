class BooklogsController < ApplicationController
    def search
     @books = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        booksGenreId: '001004',
        hits: 21,
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

  def index
    @booklogs = Booklog.where(user_id: current_user)
    @booklog = Booklog.new
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
    redirect_to edit_booklog_path(@booklog)
  end

  def edit
    @booklog = Booklog.find(params[:id])
  end

  def update
    @booklog = Booklog.find(params[:id])
    @booklog.update(booklog_params)
    render action: :show
  end

  def destroy
    @booklog = Booklog.find(params[:id])
    @booklog.destroy
    redirect_to booklogs_path
  end

  private
  def booklog_params
     params.require(:booklog).permit(:user_id, :book_title, :book_author, :isbn, :book_img_url, :book_impression)
  end

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
