# Checklist de ligações — gravador da TEIA

**Retomada atual (20/10):** piloto Seagate executado pelo usuário no Max e validado pelo Python. Gravador **1.2.0** com botões/JSONs dos lotes 51/68 preparado, sem mudanças de áudio ou ligações na TEIA/interface. Montagem segue **100/101**; tarefa 101 e execução nativa dos lotes ainda pendentes. Seguir o [guia atualizado](dataset_recorder_setup.md) e [handoff de 20/10](../_horsProject/handoff-2026-10-20.md).

**Conferido nos arquivos salvos em 19/10/2026. Max instalado: 8.5.2.**

Este é o checklist de montagem manual. O [guia do gravador](dataset_recorder_setup.md) explica o experimento, a operação e a validação dos WAVs. Monte uma seção por vez. O assistente não alterou os patches da TEIA/interface para produzir este documento.

**Atualizado em 20/10/2026: 100/101 tarefas concluídas.** O usuário confirmou o piloto com a versão 1.0.1; os dois pares WAV/JSON reais passaram na conferência de duração/formato, parâmetros e reconstrução da mistura. Tarefas 98–100 concluídas por essa evidência; 97 concluída pelos três testes isolados; 101 (Stop/reinício, pan e cauda) continua pendente. A reconstrução pedida na 101 já passou, mas não basta para concluir a caixa.

**Gravador 1.1.1 validado nativamente em 20/10:** painel executado pelo usuário; os dois pares WAV/JSON da sessão 20261020T123557727Z passaram na conferência offline. JSONs completos acima de 32 KB, picos de oito canais coerentes com o arquivo float32, parâmetros/hashes/eventos corretos e mistura reconstruível. Nenhuma nova falha nos registros desta rodada. O problema de truncamento da 1.1.0 foi corrigido e seus arquivos inválidos foram preservados. Não é preciso refazer ligações ou repetir o reparo. **Progresso 100/101**, 97 concluída após os três testes isolados; pendente Stop/reinício/pan/cauda (101). Detalhes no [guia](dataset_recorder_setup.md) e [handoff](../_horsProject/handoff-2026-10-19.md).

**Prioridade alterada pelo usuário em 20/10:** manter pan e extremo, adiar filtro e avançar à análise offline (`audio_analysis.py`/`.ipynb`). Configuração em disco já restaurada para enabled [1,1,1]. A tarefa 101 segue pendente; não foi substituída por teste simulado nem deve ser retomada por inércia. Montagem permanece 100/101.

## Como ler e marcar

- `[ ]` = ligação/montagem ainda pendente no arquivo inspecionado; marque `[x]` depois de montar e conferir.
- `[x]` em “já existe” significa que o objeto foi encontrado no arquivo; não significa validação sonora.
- **Portas são contadas da esquerda para a direita, começando em 1.** Em `gate 1 0`, inlet 1 controla a abertura e inlet 2 recebe os dados.
- Os IDs `obj-...` são referências do `.maxpat`; não aparecem escritos nos objetos na tela. Use principalmente texto, vizinhança e coordenadas para localizar.
- `(x, y)` indica a posição superior esquerda do objeto no patch salvo, em modo de edição; não é uma coordenada da tela/apresentação. Posições arredondadas abaixo servem de referência.
- Textos de objetos são completos, prontos para digitar. Linhas “Comment” são textos curtos para objetos `comment`, em inglês. **Para nomear uma porta da abstração**, selecione o objeto `inlet` ou `outlet` dentro dela e preencha **Comment no Inspector**: esse texto aparece ao passar o mouse sobre a porta na interface. Um objeto `comment` ao lado é apenas a legenda visual; não substitui o campo do Inspector.
- Use os nomes exatamente como escritos, incluindo `L`/`R` maiúsculos. **Não acrescente `#0` aos novos barramentos públicos:** eles precisam ligar patches distintos.
- Ações agrupadas na mesma caixa só ficam concluídas quando todos os fios descritos estiverem conectados.

## Mapa dos barramentos

| Nome | Tipo | Origem → destino |
| --- | --- | --- |
| `teia_test_input` | Áudio mono | Gravador → Main |
| `teia_test_glissando_L` / `teia_test_glissando_R` | Áudio estéreo | panSpace → gravador |
| `teia_test_cluster_L` / `teia_test_cluster_R` | Áudio estéreo | panSpace → gravador |
| `teia_test_extreme_L` / `teia_test_extreme_R` | Áudio estéreo | panSpace → gravador |
| `teia_test_control` | Mensagens | Gravador → interface |
| `teia_test_status` | Mensagens | Interface e Main → gravador |
| `teia_test_run_id` | Símbolo de identificação | Interface → prefixos de resposta na interface e no Main |
| `teia_test_triangle` | Lista G/C/E | Interface → gesture_weights |
| `teia_test_enabled` | Lista de três flags | Interface → Main |
| `teia_test_density_state` | Estado 0/1/2 | Motor de densidade → bloco de eventos na interface (montado e conferido em 90) |

### Retornos reorganizados pelo usuário — conferidos em 20/10

