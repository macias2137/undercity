defmodule Undercity.Users.Pipeline do
  use Guardian.Plug.Pipeline,
  otp_app: :vox,
  error_handler: Undercity.Users.ErrorHandler,
  module: Undercity.Users.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
