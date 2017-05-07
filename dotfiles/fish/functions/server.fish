function server -d 'Start a HTTP server in the current dir, optionally specifying the port'
    if test $argv[1]
        set port $argv[1]
    else
        set port 8000
    end

    open "http://localhost:$port/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c "import SimpleHTTPServer;
map = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;
map[\"\"] = \"text/plain\";
for key, value in map.items():
    map[key] = value + \";charset=UTF-8\";
SimpleHTTPServer.test()" $port
end
