GameTorch = class("GameTorch")

torches_spawned = 0

function GameTorch:init(x, y, loop)
    self.x = x or 0
    self.y = y or 0
    table.insert(torches, self)
    self.torchid = #torches -- number in torches table
    self.delay = math.random(10, 15) / 100
    self.actorTorch = animx.newActor():
        addAnimation("torch",{
            img=imgTorchLight,
            y=0,
            tileHeight=64,
            tileWidth=64,
            nq=16,
            delay=self.delay,
            ---- below is optional
            -- onCycleOver = function()
            --     table.insert(deletes, self)
            --     table.remove(torches, self.torchid)
            --     for _, _torch in ipairs(torches) do
            --         if _torch.torchid > self.torchid then
            --             _torch.torchid = _torch.torchid - 1
            --         end
            --     end
            -- end
        })
    if loop then
        self.actorTorch:loopAll()
        self.actorTorch:getAnimation("torch"):onCycleOver(function() end)
    end
    self.actorTorch:switch("torch")
end


function GameTorch:load()
    -- https://rone3190.itch.io/torch-32x32-animated
	imgTorchLight = love.graphics.newImage("assets/pics/Torch-Animated.png")
end


function spawnTorch(x, y, loop)
    GameTorch(x, y, loop)
    torches_spawned = torches_spawned + 1
end


function GameTorch:update(dt)
end


function GameTorch:draw(...)
    self.actorTorch:draw(...)
end


function GameTorch:destroy()
    -- Destroy the actor and its animations
    if self.actorTorch and self.actorTorch.destroy then
        self.actorTorch:destroy()
    end
    self.actorTorch = nil
    self.x = nil
    self.y = nil
    self.torchid = nil
    self.delay = nil
end

