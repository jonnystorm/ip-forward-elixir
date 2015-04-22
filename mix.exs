defmodule IPForward.Mixfile do
  use Mix.Project

  def project do
    [app: :ip_forward_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:snmp_mib_ex, git: "https://github.com/jonnystorm/snmp-mib-elixir"}]
  end
end
