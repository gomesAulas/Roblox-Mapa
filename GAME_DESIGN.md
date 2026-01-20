# Roblox - Mapa de Evolução (GDD)

## 1) Visão Geral
**Objetivo:** criar um jogo de evolução em Roblox com progressão longa, variedade de conteúdo e vários loops de gameplay (missões, drops, eventos, raids e masmorras).

**Público-alvo:** jogadores que gostam de grind com progressão clara, colecionismo e desafios em grupo.

**Pilares do design:**
- **Progressão contínua:** XP, níveis, atributos e classes.
- **Variedade de conteúdo:** biomas, masmorras, eventos aleatórios e bosses únicos.
- **Economia dupla:** moeda do jogo + Robux (cosméticos e conveniência controlada).

---

## 2) Loop de Gameplay Principal
1. **Explorar biomas** → 2. **Lutar com monstros** → 3. **Completar missões** →
4. **Receber XP, moeda e drops** → 5. **Melhorar atributos e habilidades** →
6. **Acessar novos mapas/dungeons/raids** → repetir.

---

## 3) Progressão e Sistemas
### 3.1 Níveis, XP e Atributos
- **XP:** recebido por combate, missões, eventos e masmorras.
- **Atributos principais:**
  - Força (dano físico)
  - Agilidade (velocidade/crit)
  - Inteligência (dano mágico)
  - Vitalidade (vida/defesa)
  - Sorte (chance de drop)
- **Pontos de atributo**: concedidos a cada nível.

### 3.2 Classes e Especializações
- **Classes base:** Guerreiro, Arqueiro, Mago.
- **Evoluções:** desbloqueio por rank ou por missão de classe.
  - Guerreiro → Cavaleiro / Berserker
  - Arqueiro → Patrulheiro / Atirador
  - Mago → Elementalista / Necromante

### 3.3 Ranks
- Ranks obtidos por nível + desafios especiais.
- **Efeitos:** bônus de atributo, acesso a áreas e itens exclusivos.

---

## 4) Conteúdo do Mundo
### 4.1 Biomas Principais
- **Floresta Inicial:** mobs básicos, missões introdutórias.
- **Deserto Rubro:** inimigos com resistência física.
- **Tundra Congelada:** inimigos com lentidão/controle.
- **Pântano Sombrio:** debuffs e venenos.
- **Montanhas Celestes:** inimigos elite, alto risco/alta recompensa.

### 4.2 Masmorras (Dungeons)
- **Instanciadas** com 3 a 5 salas.
- **Final Boss** com drop de itens raros e títulos.

### 4.3 Raids
- 6-10 jogadores.
- Mecânicas em fases (ex.: escudos, adds, enrage).
- Recompensas únicas (skins, títulos e armas lendárias).

### 4.4 Eventos Aleatórios
- **Invasão de monstros** em um bioma.
- **Tesouro escondido** (tempo limitado).
- **Boss mundial** com spawn global.

---

## 5) Inimigos e Bosses Únicos
- **Monstros comuns:** drops básicos (moeda/itens comuns).
- **Elites:** chance de drop de raros.
- **Bosses únicos:** drop garantido de material raro + título.

---

## 6) Economia e Lojas
### 6.1 Moeda do Jogo
- Usada para comprar itens básicos, upgrades e consumíveis.

### 6.2 Loja Robux (Cosméticos e Conveniência)
- **Skins** que dão **habilidades cosméticas** e bônus leves (ex.: +2% XP), sem pay-to-win.
- **Passe de batalha** com recompensas visuais.
- **Boosters temporários** (XP, drop). Balanceados para não quebrar progressão.

### 6.3 Área de Lojas (Hub)
- **NPCs de itens** (armas, armaduras, consumíveis).
- **NPC de crafting** (troca de materiais por equipamentos).
- **NPC de títulos** (recompensas de conquistas).
- **NPC de missões diárias**.

---

## 7) Itens, Drops e Crafting
- **Raridades:** Comum, Incomum, Raro, Épico, Lendário.
- **Crafting:** juntar materiais de masmorras para criar itens.
- **Drops especiais:** itens cosméticos e pets de bosses.

---

## 8) Títulos e Conquistas
- Títulos por feitos: “Caçador de Dragões”, “Explorador Mestre”.
- Pequenos bônus cosméticos/estéticos.

---

## 9) NPCs e Missões
- **Missões principais:** narrativa por biomas.
- **Missões secundárias:** repetíveis (diárias/semanais).
- **NPCs de história:** desbloqueiam novas áreas.

---

## 10) Mapa e Layout
### 10.1 Hub Central
- Zona segura com lojas, NPCs, teleportes.

### 10.2 Caminhos
- Rotas que conectam biomas com checkpoints.

### 10.3 Portais
- Portais para masmorras e raids.

---

## 11) Personagem e Skins
- Personagem base evolui por nível.
- **Skins compráveis** dão **habilidade visual** e **atributo leve**.
  - Exemplo: Skin “Fênix”: aura de fogo +1% dano mágico.

---

## 12) Plano de Implementação (MVP → Expansões)
### MVP (Primeira versão)
- 2 biomas + 1 masmorra.
- 2 classes básicas.
- Loja básica + NPCs.
- Sistema de XP/nível/drops.

### Expansão 1
- 2 biomas adicionais.
- Sistema de ranks.
- 1 raid.

