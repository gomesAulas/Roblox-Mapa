# Começo rápido (MVP)

## Objetivo
Iniciar o esqueleto do jogo com sistemas básicos de atributos, soft cap de ataque e economia.

## Estrutura adicionada
- `src/ReplicatedStorage/Config`
  - Tabelas de balanceamento, classes, ranks e drops.
- `src/ServerScriptService/Systems`
  - Serviços de atributos, moedas e soft cap.

## Próximos passos recomendados
1. Criar um **Place** no Roblox Studio e importar a pasta `src`.
2. Converter as pastas para **Folders** e os arquivos `.lua` para **ModuleScripts**.
3. Conectar os módulos ao sistema de combate e ao loop de drops.
4. Ajustar números de balanceamento em `Config/Balance.lua`.

## Observações
- Os módulos são base para o MVP e precisam ser integrados com UI, NPCs e combates.
- O soft cap evita crescimento infinito de ataque, mantendo progressão saudável.

## Sistemas adicionados nesta etapa
- **Códigos promocionais:** `CodeRedeemService.lua` + `Config/Rewards.lua`.
- **Grupos (party):** `PartyService.lua` para divisão de XP/moeda/drops.
- **Guildas:** `GuildService.lua` com XP coletivo e rank.
- **HUD:** `Config/HudConfig.lua` para barras e slots rápidos.
- **Layout do HUD:** `Config/HudLayout.lua` com posições, tamanhos e tema.
- **Hitbox/combate real:** `HitboxService.lua` para detectar alvos e aplicar dano.
- **IA de mobs:** `MobAIService.lua` com perseguição, ataque e patrulha simples.
- **Drops físicos:** `DropService.lua` para gerar e spawnar drops no mapa.
- **Portais:** `PortalService.lua` para validar entrada por nível.
- **Zona anti-gravidade:** `AntiGravityService.lua` para áreas com gravidade reduzida.
- **Spawner de mobs/bosses:** `MobSpawnService.lua` para instanciar NPCs e ligar IA.
- **Execução de habilidades:** `CombatAbilityService.lua` para dano + hitbox real.
- **Coleta de drops:** `DropPickupService.lua` para pegar moedas/itens no chão.
- **Perfil/jogador:** `PlayerProfileService.lua` com dados base em memória.
- **Inventário:** `InventoryService.lua` para aplicar drops no perfil.
- **Integração de drops:** `DropIntegrationService.lua` para spawn + pickup + recompensa.
- **Teleporte de mundo:** `WorldTeleportService.lua` + `PortalRuntimeService.lua`.
- **HUD real (cliente):** `StarterPlayerScripts/HudClient.lua`.
- **Animações (cliente):** `StarterPlayerScripts/AnimationClient.lua`.
- **Bootstrap server:** `ServerScriptService/MainServer.lua` para iniciar portais.
- **Sync de stats:** `StatReplicationService.lua` para atualizar HUD.
- **Mana/Stamina:** `ManaStaminaService.lua` com regeneração.
- **Spawn automático:** `SpawnZones.lua` + `MobSpawnerRuntimeService.lua`.

## Integrações sugeridas
1. Conectar `CodeRedeemService.redeem` a uma UI de código no hub.
2. Chamar `PartyService.splitRewards` ao finalizar missões ou derrotar mobs.
3. Aplicar `GuildService.getGuildXpShare` quando distribuir XP.
4. Usar `HudConfig` para montar HUD com barras e hotbar.
5. Integrar `HitboxService` no loop de combate de cada habilidade.
6. Ligar `MobAIService.start` em cada mob spawnado no mapa.
7. Usar `DropService.generateMobDrops` ao matar mobs e spawnar no chão.
8. Validar portais com `PortalService.canEnter` antes do teleporte.
9. Marcar áreas anti-gravidade e chamar `AntiGravityService.bindZone`.
10. Usar `MobSpawnService.spawnMob`/`spawnBoss` com modelos no mapa.
11. Chamar `CombatAbilityService.execute` ao usar habilidades de ataque.
12. Chamar `DropPickupService.bindPickup` ao criar drops no chão.
13. Criar `PlayerProfileService` e consultar perfil nas integrações.
14. Trocar `DropService` por `DropIntegrationService` para aplicar recompensas.
15. Marcar portais com tag `Portal` e atributo `PortalId`.
16. Usar `WorldTeleportService` para mover o jogador ao destino.
17. Manter `HudClient.lua` e `AnimationClient.lua` em `StarterPlayerScripts`.
18. Garantir `StatsUpdate` em `ReplicatedStorage/Remotes`.
19. Criar `ServerStorage/MobTemplates` com modelos dos mobs.
20. Criar Parts no mapa com os IDs de `SpawnZones.lua`.

## Conteúdo de mundo (dados iniciais)
- `Config/Worlds.lua` e `Config/Portals.lua` para mapas e portais.
- `Config/Mobs.lua`, `Config/Bosses.lua`, `Config/Events.lua` para criaturas e eventos.

## Conteúdo adicional (MVP)
- `Config/Abilities.lua`, `Config/Items.lua`, `Config/Npcs.lua`.
- `Config/Dungeons.lua`, `Config/Raids.lua`.
- `AbilityService.lua` e `CombatService.lua` para base de habilidades e dano.

## Missões e skins
- `Config/Quests.lua` para missões base e recompensas.
- `Config/Skins.lua` para efeitos cosméticos e bônus leves.
- `QuestService.lua` para iniciar missões e atualizar progresso.

## Auras
- `Config/Auras.lua` para definições de aura e bônus.
- `AuraService.lua` para aplicar e remover auras no perfil.

## Animações
- `Config/Animations.lua` com animações base e variações por classe/ habilidade.
- `AnimationService.lua` para buscar conjuntos de movimento e animações de habilidade.

## Habilidades (qualidade e VFX)
- `Config/Abilities.lua` inclui animações, VFX e hitboxes sugeridas.
- `AbilityService.getPresentation` retorna dados para UI/efeitos.

## Recompensas de conta (Badges/Avatar)
- `Config/Rewards.lua` guarda IDs de badges e itens de avatar.
- `AccountRewardService.lua` entrega badges e dispara prompts de compra.
- Use `profile.AccountRewardsPending` para mostrar UI e permitir resgate.
