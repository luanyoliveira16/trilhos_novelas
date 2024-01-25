sub Init() 
    m.firstText = "Bem Vindo!"  
    m.secondText = "Carregando..."  
    m.label = m.top.FindNode("exampleLabel")
    m.label.text = m.firstText
    m.textchange = false

    m.loading = m.top.FindNode("loading")


    examplerect = m.label.boundingRect()
    centerx = (1280 - examplerect.width) / 2
    centery = (720 - examplerect.height) / 2
    m.label.translation = [ centerx, centery ]

    timer = m.top.findNode("exampleTimer")
    timer.ObserveField("fire", "changetext")
    timer.control = "start"

    m.top.setFocus(true)
  end sub

  sub changetext()
    if (m.textchange = false) then
      m.label.text = m.firstText
      m.label.visible = false
      m.label.text = m.secondText
      DinamicScreen()
      GridShow()
      ContentRun()
      m.textchange = true
    end if
end sub

