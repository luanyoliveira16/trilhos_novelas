'Função para mostrar a tela do vídeo quando um vídeo é selecionado e escuta quando o vídeo quando o vídeo é concluído ou o botão voltar é pressionado.
sub ShowVideoScreen(content as Object, itemIndex as Integer)
    m.videoPlayer = CreateObject("roSGNode", "Video")
    'Vamos criar uma lista de reprodução contendo o video selecionado
    'Ao selecionar o primeiro vídeo da lista teremos como retorno este vídeo por todos os outro, maas precisamos pensar na lógica quando não seja o primeiro v[ideo da lista escolhido.
    if itemIndex <> 0 'checa se o índice é diferente de 0, isto é, se o item não é o primeiro elemento da lista.
        numOfChildren = content.GetChildCount() 'obter o número de vídeos da lista
        'o método acima nos retorna uma matriz com o número de vídeos a partir do index expecificiado que estará atribuído a variável numOfChildren.
         children = content.GetChildren(numOfChildren - itemIndex, itemIndex) 'retorna quantos videos tem na lista. calcula pela quantidade de videos na content - o indice escolhido, a partir do indice escolhido.
         
         childrenClone = []
         for each child in children
             'precisamos clonar o nó do item porque ele será danificado em caso de invalidação do conteúdo do nó de vídeo
             childrenClone.Push(child.Clone(false))
         end for

         'cria novo nó pai para clonar os itens.
         node = CreateObject("roSGNode", "ContentNode")

         node = CreateObject("roSGNode", "ContentNode")
         node.Update({ children: childrenClone}, true)
         m.videoPlayer.content = node 
    else
         m.videoPlayer.content = content.Clone(true)
    end if
    
    m.videoPlayer.contentIsPlayList = true 'habilita playlist (uma sequencia de videos)
    OpenScreen(m.videoPlayer) 'mostra screen
    m.videoPlayer.control = "play" 'inicia a reprodução
    m.videoPlayer.ObserveField("state", "OnVideoPlayerStateChange")
    m.videoPlayer.ObserveField("visible", "OnVideoVisibleChange")
end sub

'Função incovada quando houver alguma mudança de estado como fim da reprodução ou erro.
sub OnVideoPlayerStateChange()
    state = m.videoPlayer.state
    if state = "error" or state = "finished"
        CloseScreen(m.videoPlayer)
    end if
end sub 

'Função para interromper a reprodução do video.
sub OnVideoVisibleChange()
    if m.videoPlayer.visible = false and m.top.visible = true
       currentIndex = m.videoPlayer.contentIndex
       m.videoPlayer.control = "stop"
       m.videoPlayer.content = invalid
       m.GridScreen.SetFocus(true)
       m.GridScreen.jumpToRowItem = [m.selectedIndex[0], currentIndex + m.selectedIndex[1]]
    end if
end sub

