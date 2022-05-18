defmodule Undercity.FavouritesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Favourites` context.
  """

  @doc """
  Generate a favourite.
  """
  def favourite_fixture(attrs \\ %{}) do
    {:ok, favourite} =
      attrs
      |> Enum.into(%{
        auction_id: "some auction_id",
        user_id: "some user_id"
      })
      |> Undercity.Favourites.create_favourite()

    favourite
  end
end
