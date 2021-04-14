sub init() 
    m.durationLabel = m.top.FindNode("durationLabel")
    m.poster = m.top.FindNode("poster")
end sub
'test
sub OnContentSet()
    print "OnContentSet()"
    content = m.top.itemContent
    if content <> invalid
        m.durationLabel.text = content.length
        m.poster.uri = content.hdPosterUrl
    end if
end sub