Os retornos abaixo usam sends/receives na **interface**, substituindo os fios longos. Os prefixos de ID e o destino `send teia_test_status` continuam os mesmos. Não recolocar os fios diretos antigos: duplicariam as respostas.

| Retorno | Fonte → send | Receive → prepend do retorno |
| --- | --- | --- |
| density | Saída 4 de density_weights obj-4 → `s apDen` obj-171 | `r apDen` obj-172 → obj-176 |
| temperature | Flonum obj-63 → `s temp` obj-89, existente | `r temp` obj-167 → obj-181 |
| permanence | Flonum obj-49 → `s permanencia` obj-85, existente | `r permanencia` obj-174 → obj-186 |
| contrast | Slider obj-122 → `s contrast` obj-33, existente | `r contrast` obj-177 → obj-132 |
| clock_ms | Number obj-158 → `s MarkClock` obj-179 | `r MarkClock` obj-182 → obj-157 |

`apDen` e `MarkClock` são barramentos acrescentados na interface; temp/permanencia/contrast aproveitam envios existentes. Dentro da interface, cada retorno auditado tem uma entrada de valor e uma entrada de configuração do prefixo no mesmo prepend, sem ciclo de retorno ou fio direto duplicado. Number → metro e demais destinos originais preservados. Os nomes são globais: manter uma única interface ativa durante o piloto, como previsto na seção 9. O teste no Max continua pendente.

## 1. `teia0.1/_main_teia0.1.maxpat`

Abra o [Main da TEIA 0.1](../teia0.1/_main_teia0.1.maxpat). É este arquivo, não `_main.maxpat` da raiz.

### 1A. Receber a entrada do gravador

**Referência existente:** `send~ entrada`, **obj-104**, em **(1122, 626)**. Hoje recebe o áudio do `sfplay~` obj-6, situado em (890, 36).

- [x] Crie **`receive~ teia_test_input`** ao lado de `send~ entrada`.
- [x] Ligue a saída 1 desse novo receiver ao inlet 1 do **`send~ entrada` já existente**. Preserve a conexão antiga do player; ele ficará parado durante o lote. Não crie um segundo caminho do gravador para esse mesmo bus.
- [x] Comment junto ao receiver: **`Recorder input only.`**

```text
receive~ teia_test_input
          |
          v
send~ entrada                  ← objeto existente obj-104
```

O novo receiver não deve entrar no ganho de dry, em `send~ voice1`, no DAC ou nos limiters. Seu destino é `entrada`, que alimenta os processamentos.

### 1B. Receber on/off dos três gestos

Referências existentes na parte superior esquerda:

| Gesto | Toggle | Posição | Envio já conectado abaixo |
| --- | --- | --- | --- |
| Glissando | obj-7 | (225, 535) | `s on_glissan`, obj-12, (225, 583) |
| Cluster | obj-9 | (326, 535) | `s on_cluster`, obj-13, (326, 583) |
| Extreme | obj-11 | (442, 535) | `s on_extreme`, obj-14, (442, 583) |

- [x] Crie **`receive teia_test_enabled`** e **`unpack i i i`**, próximos ao grupo dos três toggles.
- [x] Receiver saída 1 → unpack inlet 1.
- [x] Unpack saída 1 → toggle G obj-7; saída 2 → toggle C obj-9; saída 3 → toggle E obj-11. Os toggles continuam ligados aos sends existentes.
- [x] Comment: **`Apply gesture enable flags.`**

### 1C. Confirmar os flags efetivamente aplicados

- [x] Crie **`pack i i i`** abaixo do grupo. Toggle G saída 1 → pack inlet 1; C → inlet 2; E → inlet 3. Acrescente esses fios sem remover os sends `on_*`.
- [x] Crie **`receive teia_test_run_id`**, uma **message box** com **`set applied $1 enabled`**, **`prepend applied`** e **`send teia_test_status`**.
- [x] Receiver do ID → message box `set applied $1 enabled` → inlet 1 de `prepend applied`. Essa ligação configura o prefixo sem emitir resposta.
- [x] Pack dos toggles → inlet 1 do **mesmo** `prepend applied` → `send teia_test_status`.
- [x] Comment: **`Report applied enable flags.`**

```text
receive teia_test_run_id
          |
[set applied $1 enabled]        ← message box, não objeto newobj
          |
          v
prepend applied  <------------- pack i i i  ← saídas dos toggles G/C/E
          |
send teia_test_status
```

Como o unpack envia da direita para a esquerda, E e C atualizam os inlets frios antes de G disparar o pack. A resposta será `applied <run_id> enabled 1 1 1` no piloto.

### 1D. Condições para rodar o lote

Conferência durante a montagem: o toggle do player está em **(897, 408)**, acima de `sfplay~` obj-6 em **(897, 441)**. `adc~` obj-67 e `p fmSynth` obj-8 não têm fios de saída de áudio no Main salvo nesta conferência; não acrescentar conexões a eles para este teste. Parar o player antigo enviando 0 pelo toggle é a ação necessária para excluir a entrada interna que ainda chega a `send~ entrada`.

