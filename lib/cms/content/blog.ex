defmodule Cms.Content.Blog do

  alias Cms.Content.Post
  alias Cms.Auth.User
  alias Cms.Repo

  import Ecto.Query


  def get_posts_list() do
    Repo.all(from p in Post,
    preload: :user)
  end

  def get_published_posts() do
    Repo.all(from p in Post,
    where: p.published == true,
    preload: :user)
  end

  def get(slug) do
    Repo.get_by(Post, slug: slug)
  end

  def get(slug, true) do
    Repo.get_by(Post, slug: slug)
    |> Repo.preload([:user])
  end

  def create(post, user) do
    post = post
    |> Map.put("user_id", user.id)
    changeset = Post.create_changeset(%Post{}, post)
    case changeset.valid? do
      true -> Repo.insert(changeset)
      false -> {:error, changeset}
    end
  end

  def update(post, params) do
    changeset = Post.common_changeset(post, params)
    case changeset.valid? do
      true -> Repo.update(changeset)
      false -> {:error, changeset}
    end
  end

  def publish(post) do
    Post.common_changeset(post, %{published: not post.published})
    |> Repo.update()
  end

end
