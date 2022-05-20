defmodule UndercityWeb.UsersController do
  use UndercityWeb, :controller

  alias Undercity.Bids
  alias Undercity.Users

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    auctions = Users.get_user_auctions(id)
    highest_bid = Bids.get_highest_bid_by_auction_id(id)
    render(conn, "show.html", user: user, auctions: auctions, highest_bid: highest_bid)
  end
end
