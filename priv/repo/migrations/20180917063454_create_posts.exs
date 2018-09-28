defmodule Cms.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :slug, :string, unique: true
      add :title, :string
      add :body, :text
      add :user_id, references(:users, on_delete: :delete_all)
      add :published, :boolean, default: false, null: false
      add :cover, :string

      timestamps()
    end

  end
end
