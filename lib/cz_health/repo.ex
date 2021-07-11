defmodule CzHealth.Repo do
  use Ecto.Repo,
    otp_app: :cz_health,
    adapter: Ecto.Adapters.Postgres
end
