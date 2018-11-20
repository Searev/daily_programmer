defmodule DailyProgrammer.MixProject do
  use Mix.Project

  def project do
    [
      app: :daily_programmer,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Daily Programmer",
      source_url: "https://github.com/Searev/daily_programmer",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.18.0", only: :dev}
    ]
  end
end
