defmodule Undercity.Auctions do

  import Ecto.Query, warn: false
  alias Undercity.Repo

  alias Undercity.Auctions.Auction


  def list_auctions do
    Repo.all(Auction)
  end

  def get_auction!(id), do: Repo.get!(Auction, id)

  def create_auction(attrs \\ %{}) do
    %Auction{}
    |> Auction.changeset(attrs)
    |> Repo.insert()
  end

  def update_auction(%Auction{} = auction, attrs) do
    auction
    |> Auction.changeset(attrs)
    |> Repo.update()
  end

  def delete_auction(%Auction{} = auction) do
    Repo.delete(auction)
  end

  def change_auction(%Auction{} = auction, attrs \\ %{}) do
    Auction.changeset(auction, attrs)
  end
end
