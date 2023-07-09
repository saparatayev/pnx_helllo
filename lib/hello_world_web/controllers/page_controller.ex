defmodule HelloWorldWeb.PageController do
  use HelloWorldWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def hello(conn, _params) do
    redirect(conn, to: ~p"/")
  end
end
