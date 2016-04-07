require 'digest/md5'
require 'base64'

class Mapping < ActiveRecord::Base
	validate :valid_url
	validates :long_url, presence: true
	before_create :get_short

	def valid_url
		begin
			uri = URI.parse(long_url)
			if not uri.kind_of?(URI::HTTP)
				errors.add(:long_url, "not a valid url")
			end
		rescue URI::Error => e
			errors.add(:long_url, "not a valid url")
		end


	end

	def get_short
		rand_str = (0...8).map { (65 + rand(26)).chr }.join
        hashed = Digest::MD5.digest(self.long_url + rand_str)
        self.url_hash = Base64.urlsafe_encode64(hashed)[0..6]
    end
end
