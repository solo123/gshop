class AccountingDocumentsController < ApplicationController
  # GET /accounting_documents
  # GET /accounting_documents.json
  def index
    @accounting_documents = AccountingDocument.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounting_documents }
    end
  end

  # GET /accounting_documents/1
  # GET /accounting_documents/1.json
  def show
    @accounting_document = AccountingDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounting_document }
    end
  end

  # GET /accounting_documents/new
  # GET /accounting_documents/new.json
  def new
    @accounting_document = AccountingDocument.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounting_document }
    end
  end

  # GET /accounting_documents/1/edit
  def edit
    @accounting_document = AccountingDocument.find(params[:id])
  end

  # POST /accounting_documents
  # POST /accounting_documents.json
  def create
    @accounting_document = AccountingDocument.new(params[:accounting_document])

    respond_to do |format|
      if @accounting_document.save
        format.html { redirect_to @accounting_document, notice: 'Accounting document was successfully created.' }
        format.json { render json: @accounting_document, status: :created, location: @accounting_document }
      else
        format.html { render action: "new" }
        format.json { render json: @accounting_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_documents/1
  # PUT /accounting_documents/1.json
  def update
    @accounting_document = AccountingDocument.find(params[:id])

    respond_to do |format|
      if @accounting_document.update_attributes(params[:accounting_document])
        format.html { redirect_to @accounting_document, notice: 'Accounting document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounting_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_documents/1
  # DELETE /accounting_documents/1.json
  def destroy
    @accounting_document = AccountingDocument.find(params[:id])
    @accounting_document.destroy

    respond_to do |format|
      format.html { redirect_to accounting_documents_url }
      format.json { head :no_content }
    end
  end
	private
		def accounting_document_params
			params.require(:accounting_document).permit(:operator)
		end
end
