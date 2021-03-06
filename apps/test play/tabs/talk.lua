talk.ui:add( ui:new() , "options" )

function talk.draw()
	game.map:draw()
	local h = talk.size*(love.graphics.getFont():getHeight()+3)+5
	love.graphics.setColor( color.black )
	love.graphics.rectangle("fill",10,10,screen.width-20,h)
	love.graphics.setColor( color.white )
	love.graphics.rectangle("line",10,10,screen.width-20,h)
	love.graphics.printf(talk.text,15,15,screen.width-30)
end

function talk.open(player)
	talk.player = player
	talk.choose( player.dialog )
end

function talk.choose(option)
	talk.option = option
	talk.ui.options.child:clear()
	talk.text = talk.player.name..": "..option.text
	talk.size = #( ( {love.graphics.getFont():getWrap(talk.text,screen.width-30)} )[2] )
	local y = talk.size * (love.graphics.getFont():getHeight() + 3) + 20
	for k , v in pairs( talk.option ) do
		if type(v) == "table" then
			talk.ui.options:addChild( button:new({
				width = var:new(function() return screen.width-20 end),
				text = k, y = y, x = 10, func = function(self)
					talk.choose( talk.option[self.text] )
				end
			}) )
			y = y + 25
		end
	end
	if option.func then option.func() end
end

function talk.keypressed(key)
	if key == "escape" then
		love.open(game)
	end
end