sub init()
    print "grid screen init"
    m.rowList = m.top.FindNode("rowList")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
    m.durationLabel = m.top.FindNode("durationLabel")


    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
end sub

sub OnItemFocused()
    focusIndex = m.rowList.rowItemFocused
    row = m.rowList.content.GetChild(focusIndex[0])
    item = row.getChild(focusIndex[1])
    m.titleLabel.text = item.title
    m.descriptionLabel.text = item.description
end sub