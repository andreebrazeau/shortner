
class UrlMappingController < ApplicationController
    def index
        @mappings = Mapping.all
    end

    def show
        @mapping = Mapping.find(params[:id])
    end

    def new
        @mapping = Mapping.new
    end

    def create
        @mapping = Mapping.new(mapping_params)
        
        if @mapping.save
            redirect_to url_mapping_path(@mapping)
        else
            render 'new'
        end
    end

    def destroy
        @mapping = Mapping.find(params[:id])
        @mapping.destroy

        redirect_to url_mapping_index_path
    end

    private
        def mapping_params
            params.require(:url_mapping).permit(:long_url)
        end

end
