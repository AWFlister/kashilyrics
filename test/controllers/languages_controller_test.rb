require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language = languages(:en)
    @lang_zz = languages(:zz)
  end

  test "should get index" do
    get languages_url, as: :json
    assert_response :success
  end

  test "should create language" do
    assert_difference("Language.count") do
      post languages_url, params: { language: { lang_code: @language.lang_code, lang_name: @language.lang_name } }, as: :json
    end

    assert_response :created
  end

  test "should show language" do
    get language_url(@language), as: :json
    assert_response :success
  end

  test "should update language" do
    patch language_url(@language), params: { language: { lang_code: @language.lang_code, lang_name: @language.lang_name } }, as: :json
    assert_response :success
  end

  test "shouldn't update ZZ language" do
    patch language_url(@lang_zz), params: { language: { lang_code: "??", lang_name: "????" } }, as: :json
    assert_response :forbidden
    get language_url(@lang_zz), as: :json
    assert_equal(@lang_zz.lang_code, JSON.parse(response.body)["lang_code"])
  end

  test "should destroy language" do
    assert_difference("Language.count", -1) do
      delete language_url(@language), as: :json
    end

    assert_response :no_content
  end

  test "shouldn't destroy ZZ language" do
    delete language_url(@lang_zz), as: :json
    assert_response :forbidden
    get language_url(@lang_zz), as: :json
    assert_not_empty JSON.parse(response.body)
  end
end
