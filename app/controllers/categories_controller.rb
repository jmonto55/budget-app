class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.where(user: current_user).order(created_at: :desc)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @expenses = Expense.where(user_id: current_user.id, category_id: @category.id).order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to categories_url, notice: "Category #{category_params[:name]} was successfully created."
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    Expense.where(user_id: current_user.id, category_id: @category.id).destroy_all
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
