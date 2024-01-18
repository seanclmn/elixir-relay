defmodule GraphqlApiWeb.Schema do
  # use Absinthe.Schema
  # alias GraphqlApiWeb.Schema.Mutations
  # alias GraphqlApiWeb.Schema.Queries

  # mutation do
  #   Mutations.Users
  # end

  use Absinthe.Schema

  alias GraphqlApiWeb.UsersResolver

  object :user do
   field :firstname, non_null(:string)
   field :lastname, non_null(:string)
   field :email, non_null(:string)
   field :id, non_null(:id)
   field :password_hash, non_null(:string)
  end

  query do
    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UsersResolver.get_users/3)
    end
  end

  mutation do
    @desc "Create a user"
    field :signup_user, :user do
      arg :firstname, non_null(:string)
      arg :lastname, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve(&UsersResolver.signup_user/3)
    end
  end

  # mutation do
  #   @desc "Sign up"
  #   field :signup_user, :user do
  #     arg(:email, :string)
  #     arg(:password, :string)

  #     resolve(&Resolvers.User.signup/2)
  #   end
  # end

end
