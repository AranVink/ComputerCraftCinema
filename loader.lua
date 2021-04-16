-- Base path for HTTP download
GitHubUrl = "https://raw.githubusercontent.com/AranVink/ComputerCraftCinema/main/"

if not http then
    printError( "loader requires http API" )
    printError( "Set http_enable to true in ComputerCraft.cfg" )
    return
end
 
function GetUrl( sUrl )
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

function getAndSave(sUrl, sPath)
    local res = GetUrl( sUrl )
    if res then
        fs.delete(sPath)
        local file = fs.open( sPath, "wb" )
        file.write( res )
        file.close()

    end
end

-- Do the get
local sUrl = GitHubUrl + "screen.lua"--tArgs[1]
local sFile = "screen.lua" --tArgs[2]
local sPath = shell.resolve( sFile )

print("Loading scripts")
getAndSave(sUrl, sPath)
shell.run("screen")