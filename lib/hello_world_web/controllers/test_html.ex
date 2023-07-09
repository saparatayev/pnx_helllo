defmodule HelloWorldWeb.TestHTML do
  use HelloWorldWeb, :html

  def display() do
    "Display TEST"
  end

  def my_component(assigns) do
    ~H"""
    <h2>Hello World, from <%= @messenger %>!</h2>
    """
  end

  embed_templates "test_html/*"
end
