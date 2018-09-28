defmodule CmsWeb.Content.PostTest do
  import Cms.Factory.Post

  use ExUnit.Case
  use Cms.DataCase

  alias Cms.Content.Post

  describe "Post Schema" do
    test "valid changeset" do
      %{valid?: valid} = Post.create_changeset(%Post{}, valid_attrs())
      assert valid
    end

    test "invalid changeset" do
      Enum.each(invalid_attrs(), fn attr ->
        %{valid?: valid} = Post.create_changeset(%Post{}, attr)
        assert valid === false
      end)
    end
  end
end
