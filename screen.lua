require("loader")
local function initializeMonitor( monitor )
    term.redirect(monitor)
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1,1)
    monitor.setTextScale(0.5)
end

local function resetMonitor( monitor )
--    term.setBackgroundColor(colors.black)
--    term.clear()
--    term.setCurrentPos(1,1)
    term.redirect(term.native())
end

local numberOfFrames = 3

local function loadFrames()
    for f = 0,numberOfFrames,1
    do
        local filename = "frames/" .. f .. ".nfp"
        local sUrl = GitHubUrl .. filename
        local sFile = filename
        local sPath = shell.resolve( sFile )

        print("Loading frame " .. f .. " " .. os.time())
        getAndSave(sUrl, sPath)
    end
end

local function drawFrames()
    for f = 0,numberOfFrames,1
    do
        local img = paintutils.loadImage("frames/".. f .. ".nfp")
        paintutils.drawImage(img,1,1)
        os.sleep(1)
    end
end


loadFrames()
local monitor = peripheral.find("monitor")
initializeMonitor(monitor)

for l = 0,100,1
do
    drawFrames()
end


resetMonitor(monitor)