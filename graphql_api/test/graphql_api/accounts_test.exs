defmodule GraphqlApi.AccountsTest do
  use GraphqlApi.DataCase

  alias GraphqlApi.Accounts

  describe "users" do
    alias GraphqlApi.Accounts.User

    import GraphqlApi.AccountsFixtures

    @invalid_attrs %{password: nil, role: nil, firstname: nil, lastname: nil, email: nil, password_hash: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "signup_user/1 with valid data creates a user" do
      valid_attrs = %{password: "some password", role: "some role", firstname: "some firstname", lastname: "some lastname", email: "some email", password_hash: "some password_hash"}

      assert {:ok, %User{} = user} = Accounts.signup_user(valid_attrs)
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "signup_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.signup_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{password: "some updated password", role: "some updated role", firstname: "some updated firstname", lastname: "some updated lastname", email: "some updated email", password_hash: "some updated password_hash"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
