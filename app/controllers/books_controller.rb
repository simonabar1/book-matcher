class BooksController < ApplicationController
  require 'google/apis/books_v1'

  def index
    @query = params[:q]
    if @query.present?
      books_api = Google::Apis::BooksV1::BooksService.new
      books_api.key = ENV['GOOGLE_BOOKS_KEY']
      @books = books_api.list_volumes(@query)
    else
      rating_query = "averageRating:>4"
      books_api = Google::Apis::BooksV1::BooksService.new
      books_api.key = ENV['GOOGLE_BOOKS_KEY']
      @books = books_api.list_volumes(rating_query, max_results: 30)
    end
  end
end
