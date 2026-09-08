-- 3-finger horizontal swipe switches workspaces
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- kitty transparency
hl.window_rule({
	name = "kitty-no-blur",
	match = {
		class = "^(kitty)$",
	},
	no_blur = true,
})

-- function for comm ws
local function comm_ws()
	local windows = hl.get_windows({ class = "discord" })

	if #windows > 0 then
		-- Discord window exists → toggle special workspace
		hl.dispatch(hl.dsp.workspace.toggle_special("comm"))
	else
		-- Discord doesn't exist → launch it
		hl.exec_cmd("discord")
	end
end

-- Discord → special workspace
hl.window_rule({
	match = { class = "^(discord)$" },
	workspace = "special:comm",
})

hl.bind("SUPER + D", comm_ws)
