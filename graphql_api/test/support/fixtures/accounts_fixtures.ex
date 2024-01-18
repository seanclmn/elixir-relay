defmodule GraphqlApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GraphqlApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        firstname: "some firstname",
        lastname: "some lastname",
        password: "some password",
        password_hash: "some password_hash",
        role: "some role"
      })
      |> GraphqlApi.Accounts.signup_user()

    user
  end
end
