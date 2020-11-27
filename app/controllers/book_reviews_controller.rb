class BookReviewsController < ApplicationController
  before_action :set_book_review, only: [:show, :edit, :update, :destroy]

  # GET /book_reviews
  # GET /book_reviews.json
  def index
    @book_reviews = BookReview.all
  end

  # GET /book_reviews/1
  # GET /book_reviews/1.json
  def show
  end

  # GET /book_reviews/new
  def new
    @book_review = BookReview.new
  end

  # GET /book_reviews/1/edit
  def edit
  end

  # POST /book_reviews
  # POST /book_reviews.json
  def create
    @book_review = BookReview.new(book_review_params)

    respond_to do |format|
      if @book_review.save
        format.html { redirect_to @book_review, notice: 'Book review was successfully created.' }
        format.json { render :show, status: :created, location: @book_review }
      else
        format.html { render :new }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_reviews/1
  # PATCH/PUT /book_reviews/1.json
  def update
    respond_to do |format|
      if @book_review.update(book_review_params)
        format.html { redirect_to @book_review, notice: 'Book review was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_review }
      else
        format.html { render :edit }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_reviews/1
  # DELETE /book_reviews/1.json
  def destroy
    @book_review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_url, notice: 'Book review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_review
      @book_review = BookReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_review_params
      params.require(:book_review).permit(:user_id, :book_id, :review)
    end
end
