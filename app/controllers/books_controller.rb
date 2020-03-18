class BooksController < ApplicationController
	def index
		@books = Book.all
	end
	def show
		@book = get_instance
		# @authors = Author.all
		@authors = available_authors_to_add
	end
	def update
		book = get_instance
		# NOTE: this validation logic "works" but offers no user
		#		feedback, and also doesn't leverage the validation
		#		that exists in the model. The validation in the model
		#		works, but we are unsure how to catch that error
		#		properly in order to redirect.
		if book.authors.include?(Author.find(params[:book][:authors]))
			redirect_to book
		else
			book.authors << Author.find(params[:book][:authors])
			redirect_to book
		end
	end
	def destroy
		book = get_instance
		book.authors.delete(params[:author_id])
		redirect_to book
	end
	
	private
	
	# not using this currently
	# def strong_params(*args)
	# 	params.require(:book).permit(*args)
	# end
	def get_instance
		Book.find(params[:id])
	end
	def available_authors_to_add
		Author.all - @book.authors
	end
end

