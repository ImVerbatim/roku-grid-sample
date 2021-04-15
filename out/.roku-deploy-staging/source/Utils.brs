function GetTime(length as Integer) 
    minutes = (length / 60).ToStr()
    seconds = length MOD 60
    if seconds < 10 
        seconds = "0" + seconds.ToStr()
    else
        seconds = seconds.ToStr()
    end if
    return minutes + ":" + seconds
end function

function ContentListToSimpleNode(contentList as Object, nodeType = "ContentNode" as String)
    result = CreateObject("roSGNode", nodeType)
    if result <> invalid
        for each itemAA in contentList
            item = CreateObject("roSGNode", nodeType)
            item.SetFields(itemAA)
            result.AppendChild(item)
        end for
        return result
    end if
end function