- [x] Parar o `sfplay~` do Main, desativar ADC e síntese FM; conferir que apenas o gravador alimenta `entrada`. Sends de áudio com mesmo nome **somam**.
- [x] Silenciar a escuta do Main antes de usar Monitor no gravador. Referência do master: `live.gain~` **obj-107**, em **(261, 1184)**, entre os dois `p limiter` (posições atualizadas durante a montagem). Conferida no arquivo salvo a cadeia `loadmess` obj-125 → message box `-70` obj-140 → master; isso é atenuação de escuta, não garantia de mute digital absoluto.
- [x] Conferir também fontes em **`receive~ tapes_l`**, obj-105, (592, 977), e **`receive~ tapes_r`**, obj-106, (490, 977): seus caminhos chegam à saída por fora do master principal. Busca nos patches do projeto não encontrou sends com esses nomes; antes do lote, conferir que nenhum patch externo aberto os alimenta.
- [x] Não acrescentar ligações de áudio ao `sfrecord~ 9` antigo do Main para este experimento. A gravação nova é feita pelo `sfrecord~ 8` do gravador. Conferido: o objeto antigo recebe mensagens de controle existentes, sem sinais de áudio conectados.
- [x] Salvar o Main depois de conferir os novos fios. Receiver de entrada, bloco de habilitação, eco dos flags e inicialização do master conferidos no arquivo salvo.

## 2. `teia0.1/panSpace.maxpat`

Abra [panSpace](../teia0.1/panSpace.maxpat), também acessível pelo objeto **`panSpace` obj-124** do Main, em **(271, 534)**.

Os nove panners estão na mesma linha, **y = 505**, cada um logo abaixo de seu `receive~` em **y = 445**. Não mova nem recalcule os pans. Preserve os fios existentes até os outlets finais.

### 2A. Identificar as nove fontes

| Voz recebida | Receiver existente (ID; x, y) | `pan2` correspondente (ID; x, y) |
| --- | --- | --- |
| `receive~ glissan_1` | obj-48; (51, 445) | obj-188; (51, 505) |
| `receive~ glissan_2` | obj-47; (179, 445) | obj-1; (179, 505) |
| `receive~ glissan_3` | obj-46; (304, 445) | obj-2; (304, 505) |
| `receive~ cluster_1` | obj-51; (463, 445) | obj-3; (463, 505) |
| `receive~ cluster_2` | obj-50; (583, 445) | obj-4; (583, 505) |
| `receive~ cluster_3` | obj-49; (704, 445) | obj-5; (704, 505) |
| `receive~ extreme_1` | obj-54; (856, 445) | obj-6; (856, 505) |
| `receive~ extreme_2` | obj-53; (988, 445) | obj-7; (988, 505) |
| `receive~ extreme_3` | obj-52; (1120, 445) | obj-8; (1120, 505) |

### 2B. Criar seis envios, um por gesto/canal

Coloque cada par de sends abaixo do grupo de três panners correspondente, antes dos outlets finais na organização visual. Em cada `pan2`, **saída 1 = esquerda; saída 2 = direita**.

- [x] **`send~ teia_test_glissando_L`**: conecte as saídas **1** dos panners **obj-188, obj-1 e obj-2** ao inlet 1 desse único send.
- [x] **`send~ teia_test_glissando_R`**: conecte as saídas **2** dos mesmos três panners ao inlet 1 desse único send.
- [x] **`send~ teia_test_cluster_L`**: saídas **1** dos panners **obj-3, obj-4 e obj-5** → inlet 1.
- [x] **`send~ teia_test_cluster_R`**: saídas **2** dos mesmos três → inlet 1.
- [x] **`send~ teia_test_extreme_L`**: saídas **1** dos panners **obj-6, obj-7 e obj-8** → inlet 1.
- [x] **`send~ teia_test_extreme_R`**: saídas **2** dos mesmos três → inlet 1.
- [x] Comment sobre cada par: **`Post-pan stems, before limiters.`**
- [x] Conferir que nenhum send recebe outro gesto nem a voz original. Três fios de áudio no mesmo inlet fazem a soma daquele gesto/canal.
- [x] Preservar os fios existentes para outlet L **obj-19 (534, 720)** e outlet R **obj-20 (704, 720)**; a saída de performance continua funcionando.
- [x] Salvar panSpace.

**Não capturar de `teia_cal_L/R`.** No Main, esses sends (obj-38/45, y = 818) são alimentados depois do primeiro limiter. Os seis novos taps estão dentro de panSpace, antes dessa etapa. Os limiters existentes não precisam ser apagados.

## 3. `abstractions/gesture_weights.maxpat`

Abra [gesture_weights](../abstractions/gesture_weights.maxpat), o bpatcher do triângulo **obj-77** da interface, em **(474, 156)**.

**Ponto de entrada existente:** LCD **obj-15 (190, 411)** → **`t l l l` obj-21 (190, 627)**. Esse trigger já alimenta desenho e cálculo dos pesos.

