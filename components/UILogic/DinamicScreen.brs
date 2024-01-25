sub DinamicScreen()
    m.arrayScreen = []
end sub

function OpenScreen(node as Object)
    lastScreen = m.arrayScreen.Peek()
    if lastScreen <> invalid
        lastScreen.visible = false
    end if

    m.top.AppendChild(node)
    node.SetFocus(true)
    m.arrayScreen.Push(node)
end function

function CloseScreen(node as Object)
    if node = invalid OR (m.arrayScreen.Peek() <> invalid AND m.arrayScreen.Peek().IsSameNode(node))
        lastScreen = m.arrayScreen.Peek() 
        lastScreen.visible = false
        m.top.RemoveChild(node)
        lastScreen = m.arrayScreen.Peek() 
        if lastScreen <> invalid
            lastScreen.visible = true
            lastScreen.SetFocus(true)
        end if
    end if
end function