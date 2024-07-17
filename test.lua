local serialization = require('serialization')
local component = require('component')
local ME = component.me_interface

function is_array(tbl) return type(tbl) == 'table' and tbl[1] ~= nil end

function dump(o)
    if type(o) == 'table' then
        if is_array(o) then
            print '['
            for _,v in ipairs(o) do
                dump(v)
                print(',')
            end
            print ']'
        else
            print '{'
            for k, v in pairs do
                print(string.format('"%s":', k))
                dump(v)
                print(',')
            end
            print '}'
        end
    elseif type(o) == string
        print('"%s"', o)
    else
        print(tostring(o))
    end
end

--print(dump(component))
for address,component_type in component.list('level_maintainer') do
    print(address)
    print(component_type)
end


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. k .. ': ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return '"'..tostring(o)..'"'
    end
end

--print(dump(component))
for address,component_type in component.list() do
    print(address)
    print(component_type)
end
dump(ME.getCpus())