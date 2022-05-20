defmodule Undercity.Repo.Migrations.CreateBids do
  use Ecto.Migration

  def change do
    create table(:bids) do
      add :auction_id, references(:auctions), null: false
      add :bidder_id, references(:users), null: false
      add :bid_value, :decimal, null: false
      add :seller_id, references(:users), null: false

      timestamps()
    end
  end
end
