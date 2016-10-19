class PhotosController < ResourcesController
    def new
      load_parent
      @object = Photo.new
    end
    def create
      load_parent
      @object = Photo.new(params[:photo])
      if @object.save
        if @parent
          @parent.photos << @object
          @parent.save
          redirect_to @parent
          return
        end
      else
        flash[:error] = @object.errors.full_messages.to_sentence
        @no_log = 1
      end
      redirect_to :action => :new
    end

      def load_collection
        load_parent
        @collection = @parent.photos
      end 
      def load_object
        load_parent
        @object = Photo.find_by_id(params[:id])
      end
      def load_parent
        @parent = if params[:serial_product_id]
                    SerialProduct.find(params[:serial_product_id]) 
                  elsif params[:guitar_id]
                    Guitar.find(params[:guitar_id])
                  end
      end
	private
		def photo_params
			params.require(:photo).permit(:photo_data_id, :photo_data_type, :pic)
    end
end
