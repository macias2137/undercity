defmodule Undercity.Favourites.Favourite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "favourites" do
    belongs_to :auction, Undercity.Auctions.Auction
    belongs_to :user, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(favourite, attrs) do
    favourite
    |> cast(attrs, [:auction_id, :user_id])
    |> validate_required([:auction_id, :user_id])
  end
end
