defmodule Post.Repo do
  use Ecto.Repo,
    otp_app: :post,
    adapter: Ecto.Adapters.Postgres
end
