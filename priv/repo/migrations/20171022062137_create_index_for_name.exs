defmodule PhoenixAndElm.Repo.Migrations.CreateIndexForName do
  use Ecto.Migration

  def change do
    create index("contacts", [:first_name])
    create index("contacts", [:last_name])
  end
end
