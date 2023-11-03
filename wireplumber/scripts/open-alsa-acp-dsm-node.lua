om = ObjectManager {
  Interest { type = "node",
    Constraint { "media.class", "matches", "Audio/*" }
  },
}

om:connect("object-added", function (om, node)
  -- only check the state of the hw:1,0 playback node
  if node.properties["api.alsa.path"] ~= "hw:1,0" then
    return
  end

  node:connect("state-changed", function (node, old_state, cur_state)
    -- find the hw:1,1 capture node
    local capture_node = om:lookup {
        Constraint { "api.alsa.path", "=", "hw:1,1", type = "pw-global" }
    }
    if capture_node == nil then
      return
    end

    -- open/close the capture device if the playback device is running or not
    if cur_state == "running" then
      capture_node:send_command("ParamBegin")
    else
      capture_node:send_command("ParamEnd")
    end

  end)

end)

om:activate()