### Expansão 2
- Eventos aleatórios.
- Boss mundial.
- Crafting completo.

---

## 13) Próximos Passos Técnicos
1. Criar protótipo do mapa e hub.
2. Implementar sistema de combate e atributos.
3. Criar sistema de missões e drops.
4. Adicionar loja e monetização balanceada.
5. Testes e balanceamento (progressão e economia).

---

## 14) Observações de Balanceamento
- Evitar pay-to-win.
- Escalar dificuldade por bioma/nível.
- Controlar inflação de moeda e drops raros.

---

## 15) Loja de Atributos e Limites de Ataque
- **Atributos compráveis:** itens de consumíveis ou upgrades (ex.: +Força) compráveis com **moeda do jogo** ou **Robux**.
- **Moeda rara:** a versão com moeda do jogo tem **drop baixo** e custo alto para manter o equilíbrio.
- **Limite de ataque (soft cap):** existe um teto de ataque escalonado por nível/classe para evitar dano infinito.
- **Escalonamento:** o soft cap aumenta com rank e conteúdo mais difícil, mantendo progressão e balanceamento.

---

## 16) Sistema de Códigos, Grupo e Guilda
### 16.1 Códigos de Recompensa
- Área de UI para inserir código do criador.
- Recompensas: itens, XP, moeda e cosméticos.
- Cada código pode ser usado apenas uma vez por jogador.

### 16.2 Grupos (Party)
- Jogadores podem formar grupo para upar juntos.
- **Divisão de recompensa:** XP, moeda e drops divididos igualmente.
- Bônus opcional de grupo em eventos e masmorras.

### 16.3 Guildas
- Criar guilda com nome, rank e progresso coletivo.
- **Rank de guilda:** evolui por XP coletivo.
- **Benefícios:** bônus de XP para membros e acesso a raids especiais.

---

## 17) HUD e UI Essencial
- Barra de vida, mana e stamina.
- Slots rápidos de habilidade (4 a 6).
- Indicadores de XP, nível, rank e guilda.
- Botão de código promocional na área de loja/hub.
- Layout padronizado com tema e posições (tema + cores).

---

## 18) Mapas, Portais e Conteúdo Único
### 18.1 Mapas e Mundos
- Cada mapa tem faixa de nível, bioma e loot próprio.
- Portais no hub liberados por nível e rank.

### 18.2 Criaturas e Bosses Únicos
- Mobs com drops temáticos por bioma.
- Bosses únicos com título garantido e item raro.

### 18.3 Eventos de Mundo
- Eventos sazonais com criaturas especiais e drops exclusivos.
- Recompensas temporárias para incentivar participação.

---

## 19) Habilidades, Masmorras e Raids
- Habilidades com cooldown, custo de mana/stamina e escalas de dano.
- Cada habilidade possui animação, VFX e hitbox recomendados.
- Hitboxes reais usam busca por raio/caixa e aplicam dano/efeitos.
- Masmorras com salas e boss final.
- Raids com limite de jogadores e loot único.

---

## 20) NPCs e Itens
- NPCs no hub para loja, poções e missões.
- Itens com efeitos claros (cura, ataque, defesa).

---

## 21) IA de Mobs e Drops
- Mobs perseguem o jogador em alcance, atacam e patrulham quando ociosos.
- Bosses aplicam ataques mais fortes com tempo de recarga maior.
- Drops gerados no chão com moeda e itens por bioma.

---

## 22) Anti-gravidade e Spawner
- Áreas especiais com gravidade reduzida para combate e exploração.
- Spawner de mobs/bosses por região com horários e respawn.

---

## 23) HUD e Cliente
- HUD real com barras animadas, hotbar e cooldowns.
- Cliente aplica animações base e por habilidade.
- UI conectada aos dados do perfil (vida/mana/stamina).

---

## 24) Perfil e Inventário
- Perfil em memória com nível, XP, moedas e atributos.
- Inventário guarda itens obtidos em drops e quests.
- Serviços de coleta aplicam recompensas no perfil.

---

## 25) Mana, Stamina e Sync
- Mana e stamina regeneram automaticamente.
- HUD recebe stats via RemoteEvent para atualização em tempo real.

---

## 26) Missões e Skins
- Missões com objetivos (matar, coletar, explorar).
- Recompensas: XP, moeda, itens e títulos.
- Skins com efeitos visuais e bônus leves.

---

## 27) Auras e Atributos
- Auras com efeito visual e bônus leves (ataque, defesa, velocidade).
- Ativação limitada por jogador para manter equilíbrio.
- Auras raras podem vir de eventos e bosses.

---

## 28) Animações e Estilos
- Conjunto base de animações para caminhar, correr, pular e cair.
- Variações por classe para dar identidade (espada, magia, etc.).
- Habilidades podem disparar animações específicas por nome da skill.
- Permite atualizar IDs sem refatorar scripts (via `Config/Animations.lua`).

---

## 29) Recompensas de Conta (Badges e Avatar)
- Códigos podem liberar **badges** e **itens de avatar**.
- Badges ficam na conta e podem ser usados em outros jogos como prova.
- Itens de avatar precisam de prompt de compra (MarketplaceService) e ficam na conta.
- Regra importante: jogos **não podem conceder** itens de avatar sem compra.
- Use a lista `AccountRewardsPending` para mostrar resgate na UI.
