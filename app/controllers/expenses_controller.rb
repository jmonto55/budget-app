class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expense_url(@expense), notice: 'expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
  # def create
  #   @category = Category.find(params[:category_id])
  #   @expense = @category.expenses.build(expense_params)
  
  #   if @expense.save
  #     redirect_to category_path(@category), notice: 'Expense was successfully created.'
  #   else
  #     puts @expense.errors.inspect # Add this line to inspect the errors object
  #     render :new
  #   end
  # end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:user_id, :name, :amount, :created_at, :category_id)
  end
end
