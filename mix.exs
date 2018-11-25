defmodule Decapx.MixProject do
  use Mix.Project

  def project do
    [
      app: :decapx,
      version: "0.1.0",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      # mod: {Decapx.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # Phoenix and friends
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},

      {:cachex, "~> 3.0"},
      {:cors_plug, "~> 2.0"},
      {:decimal, "~> 1.4"},
      {:distillery, "~> 2.0", runtime: false},
      {:ex_cldr_numbers, "~> 2.0"},
      {:money, "~> 1.3"},
      {:apex, "~> 1.0", only: [:dev, :test]},
      {:credo, "~> 1.0", only: :dev, runtime: false},
      {:benchee, "~> 0.9", only: :dev},
      {:sobelow, "~> 0.5", only: :dev}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
      #  test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
