require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

    def setup
        @category = Category.create(name: "sports")
        @user = User.create( user_name: "testAdmin", email: "testadmin@example.com", password: "password", admin: true)
    end

    test "should get the categories index" do
        get :index
        assert_response :success
    end

    test "should get new category" do
        session[:user_id] = @user.id
        get :new
        assert_response :success
    end

    test "should get category show for id" do
        get(:show, {'id' => @category.id})
        assert_response :success
    end
    
    test "should restrict creation to admin" do
        assert_no_difference 'Category.count' do
            post :create, category: { name: "Data Structures"}
        end
        assert_redirected_to categories_path
    end
end