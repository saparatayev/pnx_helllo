defmodule HelloWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HelloWorldWeb.Telemetry,
      # Start the Ecto repository
      HelloWorld.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloWorld.PubSub},
      # Start Finch
      {Finch, name: HelloWorld.Finch},
      # Start the Endpoint (http/https)
      HelloWorldWeb.Endpoint
      # Start a worker by calling: HelloWorld.Worker.start_link(arg)
      # {HelloWorld.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloWorldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end