sub ShowGridScreen() 
    print "ShowGridScreen()"
    m.GridScreen = CreateObject("roSGNode","GridScreen")
    m.GridScreen.ObserveField("rowItemSelected", "OnGridScreenItemSelected")
    ShowScreen(m.GridScreen)
end sub

sub OnGridScreenItemSelected(event as Object)
    print "OnGridScreenItemSelected"
    grid = event.GetRoSGNode()
    m.selectedIndex = event.GetData()
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    ShowDetailsScreen(rowContent, m.selectedIndex[1])
end sub