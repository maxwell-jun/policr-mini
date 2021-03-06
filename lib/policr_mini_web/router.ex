defmodule PolicrMiniWeb.Router do
  use PolicrMiniWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PolicrMiniWeb.API do
    pipe_through :api

    get "/home", HomeController, :index
  end

  scope "/", PolicrMiniWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
