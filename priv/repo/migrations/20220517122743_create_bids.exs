defmodule Undercity.Repo.Migrations.CreateBids do
  use Ecto.Migration

  def change do
    create table(:bids) do
      add :auction_id, references(:auctions)
      add :user_id, references(:users)
      add :bid_value, :decimal, null: false

      timestamps()
    end
  end
end
