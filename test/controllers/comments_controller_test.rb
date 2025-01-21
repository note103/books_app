require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment" do
    book = books(:one) # fixtureから取得
    comment_params = { comment: { body: "MyString" } }

    # POSTリクエストを送信
    assert_difference("Comment.count", 1) do
      post book_comments_path(book), params: comment_params
    end

    # 保存されたコメントを確認
    comment = Comment.last
    assert_equal "MyString", comment.body

    # ページに表示されているか確認
    follow_redirect!
    assert_response :success

    # コメントが<ul>内の<li>タグに含まれていることを確認
    assert_select "ul > li", /MyString/
  end
end
