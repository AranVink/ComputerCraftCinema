if not http then
    printError( "loader requires http API" )
    printError( "Set http_enable to true in ComputerCraft.cfg" )
    return
end
 
local function get( sUrl )
    write( "Connecting to " .. sUrl .. "... " )

    local ok, err = http.checkURL( sUrl )
    if not ok then
        print( "Failed." )
        if err then
            printError( err )
        end
        return nil
    end

    local response = http.get( sUrl , nil , true )
    if not response then
        print( "Failed." )
        return nil
    end

    print( "Success." )

    local sResponse = response.readAll()
    response.close()
    return sResponse
end
 
-- Determine file to download
local sUrl = "https://raw.githubusercontent.com/AranVink/ComputerCraftCinema/main/screen.lua"--tArgs[1]
local sFile = "screen.lua" --tArgs[2]
local sPath = shell.resolve( sFile )
--if fs.exists( sPath ) then
--    print( "File already exists" )
--    return
--end

-- Do the get
local res = get( sUrl )
print("Loading scripts")
if res then
    fs.delete(sPath)
    local file = fs.open( sPath, "wb" )
    file.write( res )
    file.close()
    print( "Load complete, executing: ")
    shell.run("screen")
end