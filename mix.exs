defmodule Syts.Mixfile do
  use Mix.Project

  def project do
    [
      app: :syts,
      version: "0.1.0",
      elixir: "~> 1.5",
      escript: [main_module: Syts.CLI],
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),

      name: "Syts",
      source_url: "https://github.com/woodruffw/syts",
      homepage_url: "https://github.com/woodruffw/syts",
      docs: [
        main: "Syts",
        extras: ["README.md"],
      ],
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:poison, "~> 3.1"},
    ]
  end

  defp description do
    """
    Syts is a very basic command-line YouTube searcher.

    It takes a query from the user, grabs (up to) 5 YouTube results, and then presents
    them to the user for selection. The selected video is then played in MPV.

    I wrote this to try out Elixir. It's probably not idiomatic or safe to use.
    """
  end

  defp package do
    [
      name: :syts,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["William Woodruff"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/woodruffw/syts"},
    ]
  end
end
