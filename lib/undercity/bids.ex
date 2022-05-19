defmodule Undercity.Bids do

  import Ecto.Query, warn: false
  alias Undercity.Repo
  alias Undercity.Bids.Bid
  alias Undercity.Auctions

  def list_bids do
    Repo.all(Bid)
  end

  def get_bid!(id), do: Repo.get!(Bid, id)

  def get_bids_by_auction_id(auction_id) do
    Bid
    |> where([b], b.auction_id == ^auction_id)
    |> Repo.all()
  end

  def get_highest_bid_by_auction_id(auction_id) do
    Bid
    |> where([b], b.auction_id == ^auction_id)
    # |> select([b], max(b.bid_value))
    |> order_by([b], desc: b.bid_value)
    |> limit(1)
    |> preload(:user)
    |> Repo.one()
  end

  def create_bid(attrs \\ %{}) do
    %Bid{}
    |> Bid.changeset(attrs)
    |> Repo.insert()
  end

  def update_bid(%Bid{} = bid, attrs) do
    bid
    |> Bid.changeset(attrs)
    |> Repo.update()
  end

  def delete_bid(%Bid{} = bid) do
    Repo.delete(bid)
  end

  def change_bid(%Bid{} = bid, attrs \\ %{}) do
    Bid.changeset(bid, attrs)
  end
end
