local CL = {Tables = {}}


--- By Roge#4087

CL.Tables["GetTableLength"] = function(table)
    local total = 0
    for i,v in pairs(dictionary) do
        total = total + 1
    end
    return total
end

CL.Tables["GetTableValues"] = function(table)
    local names = {[1] = {},[2] = {}}
    for i,v in pairs(dictionary) do
        table.insert(names[1], i)
        table.insert(names[2], v)
    end
    return names
end

CL.Tables["GetTableUniqueValues"] = function(table)
    local names = {[1] = {},[2] = {}}
    for i,v in pairs(dictionary) do
        if not table.find(names[1], i) then
            table.insert(names[1], i)
        end
        if not table.find(names[2], v) then
            table.insert(names[2], v)
        end
    end
    return names
end

return CL
