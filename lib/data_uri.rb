module DataUri
  extend ActiveSupport::Concern

  module ClassMethods
    def data_uri_to_file data_uri
      data = data_uri.try do |uri|
        uri.match(%r{\Adata:(?<type>.*?);(?<encoder>.*?),(?<data>.*)\z}) do |md|
          {
            type:      md[:type],
            encoder:   md[:encoder],
            data:      Base64.decode64(md[:data]),
            extension: md[:type].split('/')[1]
          }
        end
      end
      return nil unless data

      temp_file = Tempfile.new('uploaded-data_uri').tap do |file|
        file.binmode
        file << data[:data]
        file.rewind
      end

      ActionDispatch::Http::UploadedFile.new(
        filename: "data_uri.#{data[:extension]}",
        type:     data[:type],
        tempfile: temp_file
      )
    end
  end
end
