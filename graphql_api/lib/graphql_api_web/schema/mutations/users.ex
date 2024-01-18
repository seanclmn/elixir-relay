defmodule GraphqlApiWeb.Schema.Mutations.Users do
  use Absinthe.Schema

  # alias GraphqlApiWeb.UsersResolver

  object :user do
   field :firstname, non_null(:string)
   field :lastname, non_null(:string)
   field :email, non_null(:string)
  end

  query do
    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user)))
  end
end
