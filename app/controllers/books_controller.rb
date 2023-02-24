class BooksController < ApplicationController
  require 'google/apis/books_v1'

  def index
    @query = params[:q]
    @genre = params[:genre]

    books_api = Google::Apis::BooksV1::BooksService.new
    books_api.key = ENV['GOOGLE_BOOKS_KEY']

    # Build the query parameters based on the selected genre
    query_params = @query.present? ? { q: @query } : { q: "averageRating:>4" }
    query_params[:subject] = @genre if @genre.present?

    # Query the Books API
    @books = books_api.list_volumes(query_params, max_results: 30)
  end
end
