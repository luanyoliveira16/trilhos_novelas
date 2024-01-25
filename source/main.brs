sub Main()
    ShowChannel()
end sub

sub ShowChannel()
    screen = CreateObject("roSGScreen")
    scene = screen.CreateScene("MainScene")
    m.port = CreateObject("roMessagePort")
    screen.SetMessagePort(m.port)
    screen.Show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return
        end if
    end while
end sub