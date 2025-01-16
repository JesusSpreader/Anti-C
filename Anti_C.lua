PLUGIN.name = "Disable C Context Menu"
PLUGIN.author = "JesusSpreader"
PLUGIN.description = "Disables the normal Gmod context menu from appearing when pressing the C key, except for superadmins."

if (CLIENT) then
    -- Hook to block the default context menu when the C key is pressed
    hook.Add("ContextMenuOpen", "DisableCContextMenu", function()
        if LocalPlayer():IsSuperAdmin() then
            return  -- Allow superadmins to open the context menu
        end
        return true  -- Block the context menu for other players
    end)

    -- Optionally, prevent the default behavior of the context menu on right-click
    hook.Add("OnContextMenuOpen", "PreventContextMenu", function()
        if LocalPlayer():IsSuperAdmin() then
            return  -- Allow superadmins to use the context menu
        end
        return false  -- Block the context menu for other players
    end)
end