do

local USAGE = "!nmap IP"

function run(msg, matches)
  local str = matches[1]
  str = str:gsub('[|<>&%;]','')
  local f = io.popen(string.format("nmap %s", str)) -- store the output in a "file"
  --print( f:read("*a") )    -- print out the "file"'s content

  return f:read("*all")
end

return {
  description = "NAMP Port Scanner",
  usage = USAGE,
  patterns = {
    "^!nmap%s(.*)$"
  },
  run = run
}

end
