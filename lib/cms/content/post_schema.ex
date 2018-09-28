defmodule Cms.Content.Post do
  import Ecto.Changeset
  require Slugger

  use Ecto.Schema
  use Arc.Ecto.Schema

  alias Cms.Auth.User
  alias CmsWeb.Uploaders.Cover

  @derive {Phoenix.Param, key: :slug}


  schema "posts" do
    field :body, :string
    field :published, :boolean, default: false
    field :slug, :string, unique: true
    field :title, :string
    field :cover, Cover.Type

    belongs_to :user, User

    timestamps()
  end

  def create_changeset(post, attrs) do
    post
    |> common_changeset(attrs)
    |> validate_required([:user_id, :cover])
  end

  def common_changeset(changeset, attrs) do
    changeset
    |> cast(attrs, [:title, :body, :published, :user_id])
    |> cast_attachments(attrs, [:cover])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 3)
    |> process_slug
  end

  # Private

  defp process_slug(%Ecto.Changeset{valid?: validity, changes: %{title: title}} = changeset) do
    case validity do
      true -> put_change(changeset, :slug, Slugger.slugify_downcase(title))
      false -> changeset
    end
  end

  defp process_slug(changeset), do: changeset

end