- [x] Crie **`receive teia_test_triangle`** ao lado desse caminho, fora da área visível do LCD se preferir manter o tamanho da interface.
- [x] Crie **`t l l`**, **`expr 10.*$f1 + 190.*$f2 + 190.*$f3`**, **`expr 100.*$f1 + 10.*$f2 + 190.*$f3`** e **`pack f f`**.
- [x] Receiver → novo `t l l`.
- [x] Novo trigger **saída 2, direita** → inlet 1 do expr de **Y** (`10, 190, 190`) → **inlet 2** do pack.
- [x] Novo trigger **saída 1, esquerda** → inlet 1 do expr de **X** (`100, 10, 190`) → **inlet 1** do pack.
- [x] Pack saída 1 → inlet 1 de **`t l l l` obj-21 existente**. Mantenha também o fio LCD → obj-21.
- [x] Comment: **`Set triangle position from G/C/E weights.`**
- [x] Salvar a abstração. Não acrescente novos outlets: os três já existentes continuam G, C, E.

Teste local, sem rodar lote: uma message box temporária **`0.3333333333 0.3333333333 0.3333333333`** ligada ao novo `t l l` deve produzir aproximadamente **X = 100, Y = 130**, mover o ponto ao centro e atualizar os três pesos para 1/3.

- [x] Conferir centro e três pesos. Usuário confirmou o funcionamento visual; desconectar a mensagem temporária como limpeza ao passar à próxima seção.

**Não conectar só ao LCD:** mensagens de desenho não substituem o cálculo. **Não enviar diretamente a `wt-1/2/3`:** isso deixaria o ponto desenhado sem atualização.

## 4. `abstractions/density_weights.maxpat`

Abra [density_weights](../abstractions/density_weights.maxpat), o bpatcher estreito da interface **obj-4**, em **(823, 169)**.

**Referência existente:** slider **obj-1 (11, 8)** → **`t f f f` obj-2 (317, 492)**. O slider produz a posição 0..1; o trigger calcula os três pesos de densidade.

Esta é a única adaptação de portas que falta antes de centralizar o controle na interface: uma entrada para a posição e uma quarta saída para confirmar a posição aplicada. Não criar os receivers/sends de densidade propostos na versão anterior do checklist.

- [x] **37/101:** crie **`inlet`**, fora da área visível do bpatcher, por exemplo em **(100, 200)**. No **Inspector → Comment**, escreva **`Density position (0..1).`**. Acrescente um objeto `comment` ao lado com o mesmo texto.
- [x] Novo inlet saída 1 → inlet 1 do slider **obj-1**. Enviar normalmente, sem `set`, para atualizar o processamento e a interface visual.
- [x] Crie **`outlet`** à direita dos três atuais, por exemplo em **(800, 661)**. No **Inspector → Comment**, escreva **`Applied density position (0..1).`** e acrescente um objeto `comment` ao lado com o mesmo texto.
- [x] Slider saída 1 → novo outlet, em paralelo ao fio existente para obj-2. Essa saída carrega a posição 0..1, não um dos pesos calculados depois.
- [x] Nomeie os **três outlets existentes** pelo campo **Comment do Inspector**, conforme a tabela abaixo; preserve posições e fios.
- [x] Salvar a abstração; atualizar/reabrir a interface se necessário e conferir que o bpatcher **obj-4** mostra **uma entrada e quatro saídas**, com os três pesos na ordem original. Usuário confirmou as portas; a interface em disco ainda registra 0/3 nesta inspeção, portanto salvar a interface ao montar o bloco seguinte.

| Porta na interface | Objeto dentro da abstração | Inspector → Comment |
| --- | --- | --- |
| Inlet 1, novo | `inlet`, sugestão (100, 200) | `Density position (0..1).` |
| Outlet 1, existente | obj-6 (317, 661) | `Low density weight (0..1).` |
| Outlet 2, existente | obj-7 (462, 661) | `Medium density weight (0..1).` |
| Outlet 3, existente | obj-8 (612, 661) | `High density weight (0..1).` |
| Outlet 4, novo | `outlet`, sugestão (800, 661) | `Applied density position (0..1).` |

A configuração do Inspector é feita dentro da abstração, não na caixa do bpatcher na interface. Não digite `inlet @comment ...`: a referência local orienta usar o campo Comment do Inspector.

## 5. `abstractions/markov_engine.maxpat` — manter como está

**Nenhuma tarefa de montagem nesta seção.** A revisão do arquivo salvo mostrou que já existe ordem explícita para usar a segunda saída como confirmação na interface. Não acrescentar quarto outlet, triggers internos ou novos barramentos.

Em **`zl.reg` obj-37 (1267, 505)**, o fio de saída para **`t b l` obj-49 (1617, 449)** tem **order 0**; o fio para **`sprintf matrix ...` obj-9 (578, 650)** tem **order 1**. O primeiro ramo instala as transições em `ml.markov` e abre o gate interno via mensagem `1` obj-51 → gate obj-26. Somente depois o segundo ramo emite `matrix` e nove probabilidades pelo outlet **obj-95 (1396, 685)**.

Isso corrige a orientação anterior de que o ramo paralelo não garantia ordem: **no arquivo atual a ordem está explicitamente definida**. Preservá-la. O retorno ready da seção 6F será derivado de `matrix` na interface, após commit; não do comando Start ou de uma espera arbitrária.

