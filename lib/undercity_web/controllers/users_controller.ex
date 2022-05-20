defmodule UndercityWeb.UsersController do
  use UndercityWeb, :controller

  alias Undercity.Bids
  alias Undercity.Users

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    auctions = Users.get_user_auctions(id)
    highest_bids = Bids.get_highest_bids_in_user_auctions(id)
    render(conn, "show.html", user: user, auctions: auctions, highest_bids: highest_bids)
  end
end
