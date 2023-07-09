defmodule HelloWorldWeb.TestController do
  use HelloWorldWeb, :controller

  def test(conn, _params) do
    render(conn, :test, layout: false, hello: "Hello Sapar!")
  end
end
