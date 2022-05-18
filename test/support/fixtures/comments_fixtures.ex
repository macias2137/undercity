defmodule Undercity.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        contents: "some contents",
        recipient_id: "some recipient_id",
        user_id: "some user_id"
      })
      |> Undercity.Comments.create_comment()

    comment
  end
end
