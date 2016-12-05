require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { city: @profile.city, cleanliness_level: @profile.cleanliness_level, gender: @profile.gender, has_residence_already: @profile.has_residence_already, is_a_smoker: @profile.is_a_smoker, outgoingness_level: @profile.outgoingness_level, pet_friendly: @profile.pet_friendly, postal_code: @profile.postal_code, quietness_level: @profile.quietness_level, state: @profile.state, street: @profile.street, user_name: @profile.user_name } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { city: @profile.city, cleanliness_level: @profile.cleanliness_level, gender: @profile.gender, has_residence_already: @profile.has_residence_already, is_a_smoker: @profile.is_a_smoker, outgoingness_level: @profile.outgoingness_level, pet_friendly: @profile.pet_friendly, postal_code: @profile.postal_code, quietness_level: @profile.quietness_level, state: @profile.state, street: @profile.street, user_name: @profile.user_name } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
