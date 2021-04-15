sub init()
    print "DetailsInit()"
    m.top.ObserveField("visible", "OnVisibleChange")
    m.top.ObserveField("itemFocused", "OnItemFocusChanged")

    m.buttons = m.top.FindNode("buttons")
    m.poster = m.top.FindNode("poster")
    m.description = m.top.FindNode("descriptionLabel")
    m.timeLabel = m.top.FindNode("timeLabel")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.releaseLabel = m.top.FindNode("releaseLabel")
    m.videoUrl = m.top.FindNode("videoUrlLabel")

    result = [] 
    for each button in ["Play"]
        result.Push({title : button})
    end for
    m.buttons.content = ContentListToSimpleNode(result)
end sub

sub OnVisibleChange() 
    if m.top.visible = true
        m.buttons.SetFocus(true)
        m.top.itemFocused= m.top.jumpToItem
    end if 
end sub

sub SetDetailsContent(content as Object)
    m.description.text = content.description
    m.poster.uri = content.hdPosterUrl
    m.timeLabel.text = GetTime(content.length)
    m.titleLabel.text = content.title
    m.releaseLabel.text = content.releaseDate
    m.videoUrl.text = content.videoUrl
end sub

sub OnJumpToItem() 
    content = m.top.content

    if content <> invalid and m.top.jumpToItem >= 0 and content.GetChildCount() > m.top.jumpToItem
        m.top.itemFocused = m.top.jumpToItem
    end if
end sub

sub OnItemFocusChanged(event as object) 
    focusedObject = event.GetData() 
    content = m.top.content.GetChild(focusedObject)
    SetDetailsContent(content)
end sub

function OnKeyEvent(key as String, press as Boolean) as boolean
    result = false
    if press
        currentItem = m.top.itemFocused
        if key = "left"
            m.top.jumpToItem = curentItem - 1
            result = true
        else if key = "right"
            m.top.jumpToItem = currentItem + 1
            result = true 
        end if
    end if
    return result
end function
        

