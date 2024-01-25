sub Init()
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)

    m.title = m.top.FindNode("titleNovela")
    m.description = m.top.FindNode("descriptionNovela")
    m.year = m.top.FindNode("yearNovela")

    m.top.ObserveField("visible", "OnVisibleNovela")
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")

end sub

sub OnVisibleNovela()
    if m.top.visible = true
        m.rowList.SetFocus(true)
    end if
end sub


sub OnItemFocused()
    focusedIndex = m.rowList.rowItemFocused
    row = m.rowList.content.GetChild(focusedIndex[0])
    item = row.GetChild(focusedIndex[1])

    m.title.text = item.name
    m.description.text = item.description
    m.year.text = item.year

end sub


