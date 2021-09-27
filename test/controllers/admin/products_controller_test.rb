require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get ,index" do
    get admin_products_,index_url
    assert_response :success
  end

  test "should get ,new" do
    get admin_products_,new_url
    assert_response :success
  end

  test "should get ,create" do
    get admin_products_,create_url
    assert_response :success
  end

  test "should get ,show" do
    get admin_products_,show_url
    assert_response :success
  end

  test "should get ,update" do
    get admin_products_,update_url
    assert_response :success
  end

  test "should get ,edit" do
    get admin_products_,edit_url
    assert_response :success
  end

end
