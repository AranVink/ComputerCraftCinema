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

local filename = "frames/1.nfp"
local sUrl = GitHubUrl + filename
local sFile = filename
local sPath = shell.resolve( sFile )

print("Loading frame 1")
getAndSave(sUrl, sPath)

local filename = "frames/2.nfp"
local sUrl = GitHubUrl + filename
local sFile = filename
local sPath = shell.resolve( sFile )

print("Loading frame 2")
getAndSave(sUrl, sPath)

local monitor = peripheral.find("monitor")
initializeMonitor(monitor)

local img = paintutils.loadImage("frames/1.nfp")
paintutils.drawImage(img,1,1)

img = paintutils.loadImage("frames/2.nfp")
paintutils.drawImage(img,1,1)

--img = paintutils.loadImage("frames/3.nfp")
--paintutils.drawImage(img,1,1)

--img = paintutils.loadImage("frames/4.nfp")
--paintutils.drawImage(img,1,1)


resetMonitor(monitor)