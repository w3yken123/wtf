require 'test_helper'

class UserProfilesControllerTest < ActionController::TestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_profile" do
    assert_difference('UserProfile.count') do
      post :create, user_profile: { add_labor: @user_profile.add_labor, address: @user_profile.address, bank_account: @user_profile.bank_account, bank_code: @user_profile.bank_code, beneficiary_name: @user_profile.beneficiary_name, birthday: @user_profile.birthday, blood_type: @user_profile.blood_type, borrow_money: @user_profile.borrow_money, branch_name: @user_profile.branch_name, day_qk: @user_profile.day_qk, del_labor_date: @user_profile.del_labor_date, first_work: @user_profile.first_work, identification: @user_profile.identification, last_work: @user_profile.last_work, name: @user_profile.name, protect_salary: @user_profile.protect_salary, salary: @user_profile.salary, sex: @user_profile.sex, surname: @user_profile.surname, telephone: @user_profile.telephone, user_id: @user_profile.user_id, work_com: @user_profile.work_com, work_title: @user_profile.work_title, year_qk: @user_profile.year_qk }
    end

    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should show user_profile" do
    get :show, id: @user_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_profile
    assert_response :success
  end

  test "should update user_profile" do
    put :update, id: @user_profile, user_profile: { add_labor: @user_profile.add_labor, address: @user_profile.address, bank_account: @user_profile.bank_account, bank_code: @user_profile.bank_code, beneficiary_name: @user_profile.beneficiary_name, birthday: @user_profile.birthday, blood_type: @user_profile.blood_type, borrow_money: @user_profile.borrow_money, branch_name: @user_profile.branch_name, day_qk: @user_profile.day_qk, del_labor_date: @user_profile.del_labor_date, first_work: @user_profile.first_work, identification: @user_profile.identification, last_work: @user_profile.last_work, name: @user_profile.name, protect_salary: @user_profile.protect_salary, salary: @user_profile.salary, sex: @user_profile.sex, surname: @user_profile.surname, telephone: @user_profile.telephone, user_id: @user_profile.user_id, work_com: @user_profile.work_com, work_title: @user_profile.work_title, year_qk: @user_profile.year_qk }
    assert_redirected_to user_profile_path(assigns(:user_profile))
  end

  test "should destroy user_profile" do
    assert_difference('UserProfile.count', -1) do
      delete :destroy, id: @user_profile
    end

    assert_redirected_to user_profiles_path
  end
end
