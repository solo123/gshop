class AccountingDocumentItemsController < ApplicationController
  # GET /accounting_document_items
  # GET /accounting_document_items.json
  def index
    @accounting_document_items = AccountingDocumentItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounting_document_items }
    end
  end

  # GET /accounting_document_items/1
  # GET /accounting_document_items/1.json
  def show
    @accounting_document_item = AccountingDocumentItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounting_document_item }
    end
  end

  # GET /accounting_document_items/new
  # GET /accounting_document_items/new.json
  def new
    @accounting_document_item = AccountingDocumentItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounting_document_item }
    end
  end

  # GET /accounting_document_items/1/edit
  def edit
    @accounting_document_item = AccountingDocumentItem.find(params[:id])
  end

  # POST /accounting_document_items
  # POST /accounting_document_items.json
  def create
    @accounting_document_item = AccountingDocumentItem.new(params[:accounting_document_item])

    respond_to do |format|
      if @accounting_document_item.save
        format.html { redirect_to @accounting_document_item, notice: 'Accounting document item was successfully created.' }
        format.json { render json: @accounting_document_item, status: :created, location: @accounting_document_item }
      else
        format.html { render action: "new" }
        format.json { render json: @accounting_document_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_document_items/1
  # PUT /accounting_document_items/1.json
  def update
    @accounting_document_item = AccountingDocumentItem.find(params[:id])

    respond_to do |format|
      if @accounting_document_item.update_attributes(params[:accounting_document_item])
        format.html { redirect_to @accounting_document_item, notice: 'Accounting document item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounting_document_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_document_items/1
  # DELETE /accounting_document_items/1.json
  def destroy
    @accounting_document_item = AccountingDocumentItem.find(params[:id])
    @accounting_document_item.destroy

    respond_to do |format|
      format.html { redirect_to accounting_document_items_url }
      format.json { head :no_content }
    end
  end
	private
		def accounting_document_item_params
			params.require(:accounting_document_item).permit(:accounting_subject, :brief, :credit, :debit)
    end
end
