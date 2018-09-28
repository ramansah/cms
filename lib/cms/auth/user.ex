defmodule Cms.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :is_admin, :boolean, default: false
    field :email, :string, unique: true
    field :name, :string
    field :password_hash, :string

    field(:password, :string, virtual: true)
    timestamps()
  end

  @create_fields ~w(name password email)a
  @optional_fields ~w(is_admin)a

  def create_changeset(user, attrs) do
    user
    |> cast(attrs, @create_fields ++ @optional_fields)
    |> validate_required(@create_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 3)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
