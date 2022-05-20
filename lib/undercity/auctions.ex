defmodule Undercity.Auctions do

  import Ecto.Query, warn: false
  alias Undercity.Repo

  alias Undercity.Auctions.Auction

  def list_auctions do
    Auction
    |> Repo.all
    |> Repo.preload(:seller)
  end

  def get_auction!(id) do
    Auction
    |> Repo.get(id)
    |> Repo.preload(:seller)
  end

  def get_user_auctions(id) do
    Auction
    |> where([a], a.user_id == ^id)
    |> order_by([a], desc: a.id)
    |> Repo.all()
  end

  def create_auction(attrs \\ %{}) do
  #  = %{"title" => title, "description" => description, "initial_price" => initial_price, "buyout_price" => buyout_price, "user_id" => user_id}
    %Auction{}
    |> Auction.changeset(attrs)
      # %{title: title, description: description, initial_price: initial_price, buyout_price: buyout_price, user_id: user_id})
    |> IO.inspect()
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
