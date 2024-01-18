defmodule GraphqlApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Bcrypt

  schema "users" do
    field :password, :string, virtual: true
    # field :role, :string, default: "user"
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :password_hash, :string
    # field :password_confirmation, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :email, :password])
    |> validate_required([:firstname, :lastname, :email, :password])
    |> hash_password
  end

  defp hash_password(changeset) do
    put_change(changeset, :password_hash, hash_pwd_salt(changeset.changes.password))
  end

end
