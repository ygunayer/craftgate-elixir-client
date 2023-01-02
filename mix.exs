defmodule Craftgate.MixProject do
  use Mix.Project

  @version "1.0.40-beta"

  def project do
    [
      app: :craftgate,
      name: "Craftgate",
      description: "Elixir client for Craftgate API",
      source_url: "https://github.com/ygunayer/craftgate-elixir",
      homepage_url: "https://github.com/ygunayer/craftgate-elixir",
      version: @version,
      elixir: "~> 1.12",
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: [
        main: "readme",
        logo: "logo.png",
        extras: ["README.md", "CONTRIBUTING.md"]
      ],
      package: [
        maintainer: ["Yalin Gunayer"],
        licenses: ["MIT"],
        links: %{
          Changelog: "https://github.com/ygunayer/craftgate-elixir/CHANGELOG.md",
          GitHub: "https://github.com/ygunayer/craftgate-elixir"
        }
      ],
      test_coverage: [
        tool: ExCoveralls
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application, do: []

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8.0"},
      {:construct, "~> 3.0"},
      {:jason, "~> 1.4.0"},
      {:recase, "~> 0.7.0"},
      {:decimal, "~> 2.1"},
      {:ex_doc, "~> 0.29.1", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:mox, "~> 1.0.2", only: [:test]},
      {:excoveralls, "~> 0.16.1", only: [:test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/craftgate_test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
