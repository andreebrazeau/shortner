require 'test_helper'

class UrlMappingControllerTest < ActionController::TestCase
	setup do
		@mapping = mappings(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:mappings)
	end

	test "should show mapping" do
		get :show, id: @mapping
    	assert_response :success
	end

	test "should get new" do
    	get :new
    	assert_response :success
  	end

  	test "should create new" do
  		assert_difference('Mapping.count') do
      		post :create, url_mapping: { long_url: @mapping.long_url }

    	end
      	assert_redirected_to url_mapping_path(assigns(:mapping))
  	end

  	test "should fail create new" do 
  		post :create, url_mapping: { long_url: "asdfasdf" }
  		assert_response :success
  	end

  	test "should destroy" do
  		assert_difference('Mapping.count', -1) do
	  		delete :destroy, id: @mapping
	  	end
	  	assert_redirected_to url_mapping_index_path
	end

	test "should goto longurl" do
		get :goto, url_hash: @mapping.url_hash
		assert_redirected_to @mapping.long_url
	end
end
