defmodule PhoenixAndElm.ContactController do
  use PhoenixAndElm.Web, :controller

  alias PhoenixAndElm.Contact

  def index(conn, params) do
    search_string = Map.get(params, "search", "")

    page = Contact
      |> Contact.search(search_string)
      |> order_by(:first_name)
      |> Repo.paginate(params)

    render conn, page: page
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)

    render conn, contact: contact
  end
end
