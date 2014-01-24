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
        if @asset = @sprockets.find_asset(asset_path)
          true
        else
          false
        end
      end

      def generate_etag
        @asset.digest
      end


      def last_modified
        @asset.mtime
      end

      def produce_asset
        @asset.to_s
      end

      private
      def mime_type
        @sprockets.content_type_of(asset_path)
      end

      def asset_path
        path = request.path_tokens.join('/')
        if fingerprint = path[/-([0-9a-f]{7,40})\.[^.]+$/, 1]
          path = path.sub("-#{fingerprint}", '')
        end
        path
      end
    end
  end
end
