defmodule Cms.Factory.User do
  def valid_attrs do
    %{
      name: "Raman Sah",
      email: "raman.17.sah@gmail.com",
      password: "password"
    }
  end

  def invalid_attrs do
    [
      %{
        name: "R",
        email: "ramansah@live.com",
        password: "password"
      },
      %{
        name: "Raman Sah",
        email: "rcom",
        password: "password"
      },
      %{
        name: "Raman Sah",
        email: "ramansah@live.com",
        password: "pd"
      }
    ]
  end
end
