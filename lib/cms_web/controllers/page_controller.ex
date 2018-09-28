defmodule CmsWeb.PageController do
  use CmsWeb, :controller

  alias Cms.Content.Blog
  alias Cms.Content.Post

  
  def index(conn, _) do
    posts = Blog.get_published_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => slug}) do
    with %Post{} = post <- Blog.get(slug, true) do
      render(conn, "show.html", post: post)
    end
  end

end
