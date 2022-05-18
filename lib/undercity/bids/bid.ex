defmodule Undercity.Bids.Bid do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bids" do
    belongs_to :auction, Undercity.Auctions.Auction
    field :bid_value, :decimal
    belongs_to :user, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(bid, attrs) do
    bid
    |> cast(attrs, [:auction_id, :user_id, :price])
    |> validate_required([:auction_id, :user_id, :price])
  end
end
