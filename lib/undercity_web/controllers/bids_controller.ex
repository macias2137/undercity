defmodule UndercityWeb.BidsController do
  use UndercityWeb, :controller

  alias Undercity.Bids
  alias Undercity.Bids.Bid

  def create(conn, %{"bid" => bid_params}) do
    case Bids.create_bid(bid_params) do
      {:ok, changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:info, "Your bid: ")
        |> redirect(to: Routes.auctions_path(conn, :show, 3))

      {:error, changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:info, "Prices should be numbers with złoty and grosz count separated by a dot. Buyout price must not be lower than initial price")
        |> redirect(to: Routes.auctions_path(conn, :show, 3))
    end
  end
end
