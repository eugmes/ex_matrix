defmodule Matrix.Mixfile do
  use Mix.Project

  def project do
    [app: :matrix,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     souce_url: "https://github.com/eugmes/ex_matrix.git"]
  end

  defp deps do
    []
  end
end
