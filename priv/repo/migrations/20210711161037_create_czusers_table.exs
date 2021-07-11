defmodule CzHealth.Repo.Migrations.CreateCzusersTable do
  use Ecto.Migration

  def change do
    create table :users do
      field :name, :string
      field :email, :string
      field :cpf, :string
      field :status, :string
      field :password, :string

      timestamps()
    end
  end
end
