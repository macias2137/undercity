defmodule Undercity.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :user_id, references(:users)
      add :recipient_id, references(:users)
      add :auction_id, references(:auctions)
      add :contents, :string

      timestamps()
    end

    create unique_index(:comments, [:user_id, :recipient_id, :auction_id])
  end
end
