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

  def create(conn, %{"auction" => auction_params}) do
    case Auctions.create_auction(auction_params) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Auction created!")
        |> redirect(to: Routes.auctions_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:info, "Prices should be numbers with złoty and grosz count separated by a dot. Buyout price must not be lower than initial price")
        |> redirect(to: Routes.auctions_path(conn, :index))
    end
  end
end
