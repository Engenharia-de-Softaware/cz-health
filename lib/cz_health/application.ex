defmodule CzHealth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CzHealth.Repo,
      # Start the Telemetry supervisor
      CzHealthWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CzHealth.PubSub},
      # Start the Endpoint (http/https)
      CzHealthWeb.Endpoint
      # Start a worker by calling: CzHealth.Worker.start_link(arg)
      # {CzHealth.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CzHealth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CzHealthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
