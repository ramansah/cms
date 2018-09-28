defmodule Cms.Plug.ShowSidebar do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _) do
    conn
      |> assign(:sidebar, true)
  end

end