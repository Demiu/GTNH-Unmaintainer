local shell = require('shell')
local args = {...}
local branch
local repo
local scripts = {
    'test.lua'
}

-- REPO
if #args >= 1 then
    repo = args[2]
else
    repo = 'https://raw.githubusercontent.com/Demiu/GTNH-Unmaintainer/'
end

-- BRANCH
if #args >= 2 then
    branch = args[1]
else
    branch = 'master'
end

-- INSTALL
for i=1, #scripts do
    shell.execute(string.format('wget -f %s%s/%s', repo, branch, scripts[i]))
end