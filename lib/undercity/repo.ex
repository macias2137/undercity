defmodule Undercity.Repo do
  use Ecto.Repo,
    otp_app: :undercity,
    adapter: Ecto.Adapters.Postgres
end
