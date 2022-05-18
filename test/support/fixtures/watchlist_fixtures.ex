defmodule Undercity.WatchlistFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Watchlist` context.
  """

  @doc """
  Generate a observation.
  """
  def observation_fixture(attrs \\ %{}) do
    {:ok, observation} =
      attrs
      |> Enum.into(%{
        observed_user_id: "some observed_user_id",
        user_id: "some user_id"
      })
      |> Undercity.Watchlist.create_observation()

    observation
  end
end
