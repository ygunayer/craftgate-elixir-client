defmodule Craftgate.Model.ReportFileType do
  @moduledoc """
  Elixir equivalent of the Java enum [io.craftgate.model.ReportFileType](https://github.com/craftgate/craftgate-java-client/blob/master/src/main/java/io/craftgate/model/ReportFileType.java)
  """

  use Craftgate.Enum, [
    :XLSX,
    :CSV
  ]
end
