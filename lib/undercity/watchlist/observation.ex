defmodule Undercity.Watchlist.Observation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "observations" do
    belongs_to :user, Undercity.Users.User

    timestamps()
  end

  @doc false
  def changeset(observation, attrs) do
    observation
    |> cast(attrs, [:user_id, :observed_user_id])
    |> validate_required([:user_id, :observed_user_id])
  end
end
