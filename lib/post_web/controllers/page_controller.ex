defmodule PostWeb.PageController do
  use PostWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
