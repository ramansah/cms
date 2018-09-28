defmodule CmsWeb.Admin.PageView do
  use CmsWeb, :view

  def published_status(post) do
    case post.published do
      true -> "Yes"
      false -> "No"
    end
  end

end
