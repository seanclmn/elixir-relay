defmodule GraphqlApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GraphqlApiWeb.Telemetry,
      # Start the Ecto repository
      GraphqlApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GraphqlApi.PubSub},
      # Start Finch
      {Finch, name: GraphqlApi.Finch},
      # Start the Endpoint (http/https)
      GraphqlApiWeb.Endpoint
      # Start a worker by calling: GraphqlApi.Worker.start_link(arg)
      # {GraphqlApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GraphqlApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GraphqlApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
