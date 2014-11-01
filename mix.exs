defmodule BlockTimer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :block_timer,
      version: "0.0.1",
      elixir: "~> 1.0.0",
      deps: deps,
      package: [
        contributors: ["Adam Kittelson"],
        licenses: ["MIT"],
        links: %{ github: "https://github.com/adamkittelson/block_timer" }
      ],
      description: "Macros to use :timer.apply_after and :timer.apply_interval with a block"
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end
end
