defmodule UndercityWeb.PageController do
  use UndercityWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
