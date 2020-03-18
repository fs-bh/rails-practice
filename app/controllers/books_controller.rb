class BooksController < ApplicationController
	def index
		@books = Book.all
	end
	def show
		@book = get_instance
		@authors = Author.all
	end
	def update
		# TODO: Add validation before (or during?) running the update.
		book = get_instance
		book.authors << Author.find(params[:book][:authors])
		redirect_to book
	end
	
	private
	
	def strong_params(*args)
		params.require(:book).permit(*args)
	end
	def get_instance
		Book.find(params[:id])
	end
end

