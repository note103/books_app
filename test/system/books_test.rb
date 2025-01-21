require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  test "should destroy Book" do
    visit books_url

    # 削除ボタンをクリックし、確認ダイアログを処理
    page.accept_confirm do
      find("button", text: /Delete/, visible: :all, match: :first).click
    end

    # 削除成功メッセージを確認
    assert_text "Book was successfully destroyed"
  end
end
