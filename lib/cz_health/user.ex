defmodule CzHealth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :email, :cpf, :status, :password]
  @derive {Jason.Encoder, only: [:id, :name, :email, :cpf, :status, :password]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    field :status, :string
    field :password, :string

  timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
