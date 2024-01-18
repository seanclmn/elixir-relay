defmodule GraphqlApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end
    # create(unique_index(:users, [:email]))
  end
end
