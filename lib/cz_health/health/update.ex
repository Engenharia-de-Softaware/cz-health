defmodule CzHealth.Health.Update do
  alias CzHealth.{Error, Repo, User}

  def call(%{"cpf" => cpf} = params) do
    case Repo.get(User, cpf) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
