local CSTM = {Tables = {}}


--- By Roge#4087

CSTM.Tables["GetChildrenNames"] = function(instance)
    local names = {}
    for i,v in ipairs(instance:GetChildren()) do
        if not table.find(names, v.Name) then
            table.insert(names, v.Name)
        end
    end
    return names
end

CSTM.Tables["GetChildrenUniqueNames"] = function(instance)
    local names = {}
    for i,v in ipairs(instance:GetChildren()) do
        table.insert(names, v.Name)
    end
    return names
end

CSTM.Tables["GetDictionaryLength"] = function(dictionary)
    local total = 0
    for i,v in pairs(dictionary) do
        total = total + 1
    end
    return total
end

CSTM.Tables["GetDictionaryValues"] = function(dictionary)
    local names = {[1] = {},[2] = {}}
    for i,v in pairs(dictionary) do
        table.insert(names[1], i)
        table.insert(names[2], v)
    end
    return names
end

CSTM.Tables["GetDictionaryUniqueValues"] = function(dictionary)
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

return CSTM
