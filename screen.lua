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

monitor = peripheral.find("monitor")
initializeMonitor(monitor)

img = paintutils.loadImage("test.nfp")
paintutils.drawImage(img,1,1)

resetMonitor(monitor)