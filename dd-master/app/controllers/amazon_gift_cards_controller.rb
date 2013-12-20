class AmazonGiftCardsController < ApplicationController
  # GET /amazon_gift_cards
  # GET /amazon_gift_cards.json
  def index
    @amazon_gift_cards = AmazonGiftCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @amazon_gift_cards }
    end
  end

  # GET /amazon_gift_cards/1
  # GET /amazon_gift_cards/1.json
  def show
    @amazon_gift_card = AmazonGiftCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @amazon_gift_card }
    end
  end

  # GET /amazon_gift_cards/new
  # GET /amazon_gift_cards/new.json
  def new
    @amazon_gift_card = AmazonGiftCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @amazon_gift_card }
    end
  end

  # GET /amazon_gift_cards/1/edit
  def edit
    @amazon_gift_card = AmazonGiftCard.find(params[:id])
  end

  # POST /amazon_gift_cards
  # POST /amazon_gift_cards.json
  def create
    @amazon_gift_card = AmazonGiftCard.new(params[:amazon_gift_card])

    respond_to do |format|
      if @amazon_gift_card.save
        format.html { redirect_to @amazon_gift_card, notice: 'Amazon gift card was successfully created.' }
        format.json { render json: @amazon_gift_card, status: :created, location: @amazon_gift_card }
      else
        format.html { render action: "new" }
        format.json { render json: @amazon_gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /amazon_gift_cards/1
  # PUT /amazon_gift_cards/1.json
  def update
    @amazon_gift_card = AmazonGiftCard.find(params[:id])

    respond_to do |format|
      if @amazon_gift_card.update_attributes(params[:amazon_gift_card])
        format.html { redirect_to @amazon_gift_card, notice: 'Amazon gift card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @amazon_gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amazon_gift_cards/1
  # DELETE /amazon_gift_cards/1.json
  def destroy
    @amazon_gift_card = AmazonGiftCard.find(params[:id])
    @amazon_gift_card.destroy

    respond_to do |format|
      format.html { redirect_to amazon_gift_cards_url }
      format.json { head :no_content }
    end
  end
  
  
end
