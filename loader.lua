-- This script can be run using wget run, to download all the necesarry files to the computer in computercraft.
-- There is some code duplication here with cinemahttp, because we cannot use require at this point (since nothing is downloaded yet)

-- Base path for HTTP download
GitHubUrl = "https://raw.githubusercontent.com/AranVink/ComputerCraftCinema/main/"

if not http then
    printError( "loader requires http API" )
    printError( "Set http_enable to true in ComputerCraft.cfg" )
    return
end
 
function GetUrl( sUrl )
    --write( "Connecting to " .. sUrl .. "... " )

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

    -- print( "Success." )

    local sResponse = response.readAll()
    response.close()
    return sResponse
end

function GetAndSave(sUrl, sPath)
    local res = GetUrl( sUrl )
    if res then
        fs.delete(sPath)
        local file = fs.open( sPath, "wb" )
        file.write( res )
        file.close()

    end
end

print("Loading scripts")

local files = {
    "screen.lua",
    "cinemahttp.lua"
}

for file in list_iter(files) do
    print("Downloading file " .. file)
    local filename = file
    local sUrl = GitHubUrl .. filename
    local sFile = filename
    local sPath = shell.resolve( sFile )
    getAndSave(sUrl, sPath)
end

print("Done loading scripts")