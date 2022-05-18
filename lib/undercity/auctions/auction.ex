defmodule Undercity.Auctions.Auction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auctions" do
    field :buyout_price, :decimal
    field :description, :string
    field :initial_price, :decimal
    field :expiration_date, :utc_datetime
    belongs_to :user, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(auction, attrs) do
    auction
    |> cast(attrs, [:description, :initial_price, :buyout_price, :expiration_date, :seller_id])
    |> validate_required([:description, :initial_price])
  end
end
