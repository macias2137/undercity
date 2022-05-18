defmodule UndercityWeb.AuctionsController do
  use UndercityWeb, :controller

  alias Undercity.Auctions

  def index(conn, _params) do
    auctions = Auctions.list_auctions()
    IO.inspect(conn)
    render(conn, "index.html", auctions: auctions)
  end
end
