defmodule Craftgate.Adapter.PayByLinkAdapter do
  @moduledoc """
  Provides capabilities to manage and list products available for the pay-by-link feature
  """

  alias Craftgate.Request.CreateProductRequest
  alias Craftgate.Request.SearchProductsRequest
  alias Craftgate.Request.UpdateProductRequest
  alias Craftgate.Response.ProductListResponse
  alias Craftgate.Response.ProductResponse

  use Craftgate.Adapter

  endpoint create_product(body: CreateProductRequest.t()), post: "/craftlink/v1/products", return: ProductResponse.t()

  endpoint update_product(id: integer(), body: UpdateProductRequest.t()), put: "/craftlink/v1/products/:id", return: ProductResponse.t()

  endpoint retrieve_product(id: integer()), get: "/craftlink/v1/products/:id", return: ProductResponse.t()

  endpoint delete_product(id: integer()), delete: "/craftlink/v1/products/:id"

  endpoint search_products(params: SearchProductsRequest.t()), get: "/craftlink/v1/products", return: ProductListResponse.t()
end
