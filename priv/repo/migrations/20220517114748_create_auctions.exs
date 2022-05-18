defmodule Undercity.Repo.Migrations.CreateAuctions do
  use Ecto.Migration

  def change do
    create table(:auctions) do
      add :description, :string, null: false
      add :initial_price, :decimal, null: false
      add :buyout_price, :decimal
      add :user_id, references(:users)

      timestamps()
    end
  end
end