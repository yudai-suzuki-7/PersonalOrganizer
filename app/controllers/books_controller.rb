class BooksController < ApplicationController
  def search
     @books = []

    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        booksGenreId: '001004',
        hits: 20,
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

   private
   def read(result)
    title = result['title']
    url = result['itemUrl']
    isbn = result['isbn']
    author = result['author']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      url: url,
      isbn: isbn,
      author: author,
      image_url: image_url,
    }
  end
end
