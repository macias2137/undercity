defmodule Undercity.BidsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Bids` context.
  """

  @doc """
  Generate a bid.
  """
  def bid_fixture(attrs \\ %{}) do
    {:ok, bid} =
      attrs
      |> Enum.into(%{
        auction_id: "some auction_id",
        price: 120.5,
        user_id: "some user_id"
      })
      |> Undercity.Bids.create_bid()

    bid
  end
end
