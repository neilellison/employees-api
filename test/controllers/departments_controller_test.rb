require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/departments.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Department.count, data.length
  end

  test "show" do
    get "/departments/#{Department.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "manager", "code", "employees"], data.keys
  end

  test "create" do
    assert_difference "Department.count", 1 do 
      post "/departments.json", params: {name: "test_name", manager: "test_manager", code: 1}
      data = JSON.parse(response.body)
      assert_response 201
    end  
  end  

  test "update" do
    patch "/departments/#{Department.first.id}.json", params: {name: "updated department"}
    data = JSON.parse(response.body)
    assert_response 200
    assert_equal "updated department", data["name"]
  end  

  test "destroy" do
    assert_difference "Department.count", -1 do
      delete "/departments/#{Department.first.id}.json"
      assert_response 200
    end
  end  
end
