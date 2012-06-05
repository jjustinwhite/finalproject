class ListsController < ApplicationController
  before_filter :check_that_user_signed_in
  before_filter :check_that_user_is_administrator, :only => [:index] 
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  def create
    @list = List.new(params[:list])
    @list.user_id = session[:user_id]
    if @list.save
      session[:list_id] = @list.id
      redirect_to @list, notice: 'Wish List was successfully created.' 
    else
      render action: "new"
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /lists/1/checkout   
  def checkout
    if session[:list_id].nil? then
      redirect_to root_url
    else
      @list = List.find(session[:list_id])
      @list.destroy
      session[:list_id] = nil
    end
  end

  # DELETE /lists/1
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    session[:list_id] = nil
    redirect_to root_url
  end
end
