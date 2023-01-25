local function get_arguments()
	local co = coroutine.running()
	if co then
		return coroutine.create(function()
			local args = {}
			vim.ui.input({ prompt = "Args: " }, function(input)
				args = vim.split(input or "", " ")
			end)
			coroutine.resume(co, args)
		end)
	else
		local args = {}
		vim.ui.input({ prompt = "Args: " }, function(input)
			args = vim.split(input or "", " ")
		end)
		return args
	end
end

return function(type_name, program)
	return {
		{
			type = type_name,
			name = "Debug",
			request = "launch",
			program = program,
		},
		{
			type = type_name,
			name = "Debug (Arguments)",
			request = "launch",
			program = program,
			args = get_arguments,
		},
		{
			type = type_name,
			name = "Attach",
			request = "attach",
			processId = require("dap.utils").pick_process,
		},
	}
end
