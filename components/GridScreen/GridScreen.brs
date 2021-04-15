sub init()
    print "grid screen init"
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)
    m.titleLabel = m.top.FindNode("titleLabel")
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
    m.durationLabel = m.top.FindNode("durationLabel")

    m.top.ObserveField("visible", "OnVisibleChanged")
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
    m.rowList.ObserveField("rowItemSelected", "OnItemSelected")
end sub

sub OnVisibleChange()
    if m.top.visible = true
        m.RowList.SetFocus(true)
    end if
end sub


sub OnItemFocused()
    focusIndex = m.rowList.rowItemFocused
    row = m.rowList.content.GetChild(focusIndex[0])
    item = row.getChild(focusIndex[1])
    m.titleLabel.text = item.title
    m.descriptionLabel.text = item.description
end sub

