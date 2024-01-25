sub ContentRun()
    m.contentTask = CreateObject("roSGNode", "NovelaRequest")
    m.contentTask.ObserveField("content", "OnMainContentLoaded")
    m.contentTask.control = "run"
end sub

sub OnMainContentLoaded()
    m.GridScreen.SetFocus(true)
    m.loading.visible = false
    m.GridScreen.content = m.contentTask.content
end sub