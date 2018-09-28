defmodule Cms.Plug.EnsureAuthentication do

  use Guardian.Plug.Pipeline,
    otp_app: :cms,
    module: Cms.Auth.Guardian

  plug Guardian.Plug.EnsureAuthenticated

end