class BooksController < ApplicationController
	def index
		@books = Book.all
	end
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(strong_params(:title, :pages))
		if @book.save
			redirect_to @book
		else
			render :new
		end
	end
	def show
		@book = get_instance
	end
	def edit
		@book = get_instance
	end
	def update
		# TODO: Add validation before (or during?) running the update.
		book = get_instance
		book.update(strong_params(:title, :pages))
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
