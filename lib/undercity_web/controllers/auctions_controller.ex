defmodule UndercityWeb.AuctionsController do
  use UndercityWeb, :controller

  alias Undercity.Auctions
  alias Undercity.Auctions.Auction

  def index(conn, _params) do
    auctions = Auctions.list_auctions()
    render(conn, "index.html", auctions: auctions)
  end

  def new(conn, _params) do
    current_user = conn.assigns.current_user
    changeset = Auction.changeset(%Auction{}, %{})
    render(conn, "new.html", changeset: changeset, current_user: current_user)
  end

  def create(conn, params) do
    Auctions.create_auction(params)
    redirect(conn, to: Routes.auctions_path(conn, :index))
  end
end