| Porta existente do motor | Conteúdo |
| --- | --- |
| Outlet 1 — obj-94 (1145, 685) | Estado 0/1/2 |
| Outlet 2 — obj-95 (1396, 685) | `matrix` seguido das nove probabilidades |
| Outlet 3 — obj-96 (1612, 685) | Inputs do motor |

## 6. `abstractions/InterfaceToAbstractions.maxpat`

Abra a [interface usada pelos dois motores](../abstractions/InterfaceToAbstractions.maxpat). Monte os novos objetos em um bloco livre ao lado dos controles, preservando os fios existentes.

### 6A. Entrada de comandos e distribuição

- [x] Crie **`receive teia_test_control`** e **`route begin triangle density temperature permanence contrast clock_ms enabled commit clock`**.
- [x] Receiver saída 1 → route inlet 1.
- [x] Comment: **`Experiment control from recorder.`**

O route tem **dez saídas de comandos e uma última de mensagens não reconhecidas**. Conecte assim:

| Saída | Comando retirado pelo route | Destino |
| --- | --- | --- |
| 1 | begin | `t s b`, seção 6B |
| 2 | triangle | Novo `send teia_test_triangle` |
| 3 | density | **Inlet 1** do bpatcher density_weights **obj-4**, criado na seção 4 |
| 4 | temperature | Novo `t f f`, seção 6C |
| 5 | permanence | Slider **obj-34 (953, 183)**; saída já chega ao flonum obj-49 (953, 337) e `s permanencia` |
| 6 | contrast | Slider **obj-122 (1268, 216)**; saída já chega a `s contrast` |
| 7 | clock_ms | Novo objeto number, seção 6C |
| 8 | enabled | Novo `send teia_test_enabled` |
| 9 | commit | Novo `t b b`, seção 6F |
| 10 | clock | Toggle **obj-60 (1125, 261)** que alimenta `metro 500` obj-57 |
| 11 | sem correspondência | Deixar sem conexão para este piloto |

- [x] Criar **`send teia_test_triangle`** e **`send teia_test_enabled`** e fazer os fios da tabela, incluindo route saída 3 → novo inlet 1 do bpatcher **density_weights obj-4**.
- [x] Fazer os fios diretos de permanence, contrast e clock da tabela. Conferido no arquivo salvo: route saídas 5/6/10 → sliders obj-34/obj-122 e toggle obj-60; conexões originais dos controles preservadas.
- [x] Comments junto aos dois sends: **`Set gesture weights.`**, **`Set gesture enable flags.`**; junto ao caminho direto da densidade: **`Set density position.`**

### 6B. Begin: parar, fechar ready, depois distribuir o ID

- [x] Crie **`t s b`**, uma **message box `0`** e **`send teia_test_run_id`**.
- [x] Route saída 1 (`begin`) → `t s b`.
- [x] Trigger saída 2 (`b`) → message `0` → **toggle obj-60** e **inlet 1 dos dois gates de ready da seção 6F**. **Tarefa 51 concluída junto à 75:** obj-145 saída direita → message 0 obj-147 → gates obj-199/200 inlet esquerdo e toggle obj-60; todos conferidos em 20/10.
- [x] Trigger saída 1 (`s`) → `send teia_test_run_id`.
- [x] Comment: **`Stop clock, clear ready gates, then set run ID.`**

O lado direito dispara primeiro. Assim os prefixos da execução nova são configurados com o relógio parado e os ready fechados.

### 6C. Temperatura e intervalo do relógio

Referências de temperatura: slider **obj-35 (1059, 389)** → flonum **obj-63 (1059, 543)** → **`s temp` obj-89**. Posições atualizadas na conferência da tarefa 54; o usuário reorganizou a interface. Novos objetos: **t f f obj-151 (977, 230)**, expr **obj-152 (977, 262)**, prepend set **obj-153 (977, 298)**; comentário **obj-155**. O route **obj-90** está agora em **(1151, 304)**.

- [x] Para temperature, crie **`t f f`**, **`expr ($f1 - 0.05) / 1.95`** e **`prepend set`**.
- [x] Route saída 4 → novo `t f f`.
- [x] Trigger saída 2 → expr → `prepend set` → slider **obj-35**. Atualiza o desenho sem emitir uma nova temperatura.
- [x] Trigger saída 1 → flonum **obj-63**. Preserve flonum → `s temp`.
- [x] Comment: **`Set temperature in output units.`**

O piloto envia temperatura 1 ao flonum. A posição bruta do slider será aproximadamente 0,48718, porque seu offset/multiplicador atuais são 0,05/1,95.

Referências do relógio, atualizadas após a reorganização: toggle **obj-60 (1130, 467)** → **`metro 500` obj-57 (1130, 506)**.

- [x] Crie um objeto **number** visível junto ao metro; Comment **`Markov clock interval (ms).`** Conferidos number **obj-158 (1130, 389)** e comment **obj-161**.
- [x] Route saída 7 (`clock_ms`) → number inlet 1 → **inlet 2, direito, do metro obj-57**.
- [x] Reserve uma derivação da saída desse number para o eco `clock_ms` da seção 6E. **Tarefa 61 concluída em 20/10 junto à 70:** number obj-158 → s MarkClock obj-179; r MarkClock obj-182 → prepend obj-157. Ligação number → inlet direito de metro preservada.

