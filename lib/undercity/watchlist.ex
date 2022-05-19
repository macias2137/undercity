defmodule Undercity.Watchlist do

  import Ecto.Query, warn: false
  alias Undercity.Repo

  alias Undercity.Watchlist.Observation

  def list_observations do
    Repo.all(Observation)
  end

  def get_observation!(id), do: Repo.get!(Observation, id)

  def create_observation(attrs \\ %{}) do
    %Observation{}
    |> Observation.changeset(attrs)
    |> Repo.insert()
  end

  def update_observation(%Observation{} = observation, attrs) do
    observation
    |> Observation.changeset(attrs)
    |> Repo.update()
  end

  def delete_observation(%Observation{} = observation) do
    Repo.delete(observation)
  end

  def change_observation(%Observation{} = observation, attrs \\ %{}) do
    Observation.changeset(observation, attrs)
  end
end
