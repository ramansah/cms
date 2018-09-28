defmodule CmsWeb.PageView do
  use CmsWeb, :view

  def format_date(post) do
    {:ok, relative_str} = Timex.format(post.inserted_at, "{relative}", :relative)
    relative_str
  end

  def post_excerpt(post) do
    String.slice(post.body, 0..120) <> " ..."
  end

end
