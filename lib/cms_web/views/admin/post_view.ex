defmodule CmsWeb.Admin.PostView do
  use CmsWeb, :view

  def published_status(post) do
    case post.published do
      true -> "Yes"
      false -> "No"
    end
  end

  def format_date(post) do
    {:ok, relative_str} = Timex.format(post.inserted_at, "{relative}", :relative)
    relative_str
  end

end
