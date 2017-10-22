defmodule PhoenixAndElm.LayoutView do
  use PhoenixAndElm.Web, :view

  def socket_url do
    # TODO 这里的host和port应该可以从phoenix里读出来, 当前绑定的地址和端口
    System.get_env("WEBSOCKECT_URL") || "ws://localhost:4000/socket/websocket"
  end
end

