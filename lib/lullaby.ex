defmodule Lullaby do
  @moduledoc """
  Documentation for `Lullaby`.
  """
  use Crawly.Spider

  alias Crawly.Utils

  @impl Crawly.Spider
  def base_url(), do: @base_url

  @base_url "https://www.google.com"

  @from_currency "dollar"

  @to_currency "real"

  @impl Crawly.Spider
  def init(), do: [start_urls: ["https://www.google.com/search?client=opera&q=#{@from_currency}+para+#{@to_currency}&sourceid=opera&ie=UTF-8&oe=UTF-8"]]

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} = Floki.parse_document(response.body)
    result =
      document
      |> Floki.find("input")
      |> IO.inspect
      |> Floki.find("input.a61j6")
      |> IO.inspect
      |> Floki.attribute("value")
      |> Enum.take(1)


    IO.puts "1 #{ @from_currency } is worth #{ result } #{ @to_currency }"

    %{
      result: result
    }
  end
end
