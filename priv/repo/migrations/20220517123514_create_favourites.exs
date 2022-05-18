defmodule Undercity.Repo.Migrations.CreateFavourites do
  use Ecto.Migration

  def change do
    create table(:favourites) do
      add :auction_id, references(:auctions)
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:favourites, [:auction_id, :user_id])
  end
end
