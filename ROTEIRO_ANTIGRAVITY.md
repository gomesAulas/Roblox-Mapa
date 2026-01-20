# Roteiro para AntiGravity (app de programação)

Use este roteiro para gerar o jogo base no AntiGravity e depois abrir no Roblox Studio.

## 1) Estrutura de pastas (obrigatória)
Crie as pastas e scripts abaixo exatamente com estes nomes:

- `ReplicatedStorage/Config`
- `ReplicatedStorage/Remotes`
- `ServerScriptService/Systems`
- `StarterPlayer/StarterPlayerScripts`
- `ServerStorage/MobTemplates`

Copie os arquivos do repositório para essas pastas conforme indicado no `START_HERE.md`.

## 2) Criação do Hub
- Crie um **Hub** central com:
  - Loja (NPCs)
  - Portais para cada mundo
  - Área de códigos promocionais
  - Quadro de missões

## 3) Portais
Para cada portal:
- Crie uma `Part` (ou `Model`) no Hub.
- Adicione a tag **Portal**.
- Defina o atributo `PortalId` com o mesmo Id de `Config/Portals.lua`.
- O script `MainServer.lua` já chama `PortalRuntimeService.bindAll()`.

## 4) Mundos e biomas
Crie os mapas conforme `Config/Worlds.lua`:
- Floresta Inicial
- Deserto Rubro
- Tundra
- Pântano

Cada mundo deve ter:
- Terreno/decoração
- Pontos de spawn
- Zonas de mobs

## 4.1) Roteiro das criaturas por bioma
Depois de criar os biomas, use esta lista para posicionar as criaturas:
- **Floresta Inicial (Forest):** Lobo Sombrio
- **Deserto Rubro (Desert):** Escorpião Rubra
- **Tundra:** Yeti Gélido
- **Pântano (Swamp):** Sapo Venenoso

## 5) Zonas de spawn de mobs
Para cada zona:
- Crie uma `Part` invisível no mapa com o **mesmo nome** do Id em `Config/SpawnZones.lua`.
- Exemplo: `FlorestaZona1`, `DesertoZona1`.
- O `MobSpawnerRuntimeService` detecta essas parts e cria mobs automaticamente.

## 6) Templates de mobs
Crie em `ServerStorage/MobTemplates`:
- `LoboSombrio`
- `EscorpiaoRubra`
- (e os demais conforme `Config/Mobs.lua`)

Cada template deve ser um `Model` com `Humanoid` e `HumanoidRootPart`.

## 7) HUD e animações
Verifique se os scripts client estão em:
- `StarterPlayerScripts/HudClient.lua`
- `StarterPlayerScripts/AnimationClient.lua`

O HUD já exibe HP/Mana/Stamina.
As animações base são lidas de `Config/Animations.lua`.

## 8) Drops
Quando um mob morre, chame:
- `DropIntegrationService.spawnAndBindDrops(...)`

Isso cria drops físicos e aplica recompensas automaticamente.

## 9) Mana e stamina
O sistema de mana/stamina já existe:
- `ManaStaminaService.lua` faz regen
- `StatReplicationService.lua` envia pro HUD

## 10) Publicação
1. Abra o projeto no Roblox Studio.
2. Confirme que todos os ModuleScripts estão no lugar.
3. Teste: portal, spawn de mobs, HUD, drops.
4. Publique no Roblox.

## 11) Verificação no GitHub
Se a pergunta for “já está salvo no GitHub?”, confirme localmente:
1. `git status` para ver se há mudanças pendentes.
2. `git log -1` para ver o último commit.
3. `git remote -v` para confirmar o remoto correto.
4. `git push` (se necessário) para enviar ao GitHub.

## 12) Prompt para colar no AntiGravity
Use este texto como prompt no AntiGravity para ele configurar tudo no Roblox Studio:

```
Você vai abrir o Roblox Studio e configurar a estrutura do projeto exatamente assim:
- Crie as pastas: ReplicatedStorage/Config, ReplicatedStorage/Remotes, ServerScriptService/Systems, StarterPlayer/StarterPlayerScripts, ServerStorage/MobTemplates.
- Importe o conteúdo da pasta src/ do repositório para essas pastas.
- Converta os arquivos .lua em ModuleScripts e mantenha os nomes iguais.
- No mapa, crie o Hub com portais, loja (NPCs), área de códigos e quadro de missões.
- Para cada portal, crie uma Part com tag Portal e atributo PortalId (igual ao Config/Portals.lua).
- Para cada SpawnZone, crie uma Part invisível com o mesmo nome do Config/SpawnZones.lua.
- Em ServerStorage/MobTemplates, crie modelos dos mobs com Humanoid e HumanoidRootPart.
- Garanta que StarterPlayerScripts tenha HudClient.lua e AnimationClient.lua.
- Abra o Play Test e verifique: HUD, portais, spawn de mobs e drops.
```

## 13) Assets 3D (mobs, criaturas, personagens)
Você vai precisar de modelos 3D reais para mobs/criaturas. Sugestão de fluxo:
1. Separe um **pack de assets 3D** (FBX/OBJ/GLB) com os mobs listados em `Config/Mobs.lua`.
2. Importe no Roblox Studio e substitua os placeholders em `ServerStorage/MobTemplates`.
3. Garanta que cada modelo tenha `Humanoid` e `HumanoidRootPart`.
4. Ajuste escala/colisão e configure animações básicas (idle/run/attack).

---

## Checklist rápido
- [ ] Pastas corretas criadas
- [ ] Portais com tag `Portal` e atributo `PortalId`
- [ ] Zonas com Ids de `SpawnZones.lua`
- [ ] Templates de mobs em `ServerStorage/MobTemplates`
- [ ] HUD e animações funcionando
- [ ] Teste de combate e drops
