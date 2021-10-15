defmodule Post.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Post.Repo,
      # Start the Telemetry supervisor
      PostWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Post.PubSub},
      # Start the Endpoint (http/https)
      PostWeb.Endpoint
      # Start a worker by calling: Post.Worker.start_link(arg)
      # {Post.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Post.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PostWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
