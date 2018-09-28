defmodule Cms.Plug.Authentication do

  use Guardian.Plug.Pipeline,
    otp_app: :cms,
    error_handler: Cms.GuardianErrorHandler,
    module: Cms.Auth.Guardian

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true

end