defmodule CmsWeb.PageControllerTest do
  use CmsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Login"
  end
end
