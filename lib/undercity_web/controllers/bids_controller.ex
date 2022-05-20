defmodule UndercityWeb.BidsController do
  use UndercityWeb, :controller

  alias Undercity.Bids
  alias Undercity.Bids.Bid

  def create(conn, %{"bid" => bid_params = %{"auction_id" => auction_id, "bid_value" => bid_value}}) do
    case Bids.create_bid(bid_params) do
      {:ok, changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:info, "You bid: #{bid_value}")
        |> redirect(to: Routes.auctions_path(conn, :show, auction_id))

      {:error, changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:info, "Prices should be numbers with złoty and grosz count separated by a dot. Buyout price must not be lower than initial price")
        |> redirect(to: Routes.auctions_path(conn, :show, auction_id))
    end
  end
end
