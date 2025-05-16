class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  
  def index
    @portfolio_items = Portfolio.order(:position)
  end  
  
  def sort
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.insert_at(params[:position].to_i + 1)
    head :ok
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
  
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('portfolio_form', partial: 'form', locals: { portfolio_item: @portfolio_item }) }
      else
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('portfolio_form', partial: 'form', locals: { portfolio_item: @portfolio_item }) }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The portfolio item was successfully updated.' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('portfolio_form', partial: 'form', locals: { portfolio_item: @portfolio_item })
        end
      else
        format.html { render :edit }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('portfolio_form', partial: 'form', locals: { portfolio_item: @portfolio_item })
        end
      end
    end
  end  

  def destroy
    #destroy/delete the record
    @portfolio_item.destroy

    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was sucessfully removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy]
                                     )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
