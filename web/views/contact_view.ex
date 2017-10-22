defmodule PhoenixAndElm.ContactView do
  use PhoenixAndElm.Web, :view

  def render("index.json", %{page: page}) do
    page
  end
  def render("show.json", %{contact: contact}) do
    contact
  end
end

