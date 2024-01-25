'Primeiro chamamos a função Init() que define a função GetContent() que constrói uma árvore de nós de conteúdos que devem ser exibidos.
sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' requisição do feed de conteúdo da API.
    feed = ReadAsciiFile("pkg:/components/feed/novelas.json")
    json = ParseJson(feed)
    rootChildren = []

    rows = {} 'para armazenar temporariamente os metadados.
    'converter a string json em componentes brs
    if json <> invalid
        for index = 1 to 6  '20
                    row = {}
                    'nome de título para categoria
                    
                    'campo filho para a matriz vazia
                    row.children = []
                    'para cada vídeo nas categorias filmes e curtas chamaremos o método get
                    ' for each item in value 'analaisa os itens e adiciona ao row
                    for each item in json 'analaisa os itens e adiciona ao row
                        ' stop                            
                        if index = 1 AND item.year > "1969"  and item.year < "1980" then
                            row.title = "Anos 70"
                            itemData = GetItemData(item)  
                            row.children.Push(itemData)

                        end if

                        if index = 2 AND item.year > "1979" and item.year < "1990" then
                        row.title = "Anos 80"
                        itemData = GetItemData(item)  
                        row.children.Push(itemData)
                        end if

                        if index = 3 AND item.year > "1989" and item.year < "2000" then
                            row.title = "Anos 90"
                            itemData = GetItemData(item)  
                            row.children.Push(itemData)
                        end if

                        if index = 4 AND item.year > "1999" and item.year < "2010" then
                            row.title = "Anos 00"
                            itemData = GetItemData(item)  
                            row.children.Push(itemData)
                        end if

                        if index = 5 AND item.year > "2009" and item.year < "2020" then
                            row.title = "Anos 10"
                            itemData = GetItemData(item)  
                            row.children.Push(itemData)
                        end if


                        if index = 6 AND item.year > "2019" and item.year < "2030" then
                            row.title = "Anos 20"
                            itemData = GetItemData(item)  
                            row.children.Push(itemData)
                        end if
    
                    end for
                    

                    rootChildren.Push(row)
            ' end for
            'Criaremos um nó de conteúdo e depois os seus filhos nós
            contentNode = CreateObject("roSGNode", "ContentNode")
            contentNode.Update({
                children: rootChildren
            }, true)
        end for
        'pegaremos cada chave do feed e atribuiremos seu valor na variável value
        
        m.top.content = contentNode

    end if
end sub

function GetItemData(infos as object) as object
    item = {}
    item.title = infos.title
    item.year = infos.year
    item.description = infos.overview
    item.hdPosterURL = infos.thumbnail
    return item
end function