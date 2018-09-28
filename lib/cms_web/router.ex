defmodule CmsWeb.Router do
  use CmsWeb, :router

  alias Cms.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plug.Authentication
  end

  pipeline :authenticated do
    plug Plug.EnsureAuthentication
    plug Plug.ShowSidebar
  end

  scope "/admin", CmsWeb, as: :admin do
    pipe_through [:browser, :authenticated]
    get "/", Admin.HomeController, :index
    resources("/post", Admin.PostController) do
      get "/publish", Admin.PostController, :publish, as: :publish
    end
  end

  scope "/", CmsWeb do
    pipe_through :browser
    resources("/", PageController, only: [:index, :show])
    resources("/session", SessionController, only: [:create, :new, :delete])
  end

end
