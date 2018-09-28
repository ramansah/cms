defmodule CmsWeb.Admin.PostController do
  use CmsWeb, :controller

  alias Cms.Content.Post
  alias Cms.Content.Blog
  alias Cms.Auth.Accounts


  def index(conn, _) do
    posts = Blog.get_posts_list()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _) do
    changeset = Post.create_changeset(%Post{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => params}) do
    user = Accounts.get_current_user(conn)
    with {:ok, _post} <- Blog.create(params, user) do
      redirect(conn, to: admin_post_path(conn, :index))
    else
      {:error, changeset} ->
        render(conn, "new.html", changeset: %{changeset | action: :new})
    end
  end

  def edit(conn, %{"id" => id} = params) do
    with %Post{} = post <- Blog.get(id) do
      changeset = Post.create_changeset(post, params)
      render(conn, "edit.html", changeset: changeset, id: id)
    end
  end

  def update(conn, %{"id" => id, "post" => params}) do
    with %Post{} = post <- Blog.get(id),
         {:ok, _post} <- Blog.update(post, params) do
      redirect(conn, to: admin_post_path(conn, :index))
    end
  end

  def publish(conn, %{"post_id" => id}) do
    with %Post{} = post <- Blog.get(id),
         {:ok, _post} <- Blog.publish(post) do
           redirect(conn, to: admin_post_path(conn, :index))
    end
  end

end
