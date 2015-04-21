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

    defstruct [
    ]
    @type t :: %{
    }
  end

  def ip_cidr_route_entry do
    %IPCIDRRouteEntry{}
  end
end

