defmodule GraphqlApi.AuthToken do
  @salt "any salt"

  def create(user) do
    Phoenix.Token.sign(AppWeb.Endpoint, @salt, user.id)
  end

  def verify(token) do
    Phoenix.Token.verify(MyApp.Endpoint, @salt, token, max_age: 60 * 60 * 24)
  end
end
