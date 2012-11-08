class Api::ProductsController < ApplicationController
  def index
    if params[:root_category].present?
      @categories_list = ["", "&nbsp;"] + ProductCategory.where(:parent_id => params[:root_category]).map { |r| [r.id.to_s, r.name] }
      @response = Hash[@categories_list]
    elsif params[:sub_category].present?
      @products_list =  ["", "&nbsp;"] + Product.where(:category_id => params[:sub_category]).map { |r| [r.id.to_s, r.name] }
      @response = Hash[@products_list]
    end

    respond_to do |format|
      format.json { render json: @response }
    end
  end
end