defmodule ChatApp.Repo do
  use Ecto.Repo,
    otp_app: :chatApp,
    adapter: Ecto.Adapters.Postgres
end
