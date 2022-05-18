defmodule UndercityWeb.SessionController do
  use UndercityWeb, :controller

  alias Undercity.Users
  alias Undercity.Users.User
  alias Undercity.Users.Guardian

  def new(conn, _) do
    changeset = Users.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    if maybe_user do
      redirect(conn, to: "/protected") #could it redirect to login page ?
    else
      render(conn, "new.html", changeset: changeset, current_user: maybe_user, action: Routes.session_path(conn, :login))
    end
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    Users.authenticate_user(username, password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:info, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
    # |> assign(:current_user, user)
    |> redirect(to: "/")
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |> put_flash(:error, to_string(reason))
    |> new(%{})
  end
end
