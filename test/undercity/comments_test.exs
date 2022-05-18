defmodule Undercity.CommentsTest do
  use Undercity.DataCase

  alias Undercity.Comments

  describe "comments" do
    alias Undercity.Comments.Comment

    import Undercity.CommentsFixtures

    @invalid_attrs %{contents: nil, recipient_id: nil, user_id: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Comments.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Comments.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{contents: "some contents", recipient_id: "some recipient_id", user_id: "some user_id"}

      assert {:ok, %Comment{} = comment} = Comments.create_comment(valid_attrs)
      assert comment.contents == "some contents"
      assert comment.recipient_id == "some recipient_id"
      assert comment.user_id == "some user_id"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{contents: "some updated contents", recipient_id: "some updated recipient_id", user_id: "some updated user_id"}

      assert {:ok, %Comment{} = comment} = Comments.update_comment(comment, update_attrs)
      assert comment.contents == "some updated contents"
      assert comment.recipient_id == "some updated recipient_id"
      assert comment.user_id == "some updated user_id"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Comments.update_comment(comment, @invalid_attrs)
      assert comment == Comments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Comments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Comments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Comments.change_comment(comment)
    end
  end
end
