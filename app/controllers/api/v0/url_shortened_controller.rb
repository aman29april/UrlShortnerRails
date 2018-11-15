class Api::V0::UrlShortenedController < Api::ApplicationController
   before_action :set_resources, only: :index
   before_action :set_resource, only: [:show, :destroy]

   # GET /url_shortened
   def index
     json_response(@resources)
   end

   # GET /url_shortened/:id
   def show
     return json_response({error: 'not found'}, 404) unless @resource
     json_response(@resource)
   end

   # POST /url_shortened/
   def create
     @resource = resource_class.short(params[:id])
     json_response({key: @resource}, :created)
   end

   # DELETE /url_shortened/:id
   def destroy
     resource_class.destroy(params[:id])
     head :no_content
   end

   private

   def set_resource
     @resource = resource_class.expand(params[:id])
   end

   def set_resources
     @resources = resource_class.all
   end

   def resource_class
     ShortUrl
   end
end