### 6D. Retorno central e ID para os prefixos

- [x] Crie **`send teia_test_status`** no bloco de retornos da interface. Os retornos podem compartilhar esse único send: várias mensagens podem entrar nesse mesmo objeto.
- [x] Crie **`receive teia_test_run_id`** perto desse bloco; sua saída atualizará todas as message boxes de prefixo descritas a seguir.
- [x] Comments: **`Recorder status and state events.`**; **`Current experiment run ID.`**

### 6E. Seis ecos de parâmetros na interface

O sétimo eco, `enabled`, foi montado no Main, seção 1C.

**Para cada linha desta tabela**, crie uma message box com o texto indicado e um objeto separado **`prepend applied`**. O receiver de ID da seção 6D alimenta as seis message boxes; cada uma configura seu próprio prepend. A fonte real do parâmetro entra no mesmo prepend. A saída de cada prepend chega ao `send teia_test_status` central.

| Parâmetro | Fonte real para a entrada de dados do prepend | Message box que configura o prefixo |
| --- | --- | --- |
| triangle | Pack obj-169: **r wt-1 obj-189 / r wt-2 obj-187 / r wt-3 obj-184** → inlets 1/2/3. Esses buses vêm dos pesos reais do bpatcher via flonums/sends existentes. Preserve processamento e desenho. | `set applied $1 triangle` |
| density | Nova **saída 4** do bpatcher **density_weights obj-4**, posição realmente aplicada | `set applied $1 density` |
| temperature | Saída 1 do flonum **obj-63 (1059, 543)**, acima de `s temp` | `set applied $1 temperature` |
| permanence | Saída 1 do flonum **obj-49 (958, 543)** | `set applied $1 permanence` |
| contrast | Saída 1 do slider **obj-122 (1273, 422)**, no domínio 0..1 | `set applied $1 contrast` |
| clock_ms | Saída 1 do novo number de intervalo da seção 6C | `set applied $1 clock_ms` |

- [x] Montar o pack e o eco **triangle**; Comment **`Report applied gesture weights.`** Usar um **novo pack**, separado do pack obj-75 já usado por outro processamento. Fonte: pesos reais do gesture_weights. Refatoração conferida em 20/10: pesos → flonums → s wt-1/2/3 existentes; r wt-1 obj-189, r wt-2 obj-187 e r wt-3 obj-184 → inlets 1/2/3 do pack obj-169, sem fios diretos duplicados. Receiver de ID obj-163 → message `set applied $1 triangle` → prepend applied; novo pack → mesmo prepend → send de status obj-162.
- [x] Ligar a nova **saída 4** do bpatcher **density_weights obj-4** ao prepend do eco **density**; Comment **`Report applied density position.`**
- [x] Montar o eco **temperature**; Comment **`Report applied temperature.`**
- [x] Montar o eco **permanence**; Comment **`Report applied permanence.`**
- [x] Montar o eco **contrast**; Comment **`Report contrast control value.`** Conferido no arquivo salvo em 20/10: prepend obj-132, message obj-149 e comentário obj-156; fonte/prefixo/status corretos, s contrast preservado.
- [x] Montar o eco **clock_ms**; Comment **`Report applied clock interval.`** Conferidos prepend obj-157, message `set applied $1 clock_ms` obj-164, comentário obj-165 e prefixo do ID; entrada via r MarkClock obj-182.

Padrão de montagem, repetido para cada parâmetro:

```text
receive teia_test_run_id
          |
[set applied $1 temperature]       ← message box do parâmetro
          |
          v
prepend applied  <---------------- flonum obj-63, saída 1
          |
send teia_test_status
```

Todos os fios chegam ao inlet 1 dos objetos mostrados nesse padrão. Não conecte a message box de `set` diretamente ao send: ela serve para atualizar o prefixo do prepend, não para enviar o eco.

**Contraste:** eco e script usam 0..1. O `scale 0. 1. 0.5 2.` existente, obj-123 em (1703, 1018), converte para expoente 0,5..2. Portanto, máximo = **1 enviado/confirmado**, não 2.

### 6F. Dois retornos ready e comando commit

**Tarefa 71 conferida em 20/10:** route de gestos obj-62 → s matrixGestos obj-193 / r matrixGestos obj-195 → t b obj-191 (596, 1386); route de densidade obj-1 → s matrixDensity obj-194 / r matrixDensity obj-196 → t b obj-192 (719, 1386). Comentário obj-198 é um objeto **comment**, não message. Unpacks existentes preservados. Nas tarefas 73–74, manter esses trechos sem fio e ligar cada t b ao gate correto.

**Conferência de 72–74:** gates obj-199/200 criados, comentário obj-202 correto. Os fios de t b foram corrigidos e agora entram nos inlets **direitos** dos gates; nenhum fio desses bangs permanece à esquerda. Coordenadas atuais: t b gestos obj-191 (1801, 466), gate gestos obj-199 (1801, 502); t b densidade obj-192 (1924, 466), gate densidade obj-200 (1924, 502). Inlets esquerdos aguardam controle 0/1.

Referências dos motores:

