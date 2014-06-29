module Webmachine
  module Sprockets
    class Resource < ::Webmachine::Resource
      class << self
        attr_accessor :sprockets
      end

      def content_types_provided
        return [['text/html', nil]] if mime_type.nil?
        [[mime_type, :produce_asset]]
      end

      def resource_exists?
        if @asset = self.class.sprockets.find_asset(asset_path)
          true
        else
          false
        end
      end
      
      def forbidden?
        asset_path.include?('..')
      end

      def generate_etag
        @asset.digest
      end


      def last_modified
        @asset.mtime
      end

      def produce_asset
        File.new(@asset.pathname, 'rb')
      end

      private
      def mime_type
        self.class.sprockets.content_type_of(asset_path)
      end

      def asset_path
        path = request.path_tokens.join('/')
        if fingerprint = path[/-([0-9a-f]{7,40})\.[^.]+$/, 1]
          @expires = true
          path = path.sub("-#{fingerprint}", '')
        else
          @expires = false
        end
        path
      end
    end
  end
end
