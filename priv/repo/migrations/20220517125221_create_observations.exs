defmodule Undercity.Repo.Migrations.CreateObservations do
  use Ecto.Migration

  def change do
    create table(:observations) do
      add :user_id, references(:users)
      add :observed_user_id, references(:users)

      timestamps()
    end

    create unique_index(:observations, [:user_id, :observed_user_id])
  end
end
