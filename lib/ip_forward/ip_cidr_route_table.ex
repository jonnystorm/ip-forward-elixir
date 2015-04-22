# Copyright © 2015 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule IPForward.IPCIDRRouteTable do
  @oid_ipCidrRouteTable "1.3.6.1.2.1.4.24.4"

  defmodule IPCIDRRouteEntry do
    alias IPForward.IPCIDRRouteTable, as: IPCIDRRouteTable
    alias IPCIDRRouteTable.IPCIDRRouteEntry, as: IPCIDRRouteEntry

    @oid_ipCidrRouteEntry               "1.3.6.1.2.1.4.24.4.1"

    @oid_ipCidrRouteDest                {"#{@oid_ipCidrRouteEntry}.1", :string}
    @oid_ipCidrRouteMask                {"#{@oid_ipCidrRouteEntry}.2", :string}
    @oid_ipCidrRouteNextHop             {"#{@oid_ipCidrRouteEntry}.4", :string}

    defstruct [
      ipCidrRouteDest: nil,
      ipCidrRouteMask: nil,
      ipCidrRouteNextHop: nil
    ]
    @type t :: %IPCIDRRouteEntry{
      ipCidrRouteDest: String.t,
      ipCidrRouteMask: String.t,
      ipCidrRouteNextHop: String.t
    }

    def ipCidrRouteDest do
      ipCidrRouteDest(%IPCIDRRouteEntry{})
    end
    def ipCidrRouteDest(ipCidrRouteEntry) do
      {oid, type} = @oid_ipCidrRouteDest

      SNMPMIB.object(oid, type, ipCidrRouteEntry.ipCidrRouteDest)
    end
    def ipCidrRouteDest(ipCidrRouteEntry, value) when is_binary(value) do
      %IPCIDRRouteEntry{ipCidrRouteEntry|ipCidrRouteDest: value}
    end

    def ipCidrRouteMask do
      ipCidrRouteMask(%IPCIDRRouteEntry{})
    end
    def ipCidrRouteMask(ipCidrRouteEntry) do
      {oid, type} = @oid_ipCidrRouteMask

      SNMPMIB.object(oid, type, ipCidrRouteEntry.ipCidrRouteMask)
    end
    def ipCidrRouteMask(ipCidrRouteMask, value) when is_binary(value) do
      %IPCIDRRouteEntry{ipCidrRouteEntry|ipCidrRouteMask: value}
    end

    def ipCidrRouteNextHop do
      ipCidrRouteNextHop(%IPCIDRRouteEntry{})
    end
    def ipCidrRouteNextHop(ipCidrRouteEntry) do
      {oid, type} = @oid_ipCidrRouteNextHop

      SNMPMIB.object(oid, type, ipCidrRouteEntry.ipCidrRouteNextHop)
    end
    def ipCidrRouteNextHop(ipCidrRouteNextHop, value) when is_binary(value) do
      %IPCIDRRouteEntry{ipCidrRouteEntry|ipCidrRouteNextHop: value}
    end
  end

  @spec ip_cidr_route_entry(String.t, String.t, String.t) :: IPCIDRRouteEntry.t
  def ip_cidr_route_entry(destination, net_mask, next_hop) do
    %IPCIDRRouteEntry{}
      |> IPCIDRRouteEntry.ipCidrRouteDest(destination)
      |> IPCIDRRouteEntry.ipCidrRouteMask(net_mask)
      |> IPCIDRRouteEntry.ipCidrRouteNextHop(next_hop)
  end
end

