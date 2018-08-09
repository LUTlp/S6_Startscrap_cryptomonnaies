require 'test_helper'

class ResultatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resultat_index_url
    assert_response :success
  end

end
