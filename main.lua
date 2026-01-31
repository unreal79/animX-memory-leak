
class = require("libs/30log-plus/30log-plus")
-- animx = require("libs/animX_old")
animx = require("libs/animX")
require("GameTorch")


torches = {}
deletes = {}


function love.load()
	GameTorch:load()
end


function love.update(dt)
    if not pcall(function () animx.update(dt) end) then
        error("AnimX update error!")
		return
    end

	-- collectgarbage()
end


function love.draw()
	love.graphics.clear()

	for _, _torch in ipairs(torches) do
		_torch:draw(_torch.x, _torch.y)
	end
end


function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		for i = 1, 1000 do  -- Adjust the number to create more or fewer torches
			spawnTorch(x + (i - 1) * 32, y, true)
		end
		print("Spawned torches (total): " .. torches_spawned .. ", currently active: " .. #torches)
	end
	if button == 2 then
		print("Releasing " .. #torches .. " torches")
		print("Memory usage before: " .. collectgarbage("count") .. " KB")

		-- Properly destroy all torches
		for _, _torch in ipairs(torches) do
			if _torch and _torch.destroy then
				_torch:destroy()
			end
		end

		-- Clear the table
		torches = {}

		-- Force garbage collection
		collectgarbage("collect")
		collectgarbage("collect") -- Call twice for full collection

		print("Memory usage after: " .. collectgarbage("count") .. " KB")
	end
end
