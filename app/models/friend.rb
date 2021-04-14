class Friend < ApplicationRecord
    attr_accessor :remove_avatar

    belongs_to :user
    has_one_attached :avatar
    validate :avatar_blob

=begin
    def resize_image
        resized_image = MiniMagick::Image.read(avatar.download)
        resized_image = resized_image.resize "400x400"
        v_filename = avatar.filename
        v_content_type = avatar.content_type
        avatar.purge
        avatar.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
    end

    private

    def avatar_format
        return unless avatar.attached?
        if avatar.blob.content_type.start_with? 'image/'
            if avatar.blob.byte_size > 10.megabytes
                errors.add(:avatar, 'size needs to be less than 10MB')
                avatar.purge
            else
                resize_image
            end

        else
            avatar.purge
            errors.add(:avatar, 'needs to be an image')
        end
    end
=end
    
end
