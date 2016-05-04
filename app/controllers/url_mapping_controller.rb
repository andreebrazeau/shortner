
class UrlMappingController < ApplicationController
    def index
        @mappings = Mapping.all
    end

    def create
        @mapping = Mapping.new(mapping_params)

        if @mapping.save
            render json: @mapping
        else
            render json: @mapping.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @mapping = Mapping.find(params[:id])
        @mapping.destroy
        head :no_content
    end

    def goto
        @mapping = Mapping.find_by(url_hash: params[:url_hash])

        redirect_to @mapping.long_url
    end

    private
        def mapping_params
            params.require(:url_mapping).permit(:long_url)
        end

end
