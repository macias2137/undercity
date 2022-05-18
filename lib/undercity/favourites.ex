defmodule Undercity.Favourites do
  @moduledoc """
  The Favourites context.
  """

  import Ecto.Query, warn: false
  alias Undercity.Repo

  alias Undercity.Favourites.Favourite

  @doc """
  Returns the list of favourites.

  ## Examples

      iex> list_favourites()
      [%Favourite{}, ...]

  """
  def list_favourites do
    Repo.all(Favourite)
  end

  @doc """
  Gets a single favourite.

  Raises `Ecto.NoResultsError` if the Favourite does not exist.

  ## Examples

      iex> get_favourite!(123)
      %Favourite{}

      iex> get_favourite!(456)
      ** (Ecto.NoResultsError)

  """
  def get_favourite!(id), do: Repo.get!(Favourite, id)

  @doc """
  Creates a favourite.

  ## Examples

      iex> create_favourite(%{field: value})
      {:ok, %Favourite{}}

      iex> create_favourite(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_favourite(attrs \\ %{}) do
    %Favourite{}
    |> Favourite.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a favourite.

  ## Examples

      iex> update_favourite(favourite, %{field: new_value})
      {:ok, %Favourite{}}

      iex> update_favourite(favourite, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_favourite(%Favourite{} = favourite, attrs) do
    favourite
    |> Favourite.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a favourite.

  ## Examples

      iex> delete_favourite(favourite)
      {:ok, %Favourite{}}

      iex> delete_favourite(favourite)
      {:error, %Ecto.Changeset{}}

  """
  def delete_favourite(%Favourite{} = favourite) do
    Repo.delete(favourite)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking favourite changes.

  ## Examples

      iex> change_favourite(favourite)
      %Ecto.Changeset{data: %Favourite{}}

  """
  def change_favourite(%Favourite{} = favourite, attrs \\ %{}) do
    Favourite.changeset(favourite, attrs)
  end
end
