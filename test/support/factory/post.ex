defmodule Cms.Factory.Post do
  def valid_attrs do
    %{
      title: "The Best Post",
      body: "Content of the best post",
      user_id: 1,
      type: 1
    }
  end

  def invalid_attrs do
    []
  end
end
