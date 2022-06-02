# MTASA - Fonts

# PT-BR

Este resource é útil para gerenciar suas fonts, com ele você pode organizar todas dentro de um único resource evitando fazer o jogador baixar diversas vezes o mesmo arquivo, além de evitar o consumo desnecessário de memória RAM ao criar várias fontes iguais.

# Como ele funciona?
Como todas as fontes são armazenadas em um único resource, o jogador terá apenas **uma** cópia de cada fonte. Muitos costumam carregar a mesma fonte em diferentes resources, fazendo o jogador baixar muitas cópias do mesmo arquivo.

Além de economizar espaço em disco, e ter menos arquivos para serem baixados, o resource gerencia in-game as fontes que devem ficar carregadas na memória RAM do jogador.

Caso você não saiba, sempre que uma fonte é criada, um elemento do tipo fonte é criado, se você criar 10 fontes, será armazenado na memória do jogador 10 elementos iguais, para resolver esse problema, você pode usar esse resource.

# Como usar?

Adicione suas fontes na pasta **files**, no **meta.xml** e por fim dentro do arquivo **fonts.lua** na tabela **fontsPath**.
```
local fontsPath = {
    --fontName = "path"
    segoe_sb = "files/seguisb.ttf",
    segoe_r = "files/segoeui.ttf",
}
```

Sempre que for usar uma fonte, use a função **requestFont** e caso a fonte não esteja mais sendo usada destrua usando **destroyFont**

Veja alguns exemplos:
```
local fonts = exports.fonts

myFont12 = fonts:requestFont("segoe_sb", 12)
dxDrawText(...,myFont12)
```

```
local fonts = exports.fonts

function openGUI()
  myFont12 = fonts:requestFont("segoe_sb", 12)
  dxDrawText(...,myFont12)
end

function closeGUI()
  fonts:destroyFont("segoe_sb, 12)
end
```

# requestFont(string fontName, int size, bool bold, string quality)
Retorna um elemento dx-font.

# destroyFont(string fontName, int size)
Sem retorno, apenas destroi a fonte.
