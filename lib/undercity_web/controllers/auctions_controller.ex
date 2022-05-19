defmodule UndercityWeb.AuctionsController do
  use UndercityWeb, :controller

  alias Undercity.Auctions
  alias Undercity.Auctions.Auction
  alias Undercity.Bids.Bid

  def index(conn, _params) do
    auctions = Auctions.list_auctions()
    render(conn, "index.html", auctions: auctions)
  end

  def new(conn, _params) do
    current_user = conn.assigns.current_user
    changeset = Auction.changeset(%Auction{}, %{})
    render(conn, "new.html", changeset: changeset, current_user: current_user)
  end

  def create(conn, %{"auction" => auction_params}) do
    case Auctions.create_auction(auction_params) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Auction created!")
        |> redirect(to: Routes.users_path(conn, :show, conn.assigns.current_user.id))

      {:error, changeset} ->
        conn
        |> put_flash(:info, "Prices should be numbers with złoty and grosz count separated by a dot. Buyout price must not be lower than initial price")
        |> redirect(to: Routes.users_path(conn, :show, conn.assigns.current_user.id))
    end
  end

  def show(conn, %{"id" => id}) do
    auction = Auctions.get_auction!(id)
    changeset = Bid.changeset(%Bid{}, %{})
    render(conn, "show.html", auction: auction, changeset: changeset)
  end
end
