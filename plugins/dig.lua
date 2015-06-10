do

local USAGE = "!dig hostname"

function run(msg, matches)
  local str = matches[1]
  str = str:gsub('[|<>&%;]','')
  local f = io.popen(string.format("dig %s", str)) -- store the output in a "file"
  --print( f:read("*a") )    -- print out the "file"'s content

  return f:read("*all")
end

return {
  description = "DIG Hostname resolver",
  usage = USAGE,
  patterns = {
    "^!dig%s(.*)$"
  },
  run = run
}

end
