defmodule Undercity.Auctions.Auction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auctions" do
    field :title, :string
    field :description, :string
    field :initial_price, :decimal
    field :buyout_price, :decimal
    belongs_to :user, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(auction, attrs \\ %{}) do
    auction
    |> cast(attrs, [:title, :description, :initial_price, :buyout_price, :user_id])
    |> validate_required([:title, :description, :initial_price, :user_id])
  end
end
