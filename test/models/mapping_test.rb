require 'test_helper'

class MappingTest < ActiveSupport::TestCase
	test "should not save with empty url" do
  		mapping_url = Mapping.new
		assert_not mapping_url.save, "Saved the mapping without a url"
  	end

	test "should not save without valid url" do
  		mapping_url = Mapping.new(long_url: "notarul.com")
		assert_not mapping_url.save, "Saved the mapping without a url"
  	end

	test "should save be successful" do
  		mapping_url = Mapping.new(long_url: "https://foo.com")
		assert mapping_url.save, "Saved the mapping successfully"
  	end

	test "should generate a short url" do
  		mapping_url = Mapping.new(long_url: "https://foo.com")
  		mapping_url.save
		assert_not_nil mapping_url.url_hash, "Generate a url_hash from long url"
  	end

  	test "Should generate different url hash each time" do
  		mapping_url_1 = Mapping.new(long_url: "https://foo.com")
  		mapping_url_1.save
  		mapping_url_2 = Mapping.new(long_url: "https://foo.com")
  		mapping_url_2.save

		assert_not_equal mapping_url_1.url_hash, mapping_url_2.url_hash, "Check if 2 mapping generate different short url"
  	end

end
