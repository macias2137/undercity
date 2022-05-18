defmodule UndercityWeb.UsersController do
  use UndercityWeb, :controller

  alias Undercity.Users

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    auctions = Users.get_user_auctions(id)
    render(conn, "show.html", user: user, auctions: auctions)
  end
end
