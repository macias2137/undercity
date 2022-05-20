defmodule Undercity.Repo.Migrations.CreateAuctions do
  use Ecto.Migration

  def change do
    create table(:auctions) do
      add :title, :string, null: false
      add :description, :string, null: false
      add :initial_price, :decimal, null: false
      add :end_date, :utc_datetime, null: false
      add :buyout_price, :decimal
      add :seller_id, references(:users), null: false

      timestamps()
    end

    create constraint("auctions", :buyout_price_must_be_greater_than_initial_price, check: "buyout_price > initial_price")
  end
end
