defmodule UndercityWeb.Router do
  use UndercityWeb, :router

  pipeline :auth do
    plug Undercity.Users.Pipeline
    plug Undercity.Users.Auth
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {UndercityWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UndercityWeb do
    pipe_through [:browser, :auth]

    scope "" do
      pipe_through [:ensure_auth]
      get "/", PageController, :index
      get "/auctions", AuctionsController, :index
      get "/auctions/new", AuctionsController, :new
      post "/auctions/new", AuctionsController, :create
      get "/users/:id", UsersController, :show
      get "/favourites", FavouriteController, :index
      get "/watchlist", WatchlistController, :index
    end

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    delete "/logout/:id", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", UndercityWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: UndercityWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
