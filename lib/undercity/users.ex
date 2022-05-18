defmodule Undercity.Users do

  import Ecto.Query, warn: false
  alias Undercity.Repo

  alias Undercity.Users.User
  alias Undercity.Auctions.Auction

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_auctions(id) do
    Auction
    |> where([a], a.user_id == ^id)
    |> Repo.all()
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def authenticate_user(username, password) do
    query = from u in User, where: u.username == ^username
    with user when not is_nil(user) <- Repo.one(query),
      true <- Argon2.verify_pass(password, user.password_hash) do
        {:ok, user}
    else
      nil -> Argon2.no_user_verify()
      {:error, :invalid_credentials}

      false -> {:error, :invalid_credentials}
    end
  end
end
