defmodule Undercity.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> Undercity.Users.create_user()

    user
  end
end
