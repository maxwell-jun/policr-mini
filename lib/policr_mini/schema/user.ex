defmodule PolicrMini.Schema.User do
  @moduledoc """
  用户模型。
  """

  use PolicrMini.Schema

  @required_fields ~w(id)a
  @optional_fields ~w(first_name last_name username)a

  @primary_key {:id, :integer, autogenerate: false}
  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string

    timestamps()
  end

  @type t :: map()

  def changeset(%__MODULE__{} = user, attrs) when is_map(attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
