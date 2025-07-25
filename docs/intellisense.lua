----------------------------------------
--- // Info
----------------------------------------

--[[
    This file contains every lua function, callback, and type for Stormworks microcontroller Lua.
    Simply put this file in your code workspace and you should have intellisense support (auto-completion, typehints, etc) for microcontroller lua.

    This extension is required: https://marketplace.visualstudio.com/items?itemName=sumneko.lua

    Created by: @Cuh4 (GitHub)

    Repo: https://github.com/Cuh4/StormworksMCLuaDocumentation
]]

----------------------------------------
--- // Changelog
----------------------------------------

--[[
    Last updated for game version: v1.15.1
        Note that even if the above version is outdated on the latest version of this repo, it means no 
        functions were added, changed or removed from the game since the update.
        
        Corrections and changes to the documentation may still be made after the game version is outdated
        anyway.

    Changelog available at the GitHub repo @ https://github.com/Cuh4/StormworksMCLuaDocumentation
]]

----------------------------------------
--- // Meta
----------------------------------------

---@meta _

----------------------------------------
--- // Input/Output
----------------------------------------

--[[
    A table of functions for reading the composite fed into the lua script.<br>
    If the composite comes from a monitor, the composite will contain:<br>
    - **Number**<br>
        - `1`: Monitor Resolution X<br>
        - `2`: Monitor Resolution Y<br>
        - `3`: Input 1 X (where did the user press Q [default bind] on the monitor)<br>
        - `4`: Input 1 Y (where did the user press Q [default bind] on the monitor)<br>
        - `5`: Input 2 X (where did the user press E [default bind] on the monitor)<br>
        - `6`: Input 2 Y (where did the user press E [default bind] on the monitor)<br>
    - **On/Off (boolean)**<br>
        - `1`: Is Input 1 Pressed (did the user press Q [default bind] on the monitor)<br>
        - `2`: Is Input 2 Pressed (did the user press E [default bind] on the monitor)<br>
]]
input = {}

--[[
    Reads a boolean value from the composite input.
    Index ranges from 1 to 32.
]]
---@param index integer The input channel index (1-32)
---@return boolean value The boolean value at the given index
function input.getBool(index) end

--[[
    Reads a number value from the composite input.
    Index ranges from 1 to 32.
]]
---@param index integer The input channel index (1-32)
---@return number value The number value at the given index
function input.getNumber(index) end

--[[
    A table of functions for writing to the composite output from the lua script.
]]
output = {}

--[[
    Sets a boolean value on the composite output.
    Index ranges from 1 to 32.
]]
---@param index integer The output channel index (1-32)
---@param value boolean The boolean value to set
function output.setBool(index, value) end

--[[
    Sets a number value on the composite output.
    Index ranges from 1 to 32.
]]
---@param index integer The output channel index (1-32)
---@param value number The number value to set
function output.setNumber(index, value) end

--------------------------------------------------------------------------------
-- Properties
--------------------------------------------------------------------------------

--[[
    A table of functions for reading properties set in the microcontroller editor.<br>
    Consider using properties if you want your Lua script to be easily configurable by users.
]]
property = {}

--[[
    Reads a number property value by label.
]]
---@param label string The property label (case-sensitive)
---@return number value The number value of the property
function property.getNumber(label) end

--[[
    Reads a boolean property value by label.
]]
---@param label string The property label (case-sensitive)
---@return boolean value The boolean value of the property
function property.getBool(label) end

--[[
    Reads a text property value by label.
]]
---@param label string The property label (case-sensitive)
---@return string value The text value of the property
function property.getText(label) end

--------------------------------------------------------------------------------
-- Drawing
--------------------------------------------------------------------------------

--[[
    A table of functions for drawing to the screen.<br>
    The result is output via the video node on the lua script itself in the microcontroller editor.<br>
    Connect the video node to a microcontroller video output node and then to a monitor to see the result.
]]
screen = {}

