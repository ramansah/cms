# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cms.Repo.insert!(%Cms.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cms.Repo

alias Cms.Auth.User


Repo.insert!(User.create_changeset(%User{}, %{
  name: "Admin",
  email: "admin@app.com",
  password: "admin123",
  is_admin: true
}))

