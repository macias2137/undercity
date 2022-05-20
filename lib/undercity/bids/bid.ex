defmodule Undercity.Bids.Bid do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bids" do
    belongs_to :auction, Undercity.Auctions.Auction
    field :bid_value, :decimal
    belongs_to :bidder, Undercity.Users.User
    belongs_to :seller, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(bid, attrs) do
    bid
    |> cast(attrs, [:auction_id, :bidder_id, :bid_value, :seller_id])
    |> validate_required([:auction_id, :bidder_id, :bid_value, :seller_id])
  end
end