--[[
    Sets the current draw color.
    Values range from 0 to 255.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil An optional alpha componetn (default: 255)
function screen.setColor(r, g, b, a) end

--[[
    Clears the screen using the current draw color.
]]
function screen.drawClear() end

--[[
    Draws a line between two points.
]]
---@param x1 number X coordinate of first point
---@param y1 number Y coordinate of first point
---@param x2 number X coordinate of second point
---@param y2 number Y coordinate of second point
function screen.drawLine(x1, y1, x2, y2) end

--[[
    Draws a circle at (x, y) with the specified radius.
]]
---@param x number X coordinate of circle center
---@param y number Y coordinate of circle center
---@param radius number Radius of the circle
function screen.drawCircle(x, y, radius) end

--[[
    Draws a filled circle at (x, y) with the specified radius.
]]
---@param x number X coordinate of circle center
---@param y number Y coordinate of circle center
---@param radius number Radius of the circle
function screen.drawCircleF(x, y, radius) end

--[[
    Draws a rectangle at (x, y) with the given width and height.
]]
---@param x number X coordinate
---@param y number Y coordinate
---@param width number Rectangle width
---@param height number Rectangle height
function screen.drawRect(x, y, width, height) end

--[[
    Draws a filled rectangle at (x, y) with the given width and height.
]]
---@param x number X coordinate
---@param y number Y coordinate
---@param width number Rectangle width
---@param height number Rectangle height
function screen.drawRectF(x, y, width, height) end

--[[
    Draws a triangle between three points.
]]
---@param x1 number X coordinate of first point
---@param y1 number Y coordinate of first point
---@param x2 number X coordinate of second point
---@param y2 number Y coordinate of second point
---@param x3 number X coordinate of third point
---@param y3 number Y coordinate of third point
function screen.drawTriangle(x1, y1, x2, y2, x3, y3) end

--[[
    Draws a filled triangle between three points.
]]
---@param x1 number X coordinate of first point
---@param y1 number Y coordinate of first point
---@param x2 number X coordinate of second point
---@param y2 number Y coordinate of second point
---@param x3 number X coordinate of third point
---@param y3 number Y coordinate of third point
function screen.drawTriangleF(x1, y1, x2, y2, x3, y3) end

--[[
    Draws text at the given coordinates.
    Each character is 4x5 pixels.
]]
---@param x number X coordinate
---@param y number Y coordinate
---@param text string The text to draw
function screen.drawText(x, y, text) end

--[[
    Draws text inside a box with optional alignment.
    Alignment ranges from -1 (left/top) to 1 (right/bottom).
]]
---@param x number X coordinate of the box
---@param y number Y coordinate of the box
---@param w number Box width
---@param h number Box height
---@param text string The text to draw
---@param h_align integer Horizontal alignment (-1 to 1)
---@param v_align integer Vertical alignment (-1 to 1)
function screen.drawTextBox(x, y, w, h, text, h_align, v_align) end

--[[
    Draws the world map centered at (x, y) with zoom level (0.1 - 50).
]]
---@param x number X coordinate
---@param y number Y coordinate
---@param zoom number Zoom level
function screen.drawMap(x, y, zoom) end

--[[
    Sets the ocean color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorOcean(r, g, b, a) end

--[[
    Sets the shallow water color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorShallows(r, g, b, a) end

--[[
    Sets the land color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorLand(r, g, b, a) end

--[[
    Sets the grass color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorGrass(r, g, b, a) end

--[[
    Sets the sand color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorSand(r, g, b, a) end

--[[
    Sets the snow color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorSnow(r, g, b, a) end

--[[
    Sets the rock color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorRock(r, g, b, a) end

--[[
    Sets the gravel color on the map.
]]
---@param r integer Red component
---@param g integer Green component
---@param b integer Blue component
---@param a integer|nil Alpha component (optional, defaults to 255)
function screen.setMapColorGravel(r, g, b, a) end


--[[
    Returns the current screen width.
]]
---@return number width The width of the screen
function screen.getWidth() end

--[[
    Returns the current screen height.
]]
---@return number height The height of the screen
function screen.getHeight() end

--------------------------------------------------------------------------------
-- Map
--------------------------------------------------------------------------------

--[[
    A table of functions for map-related utilities.
]]
map = {}

--[[
    Converts screen pixel coordinates into world coordinates.
]]
---@param mapX number Map center X
---@param mapY number Map center Y
---@param zoom number Zoom level
---@param screenW number Screen width
---@param screenH number Screen height
---@param pixelX number Pixel X coordinate
---@param pixelY number Pixel Y coordinate
---@return number worldX The world X coordinate
---@return number worldY The world Y coordinate
function map.screenToMap(mapX, mapY, zoom, screenW, screenH, pixelX, pixelY) end

--[[
    Converts world coordinates into screen pixel coordinates.
]]
---@param mapX number Map center X
---@param mapY number Map center Y
---@param zoom number Zoom level
---@param screenW number Screen width
---@param screenH number Screen height
---@param worldX number World X coordinate
---@param worldY number World Y coordinate
---@return number pixelX The screen X coordinate
---@return number pixelY The screen Y coordinate
function map.mapToScreen(mapX, mapY, zoom, screenW, screenH, worldX, worldY) end

--------------------------------------------------------------------------------
-- Callbacks
--------------------------------------------------------------------------------

--[[
    Called every tick.<br>
    Place your microcontroller logic here. Use `onDraw()` for drawing to the screen.
]]
function onTick() end

--[[
    Called every frame.<br>
    Place your screen drawing logic here. Use `onTick()` for logic.
]]
function onDraw() end