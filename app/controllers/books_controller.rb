class BooksController < ApplicationController
  def search
    if params[:keyword]
      result = RakutenWebService::Books::Book.search(title: params[:keyword])
      @booklog = Booklog.new

      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
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
