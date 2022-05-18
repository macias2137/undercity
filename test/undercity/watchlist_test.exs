defmodule Undercity.WatchlistTest do
  use Undercity.DataCase

  alias Undercity.Watchlist

  describe "observations" do
    alias Undercity.Watchlist.Observation

    import Undercity.WatchlistFixtures

    @invalid_attrs %{observed_user_id: nil, user_id: nil}

    test "list_observations/0 returns all observations" do
      observation = observation_fixture()
      assert Watchlist.list_observations() == [observation]
    end

    test "get_observation!/1 returns the observation with given id" do
      observation = observation_fixture()
      assert Watchlist.get_observation!(observation.id) == observation
    end

    test "create_observation/1 with valid data creates a observation" do
      valid_attrs = %{observed_user_id: "some observed_user_id", user_id: "some user_id"}

      assert {:ok, %Observation{} = observation} = Watchlist.create_observation(valid_attrs)
      assert observation.observed_user_id == "some observed_user_id"
      assert observation.user_id == "some user_id"
    end

    test "create_observation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Watchlist.create_observation(@invalid_attrs)
    end

    test "update_observation/2 with valid data updates the observation" do
      observation = observation_fixture()
      update_attrs = %{observed_user_id: "some updated observed_user_id", user_id: "some updated user_id"}

      assert {:ok, %Observation{} = observation} = Watchlist.update_observation(observation, update_attrs)
      assert observation.observed_user_id == "some updated observed_user_id"
      assert observation.user_id == "some updated user_id"
    end

    test "update_observation/2 with invalid data returns error changeset" do
      observation = observation_fixture()
      assert {:error, %Ecto.Changeset{}} = Watchlist.update_observation(observation, @invalid_attrs)
      assert observation == Watchlist.get_observation!(observation.id)
    end

    test "delete_observation/1 deletes the observation" do
      observation = observation_fixture()
      assert {:ok, %Observation{}} = Watchlist.delete_observation(observation)
      assert_raise Ecto.NoResultsError, fn -> Watchlist.get_observation!(observation.id) end
    end

    test "change_observation/1 returns a observation changeset" do
      observation = observation_fixture()
      assert %Ecto.Changeset{} = Watchlist.change_observation(observation)
    end
  end
end