| Motor | Objeto existente | Posição | Estado já sai por |
| --- | --- | --- | --- |
| Gestos | `markov_engine` **obj-37** | (354, 572) | Saída 1 → flonum obj-47 → `s g_state` obj-30 (354, 663) |
| Densidade | `markov_engine` **obj-22** | (1109, 564) | Saída 1 → flonum obj-16 (1109, 619) → três sends `*_den` |

- [x] Localize os **dois `route matrix` já existentes** (gestos **obj-62**, densidade **obj-1**) e crie **dois `t b`**, um por motor, para converter cada relatório de matriz em um bang. Preserve routes → unpacks da visualização e derive uma conexão adicional para o novo t b. Comment junto aos pares: **`Matrix installed; engine ready.`**
- [x] Crie **dois objetos `gate 1 0`**, um perto de cada motor. Comment junto a ambos: **`Allow ready replies after commit.`**
- [x] Motor G **saída 2** → seu `route matrix` → **saída 1, correspondente a matrix** → seu `t b` → **inlet 2, direito**, do gate de gestos. Preserve os fios existentes da saída do motor.
- [x] Motor densidade **saída 2** → seu `route matrix` → **saída 1, correspondente a matrix** → seu `t b` → **inlet 2, direito**, do gate de densidade. Preserve os fios existentes da saída do motor.
- [x] A message `0` da seção 6B deve chegar ao **inlet 1** dos dois gates. Conferida a mesma obj-147 nos três destinos (dois gates e relógio); pendência 51 concluída.

Para a resposta de gestos:

- [x] Crie message boxes **`set ready $1 gesture`** e **`ready pending gesture`**.
- [x] `receive teia_test_run_id` da seção 6D → primeira message box → inlet 1 da segunda. O `set` substitui seu texto sem emitir resposta.
- [x] Novo gate de gestos saída 1 → inlet 1 da message box **`ready pending gesture`**. Seu bang emite o texto guardado, já com o ID real.
- [x] Essa segunda message box → `send teia_test_status` central.
- [x] Comment: **`Gesture matrix installed.`**

Para a resposta de densidade:

- [x] Repita com **`set ready $1 density`** e **`ready pending density`**, usando o gate do motor de densidade e o mesmo receiver de ID/send de status.
- [x] Comment: **`Density matrix installed.`**

Para commit:

**83–86 concluídas e conferidas:** t b b obj-216, message 1 obj-218, s/r commitBang obj-221/222 e Start obj-51. Agora saída direita → message 1 → inlets esquerdos dos gates; saída esquerda → s commitBang; r commitBang → Start preservado. Nenhum dos dois fios antigos incorretos permanece. Os gates abrem antes do bang de Start.

- [x] Crie **`t b b`** e uma **message box `1`**. Route saída 9 (`commit`) → trigger.
- [x] Trigger saída 2 (`b`, direita) → message `1` → inlet 1 dos dois novos gates de ready.
- [x] Trigger saída 1 (`b`, esquerda) → message box de Start **já existente obj-51**, em **(287, 1105)**, cujo texto é:

```text
;
m_engine_1 start;
m_engine_2 start;
```

- [x] Comment: **`Arm ready replies, then start both engines.`**

**Não confundir IDs:** obj-51 da interface é a mensagem que inicia os dois motores; obj-51 dentro de markov_engine é a mensagem `1` da seção 5. São objetos de arquivos diferentes.

### 6G. Eventos das duas cadeias

- [x] Crie **`receive g_state`** perto do bloco de status, ou perto de `s g_state` **obj-30 (354, 663)**. Esse nome é um bus antigo, mantido exatamente como está.
- [x] Novo receiver → **`prepend state gesture`** → `send teia_test_status` central.
- [x] Comment: **`Log gesture state changes.`**
- [x] Derive um fio da **saída 1** do motor de densidade **obj-22 (1148, 1295)** → novo **`send teia_test_density_state`**. No bloco de status: novo **`receive teia_test_density_state`** → novo **`prepend state density`** → `send teia_test_status` central. Preserve motor → flonum obj-16 e os sends de densidade existentes. O barramento dedicado permite manter os blocos sem fio longo, sem mudar o protocolo recebido pelo gravador.
- [x] Comment: **`Log density state changes.`**
- [x] Não usar `receive m_state` para esse retorno: ele não é a fonte efetiva da densidade no patch inspecionado.
- [x] Salvar a interface depois de conferir todos os destinos do route e os prefixos.

## 7. `tests/dataset_recorder.maxpat` — já montado

Abra o [gravador](dataset_recorder.maxpat) em modo de edição para localizar os objetos abaixo. **Não duplique** esses sends/receives.

| Já existe | Objeto | ID | Posição |
| --- | --- | --- | --- |
| [x] | `send teia_test_control` | control-send | (410, 270) |
| [x] | `receive teia_test_status` | status-receive | (1010, 270) |
| [x] | `send~ teia_test_input` | input-send | (430, 440) |
| [x] | `receive~ teia_test_glissando_L` | glissando-L-receive | (20, 1160) |
| [x] | `receive~ teia_test_glissando_R` | glissando-R-receive | (180, 1160) |
| [x] | `receive~ teia_test_cluster_L` | cluster-L-receive | (370, 1160) |
| [x] | `receive~ teia_test_cluster_R` | cluster-R-receive | (530, 1160) |
| [x] | `receive~ teia_test_extreme_L` | extreme-L-receive | (720, 1160) |
| [x] | `receive~ teia_test_extreme_R` | extreme-R-receive | (880, 1160) |

