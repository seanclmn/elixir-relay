defmodule GraphqlApiWeb.UsersResolver do
  alias GraphqlApi.Accounts

  def get_users(_root, _args, _info) do
    {:ok, Accounts.list_users()}
  end

  def signup_user(_root,args,_info) do
    case Accounts.signup_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create user"}
    end
  end
end
