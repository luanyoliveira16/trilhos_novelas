sub GridShow()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
    m.GridScreen.ObserveField("rowItemSelected", "OnGridScreenSelected")
    OpenScreen(m.GridScreen)
end sub

sub OnGridScreenSelected(event as Object)
    grid = event.GetRoSGNode()
    m.selectedIndex = event.GetData()
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    itemIndex =  m.selectedIndex[1]
    ShowVideoScreen(rowContent, itemIndex)
end sub