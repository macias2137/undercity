defmodule Undercity.AuctionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Undercity.Auctions` context.
  """

  @doc """
  Generate a auction.
  """
  def auction_fixture(attrs \\ %{}) do
    {:ok, auction} =
      attrs
      |> Enum.into(%{
        buyout_price: 120.5,
        description: "some description",
        expiration_date: ~U[2022-05-16 11:47:00Z],
        initial_price: 120.5,
        seller_id: 42
      })
      |> Undercity.Auctions.create_auction()

    auction
  end
end