Os seis receivers já alimentam os canais de stems e a soma com correções. O monitor está separado da gravação. Comments já existentes explicam canais, controles e operação; não é preciso acrescentar nenhuma ligação externa aqui.

## 8. Patches que não precisam de novos sends/receives

- **`teia0.1/glissan.maxpat`, `cluster.maxpat`, `extreme.maxpat`**: já recebem `entrada`, `on_*`, `vol_*` e `*_den`, e já enviam as vozes ao panSpace. O ganho fixo de calibração fica no gravador; não inserir um segundo offset nesses patches agora.
- **`tests/dataset_player.maxpat`**: preservar o teste independente que já funcionou.
- **`tests/audio_calibration.maxpat`**: não ampliar MuBu nem deslocar seus taps antigos para realizar este piloto. A análise dos dados gravados será offline em Python.
- **`_main.maxpat` e `Interface.maxpat` da raiz**: não são os arquivos-alvo deste checklist.

## 9. Conferência antes do primeiro lote

- [x] Todos os patches/abstrações modificados acima estão salvos. O gravador registra hashes dos arquivos em disco, não de edições pendentes no Max.
- [x] Apenas um Main, uma interface e um gravador estão abertos para estes barramentos públicos; nenhuma segunda instância está somando áudio/comandos.
- [x] DSP em **48000 Hz**. Entradas concorrentes e escuta do Main desligadas.
- [x] Os seis meters recebem os gestos corretos. Para conferir só os taps antes do bridge completo, pode usar temporariamente a reprodução já existente do Main; pare-a antes do lote. **Start batch exige todas as confirmações.** **Parcial em 20/10:** glissando isolado ([1,0,0]) confirmado por escuta e arquivos da sessão 124241208Z: mistura = canais 3–4, canais 5–8 zerados. Cluster [0,1,0] também confirmado na sessão 124520641Z: mistura = canais 5–6, demais stems zerados, escuta correta. Extremo conferido abaixo; restaurar [1,1,1] antes da tarefa 101. **Extremo confirmado na sessão 124724322Z:** mistura = canais 7–8, 3–6 zerados, escuta correta. Três pares identificados; tarefa concluída.
- [x] Ao iniciar o piloto, chegam **sete ecos** `applied`: triangle, density, temperature, permanence, contrast, clock_ms e enabled; chegam também **dois ready**, gesture/density, com o ID real da execução.
- [x] O gravador só começa depois dessas respostas, de **600 ms para estabilizar as rampas de ganho de 500 ms** e da confirmação de leitura do áudio. Antes de cada configuração também há 3 s de preparação em silêncio.
- [x] Dois WAVs de oito canais e seus dois JSONs são gerados: 10 s de entrada + 3 s de cauda por arquivo, sem dry/limiter no novo caminho.
- [ ] Conferir Stop durante entrada/cauda/preparação e reinício pelo primeiro arquivo; verificar pan, cauda e mistura reconstruível pelos stems, conforme o [guia](dataset_recorder_setup.md). **Parte técnica concluída em 20/10:** preparação sem WAV (171128472Z), entrada parcial 6,538667 s (171301922Z) e cauda parcial 10,688 s (171629950Z), interrompidos sem avanço; reinício pelo Original/ponta G confirmado. WAVs parciais íntegros e reconstrução com erro zero. Resta confirmação musical do pan/suficiência da cauda; não marcar toda a caixa apenas pelos testes de Stop.

**Limites conhecidos:** controles fixos não congelam os sorteios/urnas/modulações nem limpam completamente atrasos. Ready confirma a instalação da matriz, não um reset integral. Tempos de eventos são do scheduler; os oito canais compartilham a captura, mas não se promete alinhamento amostral entre arquivo de entrada e saída através de send~/receive~.

## Base desta conferência

Patches acima e `dataset_recorder.js/json` relidos em 19/10/2026. Referências locais do Max 8.5.2 consultadas: `send~`, `receive~`, `send`, `receive`, `route`, `trigger`, `gate`, `pack`, `unpack`, `expr`, `prepend`, `message`, `slider`, `inlet`, `outlet`, `bpatcher` e `sprintf`. A documentação confirma soma dos sends de áudio com mesmo nome, ordem direita→esquerda dos triggers, inlet direito de dados do gate e mensagens `set` usadas nos prefixos.

**Nenhum fio deste checklist nos patches da TEIA/interface foi montado pelo assistente.** Tarefas 1–93 conferidas nos arquivos; 94–96 confirmadas pelo usuário; 98–100 confirmadas pelo piloto real e arquivos de 20/10. **Progresso: 100/101.** Tarefa 97 concluída pelos três testes isolados de 20/10; apenas 101 permanece aberta. A versão 1.1.1 e os picos/JSONs já foram validados em execução real; a identificação da 97 está concluída e os testes de Stop/escuta da 101 continuam pendentes.
