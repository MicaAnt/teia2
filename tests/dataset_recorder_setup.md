# Gravador de experimentos — montagem e piloto

## Estado atual — gravações concluídas; notebook de estudo entregue

Lote 1 validado como 47 + 4 condições. Lote 2 validado como 16 originais + 52 da recuperação `dataset_v1_batch2_recovery__20261020T184229342Z`, total de 68 condições distintas. Manter sessões/pastas separadas, inclusive os registros interrompidos. **Não repetir automaticamente os lotes ou recuperações.**

Próximo trabalho: abrir [audio_analysis.ipynb](audio_analysis.ipynb), kernel TEIA Curadoria (.venv), Seagate conectado. Notebook autocontido em inglês, dez entradas e trinta transformações conferidas, um exemplo exibido por vez. Usuário deve ouvir/inspecionar e discutir antes de novas medidas ou ajustes no patch. Detalhes no [handoff](../_horsProject/handoff-2026-10-20.md). As instruções abaixo são históricas.

## Histórico — recuperação do lote 2, gravador 1.2.2

Após reconectar o Seagate, auditoria validou os **16 primeiros runs** da sessão `dataset_v1_batch2__20261020T182745747Z`. Run 17 tem WAV íntegro, mas JSON sem conclusão/telemetria final; será repetido, com original preservado. Runs 18–68 ausentes. Recuperação preparada para **52 condições**, mesmos parâmetros/ganhos, pasta separada `TEIA_Dataset/batch2_recovery/` (aproximadamente 1,04 GB).

1. Fechar somente o gravador **sem salvar a janela antiga sobre a edição externa** e reabrir `tests/dataset_recorder.maxpat`.
2. Conferir **1.2.2**, clicar **Load recovery 2** e conferir **52 runs loaded** e destino `/Volumes/Seagate Basic/TEIA_Dataset/batch2_recovery/`.
3. Com DSP **48 kHz**, mesmas fontes isoladas/ganhos, clicar **Start batch**. Tempo mínimo **14min23s mais I/O**. Começa em `cello_percussivo__02.wav`, centro geral, antigo run 17. Não usar Load batch 2 para retomar.
4. Depois conferir com o comando abaixo; com várias sessões, acrescentar `--session <id_exato>`.

```bash
soundSamples/.venv/bin/python tests/dataset_batches.py check --config tests/dataset_recorder_batch2_recovery.json
```

Fontes/hashes, espaço, escrita/leitura da nova pasta e sequência simulada conferidos; execução sonora da recuperação ainda pendente. Somar logicamente 16 originais + 52 recuperações, mantendo sessões separadas. Nenhum patch da TEIA alterado. O usuário desligou backup automático após perceber tentativa do Time Machine; hipótese registrada, causa não demonstrada. Detalhes no [handoff atual](../_horsProject/handoff-2026-10-20.md). Esta seção prevalece sobre as instruções históricas abaixo.

## Histórico — preparação do lote 2 dos centros

Usuário fará uma pausa e depois iniciará o lote 2 para ouvir/anotar. Configuração, 17 fontes/hashes, 68 runs e quatro pontos por entrada reconferidos; pasta `/Volumes/Seagate Basic/TEIA_Dataset/batch2/` com montagem, espaço e escrita/leitura verificados novamente. Manter os mesmos parâmetros/ganhos do lote 1; não aplicar calibração, filtros ou novos descritores agora.

No gravador **1.2.1** já aberto: **Load batch 2 → conferir 68 runs loaded e destino batch2 → Start batch**, com DSP em **48 kHz**. Aproximadamente **19 min mais I/O**, 68 WAVs/JSONs, 13 s cada, oito canais float32. Não é necessário atualizar o patch nesta etapa e o assistente não inicia o lote. Conferir a nova sessão depois da execução.

Para as notas, registrar o contador n/68 e Current file. Preservar separadas as observações de pouca presença, nível baixo quando presente e coloração/apreciação. Bark fica como alternativa posterior, somente se os descritores atuais forem insuficientes; pesquisa no [plano de análise](../_horsProject/plano-analise-audio.md).

## Estado mais recente — lote 1 completo e notas de escuta

Usuário executou a recuperação e os quatro pares reais da sessão `dataset_v1_batch1_recovery__20261020T175425246Z` passaram na conferência. Junto dos 47 originais, cobrem exatamente as **51 condições do lote 1**, sem duplicatas. Sessões/pastas preservadas separadamente. Não repetir automaticamente a recuperação. Lote 2 dos centros ainda sem gravações na pasta conferida.

Impressões qualitativas e hipóteses registradas em [escuta qualitativa](../_horsProject/escuta-qualitativa-dataset.md). Nenhum ganho/filtro/limiter foi alterado. A seção de recuperação abaixo conserva as instruções como referência operacional; a execução já foi concluída e validada.

## Retomada atual — recuperação do lote 1, versão 1.2.1

Seagate recuperou acesso após ejeção/reconexão. A auditoria real passou em **47 gravações** do lote 1; faltam 48–51. Nenhum pico acima de 0 dBFS; dois acima da margem de −3 dBFS, preservados para análise. Não repetir o lote inteiro.

Fechar somente o gravador antigo **sem salvar por cima da edição externa**, reabrir, conferir **1.2.1**, clicar **Load recovery 1** e conferir **4 runs loaded**. **Start batch** executa somente as quatro faltantes em `/Volumes/Seagate Basic/TEIA_Dataset/batch1_recovery/`, aproximadamente 1min07s + I/O. Mesmos parâmetros/ganhos, sem alterar áudio ou o lote original.

Depois: `soundSamples/.venv/bin/python tests/dataset_batches.py check --config tests/dataset_recorder_batch1_recovery.json`. Com várias sessões, acrescentar `--session <id>`. A recuperação está preparada/simulada, mas ainda não executada no Max. Conferir a cobertura das 51 condições juntando logicamente 47 originais + quatro recuperadas antes do lote 2. Detalhes no [handoff atual](../_horsProject/handoff-2026-10-20.md).

## Estado atual — piloto externo validado e dois lotes preparados

**Esta seção prevalece sobre as instruções históricas abaixo.** O usuário executou o piloto no Seagate; Python conferiu os dois WAVs/JSONs da sessão **pilot_v1__20261020T170115049Z** diretamente no disco externo: 13 s/oito canais/48 kHz/float32, registros completos, parâmetros/fontes corretos, valores finitos e mistura reconstruível. Maiores picos −14,06 e −15,11 dBFS. A análise Python pode ler os áudios diretamente de lá, sem cópia para o disco interno.

Gravador **1.2.0** preparado, com os botões novos **Load batch 1** e **Load batch 2**. **Load experiment** continua carregando o piloto Original/Cassol; abrir o patch não inicia gravação. Fechar a janela antiga sem salvar por cima da edição externa e reabrir para atualizar o JS (`autowatch = 0`). Main/interface permanecem abertos e sem alterações.

| Botão | Experimento | Capturas | Pasta no Seagate | Tempo mínimo |
|---|---|---:|---|---|
| Load experiment | dataset_recorder.json — piloto | 2 | TEIA_Dataset/pilot/ | 33 s + I/O |
| Load batch 1 | dataset_recorder_batch1.json — três pontas | 51 | TEIA_Dataset/batch1/ | 14min07s + I/O |
| Load batch 2 | dataset_recorder_batch2.json — centro geral e centros locais | 68 | TEIA_Dataset/batch2/ | 18min49s + I/O |

Os dois lotes foram preparados e simulados; **ainda não foram executados no Max**. Pastas externas criadas e escrita/espaço/fontes/hashes conferidos. Preservar 10 s + 3 s de cauda, parâmetros e ganhos iguais nos dois lotes. Três gestos são capturados simultaneamente, junto da mistura. Nenhuma nova ligação na TEIA/interface.

### Ordem de execução

1. Conferir versão **1.2.0**, DSP 48 kHz e isolamento das outras fontes. Manter volume de escuta independente.
2. **Load batch 1** deve mostrar **51 runs loaded**, experiment_id `dataset_v1_batch1` e a pasta externa `batch1`.
3. **Stop/reinício já conferidos no Max:** preparação sem WAV, entrada com WAV parcial de 6,538667 s e cauda com WAV parcial de 10,688 s. Todos interrompem sem avançar e reiniciam pelo primeiro arquivo. Parciais finitos, oito canais/48 kHz/float32 e soma correta; registros no handoff. Testes preservados em sessões separadas. Avaliação musical do pan/cauda continua pendente para encerrar integralmente a tarefa 101.
4. Executar o lote 1 completo; conferir seus arquivos antes do lote 2.
5. **Load batch 2** deve mostrar **68 runs loaded** e a pasta `batch2`; iniciar depois da conferência do lote 1.

O carregamento é bloqueado durante gravação/finalização. Cada reinício cria uma sessão nova e começa no primeiro arquivo. Não há retomada automática do ponto de parada. Os novos JSONs guardam nome/hash do experimento carregado; o preflight lê/hasha cada fonte uma vez, mesmo com três/quatro pontos por fonte.

### Preparação e conferência em Python

O helper não calcula descritores, inicia Max ou altera áudio. A partir da raiz:

```bash
soundSamples/.venv/bin/python tests/dataset_batches.py prepare --config tests/dataset_recorder_batch1.json
soundSamples/.venv/bin/python tests/dataset_batches.py check --config tests/dataset_recorder_batch1.json
soundSamples/.venv/bin/python tests/dataset_batches.py prepare --config tests/dataset_recorder_batch2.json
soundSamples/.venv/bin/python tests/dataset_batches.py check --config tests/dataset_recorder_batch2.json
```

Sem `--config`, usa o piloto. Com várias sessões na pasta, `check` exige `--session <id_exato>`. Uma sessão explicitamente escolhida não é confundida com testes interrompidos ou registros históricos inválidos de outras sessões.

`prepare` verifica fontes/hashes, montagem, espaço e escrita/leitura temporária; cria apenas a pasta configurada. Se o disco estiver ausente, falha sem criar um destino no disco interno. `check` verifica completude, ordem, parâmetros, fonte/manifesto, duração, formato, canais, valores finitos, picos e reconstrução da mistura; imprime relatório/hashes sem alterar arquivos. Nas novas sessões, confere também o hash do JSON de experimento. Excesso de −3/0 dBFS gera flags sem normalização. Escuta/cauda continuam exigindo avaliação humana.

**Verificação:** 26 cenários simulados do controlador passaram, incluindo os 51 e 68 runs na ordem correta, seleção de JSON, bloqueio de troca durante execução e hash único por fonte. Dez testes do helper passaram; o piloto externo real também passou na leitura pelo Python. A versão 1.2.0 e os dois lotes completos ainda precisam de execução nativa. Se surgir erro de acesso, registrar texto exato e diagnosticar; não há fallback silencioso para o disco interno.

Protocolo e pendências no [handoff atual](../_horsProject/handoff-2026-10-20.md).

## Histórico de validação e desenvolvimento

**Atualização de 20/10/2026:** o usuário confirmou que o piloto funcionou. Os dois WAVs/JSONs reais foram conferidos em Python: 13 s, oito canais, 48 kHz, float32, valores finitos e mistura reconstruível. **100/101 tarefas concluídas**: 97 fechada pelos testes isolados de glissando/cluster/extremo; resta 101 (Stop/reinício, pan e cauda). O [checklist de sends/receives](dataset_recorder_wiring_checklist.md) conserva a montagem manual; a atualização 1.1.0 abaixo altera apenas o gravador. Detalhes no [handoff](../_horsProject/handoff-2026-10-19.md).

Estado: gravador experimental preparado para Max **8.5.2**. A ligação com a TEIA/interface é manual. A criação deste gravador não autoriza alterações automáticas nesses patches.

O player anterior permanece separado. O gravador não usa MuBu; reprodução, temporização e gravação usam `buffer~`, `play~`, `delay` e `sfrecord~`. O controlador `dataset_recorder.js` cuida do experimento, arquivos, confirmações e JSONs. Não usa Node nem agenda áudio com JavaScript.

**Correção 1.0.1 (20/10), confirmada pelo piloto:** o primeiro Start foi bloqueado ao ler fingerprints. O controlador passou a usar blocos de 4 KB e informar arquivo/posição em falhas. O usuário conseguiu executar o lote; não retirar as verificações de hash nem alterar os bridges para esse erro.

## Correção de integridade — versão 1.1.1

O painel 1.1.0 rodou no Max segundo o usuário, mas a conferência encontrou os dois JSONs dessa rodada truncados em 32767 bytes, no meio dos eventos de ganho. Os WAVs passaram (13 s, oito canais, float32, finitos e reconstrução correta), mas os registros completos de picos/volumes dessa sessão não podem ser considerados validados.

A 1.1.1 grava JSON em blocos de 4096 caracteres ASCII (Unicode escapado), confere avanço/tamanho e relê/compara o objeto após fechar. Nenhum evento foi descartado. Sintaxe e 23 cenários simulados passaram, incluindo 2500 eventos, Unicode e truncamento por chamada. **Correção confirmada nativamente na sessão 20261020T123557727Z:** os dois JSONs completos têm 198617/227393 bytes; oito canais observados, picos consistentes com os WAVs float32, alvos/eventos presentes, parâmetros/hashes e soma corretos. Nenhuma nova falha encontrada nesses registros.

Feche a janela antiga do gravador sem salvar sobre a edição externa, reabra e confira o título **1.1.1**. Load experiment → Start batch, apenas os dois arquivos do piloto. Conferir novos JSONs completos e picos contra as amostras do WAV. Arquivos inválidos da sessão anterior foram preservados; não são corrigidos retroativamente. Não é necessário mudar a TEIA/interface.

## Painel e picos — versão 1.1.0

**Feche a janela antiga do gravador sem salvar por cima do arquivo atualizado e reabra `dataset_recorder.maxpat`.** O controlador usa `autowatch = 0`. Não é necessário refazer ligações da TEIA/interface. O título deve mostrar **1.1.1** (correção de escrita descrita acima). Carregue o experimento e rode novamente os dois arquivos para validar este painel no Max.

- **Requested / Confirmed by TEIA:** sete parâmetros lado a lado. Ao carregar, Requested mostra os defaults; em cada execução, inclui os overrides daquela execução. Confirmed fica aguardando até chegar o eco correto com o ID da execução. Estes mostradores não controlam a interface.
- **Recorder calibration gains / Input stimulus gain:** mantêm os controles existentes. Correções por gesto atuam apenas na mistura dos canais 1–2; input gain atua no estímulo enviado à TEIA. Não há ajuste automático de nível.
- **TEIA gain targets:** recebe `volRelG/C/E` em dB. Mostra alvos de controle antes das rampas e demais processamentos, não o ganho instantâneo medido do áudio. Waiting/Not observed significa que esta instância ainda não recebeu uma atualização do barramento; não equivale a zero ou mute. Esses receives não solicitam nem alteram parâmetros da TEIA.
- **Gesture/Density state:** índices 0/1/2 recebidos do bridge. A temporização da execução também aparece no painel. Meters da mistura complementam os seis meters dos stems.
- **Run maximum sample peaks:** oito máximos em dBFS, L/R da mistura e de cada gesto, medidos sobre os mesmos sinais enviados a `sfrecord~`, antes do monitor. Atualizam durante entrada/cauda e ficam visíveis depois de Stop/fim. Novo Load ou nova execução limpa a indicação.
- **Avisos persistentes por execução:** acima de −3 dBFS indica margem reduzida; acima de 0 dBFS indica excesso de nível. Não se aplica limiter, compressor, normalização ou atenuação automática. Um pico acima de 0 não prova recorte do float32; um pico abaixo de 0 não prova ausência de distorção anterior. Relatórios não finitos ou canais sem telemetria geram aviso próprio.

O JSON de cada nova execução inclui `peak_monitor`, com máximo linear/dBFS, observação e contagem de relatórios por canal, flags de margem/excesso e limitações; inclui também `initial_gain_targets_db` e `gain_target_events` com mudanças observadas durante entrada/cauda. `peak_dbfs: null` representa silêncio ou ausência de observação, distinguíveis por `observed`. Os arquivos antigos não foram alterados retroativamente.

**Implementação e limite:** oito `peakamp~` com polling compartilhado de 100 ms. Reset fecha gates antes de descartar o histórico anterior; start abre os gates antes do polling; Stop/fim interrompe polling e solicita o intervalo final. Retornos passam por `deferlow`, inclusive os alvos de ganho, evitando retorno direto ao JS durante envio de comandos. Fronteiras são controladas pelo scheduler; não são medidas true peak. A documentação do Max 8.5.2 condiciona a precisão amostral de `peakamp~` ao Scheduler in Audio Interrupt. A conferência exata das amostras do WAV continua offline, sem exigir mudança dessas preferências para este painel.

**Verificação da 1.1.0:** sintaxe JS, grafo/portas, preservação de todos os fios e cores anteriores, oito taps nos inlets corretos do gravador e 22 cenários simulados passaram. Os quatro cenários novos cobrem painel/eco, máximo absoluto/avisos/finalização, reset/telemetria ausente e eventos de ganho. Isso não executa o DSP do Max. O usuário confirmou a execução/painel da 1.1.0 no Max; seus JSONs foram encontrados truncados na validação posterior. **Escrita 1.1.1 e comparação dos picos online/offline confirmadas** na sessão 20261020T123557727Z. A 97 foi concluída pelos três testes isolados; resta Stop/reinício e escuta de pan/cauda (101).

## 1. O que o piloto faz

Abra `dataset_recorder.maxpat` depois de montar as ligações abaixo. Não há autoplay. O JSON fornecido toca `Original.wav` e `somax_cassol__01.wav`, ambos desde o início, com 10 segundos de entrada e 3 segundos adicionais de gravação. Antes de cada configuração há pelo menos 3 segundos de entrada/relógio parados. Depois dos ecos/ready, `settle_ms: 600` aguarda as rampas de ganho de 500 ms já existentes na interface, antes de carregar e tocar. Preparação, estabilização, carregamento e fechamento somam tempo ao lote.

Parâmetros iniciais: pesos G/C/E iguais, densidade 0,5, temperatura 1, permanência 0,5, contraste **1 no controle** (expoente efetivo 2), relógio 500 ms, gestos habilitados, entrada em 0 dB e correções em 0 dB.

Cada execução produz um WAV de oito canais a 48 kHz, float32, e um JSON de mesmo nome em `recordings/`. O nome inclui experimento, sessão com data UTC e ID da execução. Nenhum arquivo de uma sessão anterior é sobrescrito. Ao parar, arquivos parciais são mantidos e identificados como `interrupted`.

| Canais | Conteúdo |
| --- | --- |
| 1–2 | Mistura estéreo com as três correções do gravador |
| 3–4 | Glissando estéreo antes dessas correções |
| 5–6 | Cluster estéreo antes dessas correções |
| 7–8 | Extremo estéreo antes dessas correções |

“Antes da correção” preserva os volumes dinâmicos e o pan da TEIA. Os ganhos da interface não são substituídos. A mistura é `G × 10^(gain_G/20) + C × 10^(gain_C/20) + E × 10^(gain_E/20)`, por canal. Não há dry, limiter ou normalização nessa soma.

## 2. Entrada — alteração manual no Main

Em `teia0.1/_main_teia0.1.maxpat`, acrescente:

```text
receive~ teia_test_input
    ↓
send~ entrada
```

O `send~ entrada` já existe: pode ligar o novo receiver a ele. Isso não desliga as fontes antigas: sends de mesmo nome somam. Durante o teste, pare os players existentes, desative a entrada ADC e a síntese FM e confira que só o gravador alimenta `entrada`.

O gravador não envia o original a `voice1`; ele só alimenta os processamentos. A escuta do Main deve ser silenciada para não somar ao monitor do gravador. Alterar o master de escuta do Main não altera os novos pontos de captura. Confira também eventuais caminhos de tapes que chegam separadamente ao DAC.

## 3. Captura — alteração manual em panSpace

Em `teia0.1/panSpace.maxpat`, mantenha os `pan2` e todas as conexões atuais. Acrescente seis `send~`, recebendo as saídas dos panners abaixo. Várias conexões de sinal no mesmo inlet somam.

| Objetos existentes | Saídas esquerdas → novo objeto | Saídas direitas → novo objeto |
| --- | --- | --- |
| `pan2` obj-188, obj-1, obj-2 — glissan_1/2/3 | `send~ teia_test_glissando_L` | `send~ teia_test_glissando_R` |
| `pan2` obj-3, obj-4, obj-5 — cluster_1/2/3 | `send~ teia_test_cluster_L` | `send~ teia_test_cluster_R` |
| `pan2` obj-6, obj-7, obj-8 — extreme_1/2/3 | `send~ teia_test_extreme_L` | `send~ teia_test_extreme_R` |

Os IDs identificam os objetos no arquivo inspecionado; os nomes dos receivers de voz logo acima ajudam a localizá-los visualmente. Preserve as posições atuais dos nove panners. Esses seis envios precedem os dois limiters e não incluem a voz original.

**Não use `teia_cal_L/R`: a ligação atual desses barramentos fica depois do primeiro limiter.** Não é necessário remover os limiters da cadeia de performance.

## 4. Protocolo de controle na interface

Em `abstractions/InterfaceToAbstractions.maxpat`, crie a entrada:

```text
receive teia_test_control
    ↓
route begin triangle density temperature permanence contrast clock_ms enabled commit clock
```

Todos os novos textos/nomes de objetos e comentários devem ficar em inglês. Conserve os nomes antigos dos barramentos da TEIA.

| Comando recebido | Destino manual |
| --- | --- |
| `begin <run_id>` | Parar o relógio, fechar as duas portas de resposta `ready` e guardar o ID em `send teia_test_run_id` |
| `triangle <G> <C> <E>` | `send teia_test_triangle`; montar a entrada da abstração descrita abaixo |
| `density <0..1>` | Novo inlet 1 do bpatcher density_weights obj-4; confirmar pela nova saída 4 |
| `temperature <0.05..2>` | Flonum existente obj-63, ligado a `send temp`; atualizar também o slider sem provocar nova saída |
| `permanence <0..1>` | Slider existente obj-34; sua cadeia já chega ao flonum obj-49 e `send permanencia` |
| `contrast <0..1>` | Slider existente obj-122; sua cadeia já chega a `send contrast` |
| `clock_ms <ms>` | Novo number visível, conectado ao inlet direito do `metro 500` obj-57 |
| `enabled <G> <C> <E>` | `send teia_test_enabled`; conectar aos toggles do Main como descrito abaixo |
| `commit <run_id>` | Armar as duas respostas `ready` e enviar `start` aos dois motores usando a mensagem existente |
| `clock <0 ou 1>` | Toggle existente obj-60 que controla o `metro` |

`begin` deve executar a parada/fechamento antes de guardar o novo ID: use `trigger s b`, com o bang da direita fazendo a parada e o símbolo da esquerda guardando o ID. O gravador só manda `clock 1` quando a configuração foi confirmada e o arquivo já está aberto.

### Triângulo: atualizar desenho e processamento pelo mesmo caminho

Dentro de `gesture_weights.maxpat`, acrescente `receive teia_test_triangle`. A lista de pesos deve virar coordenadas e entrar em **obj-21, `t l l l`**, onde hoje entra a saída do LCD. Esse caminho já redesenha o ponto e calcula os pesos; enviar comandos de desenho somente ao LCD não calcula os pesos.

Montagem dos dois cálculos, com textos completos:

```text
receive teia_test_triangle
    ↓
t l l
```

- Outlet direito → `expr 10.*$f1 + 190.*$f2 + 190.*$f3` → inlet direito de `pack f f`.
- Outlet esquerdo → `expr 100.*$f1 + 10.*$f2 + 190.*$f3` → inlet esquerdo de `pack f f`.
- Saída de `pack f f` → obj-21, `t l l l`.

Os `expr` recebem a lista de três pesos. O ramo direito calcula Y antes de X disparar o pack. Não conecte o receiver diretamente aos `send wt-*`: isso deixaria o desenho da interface desatualizado.

### Densidade e temperatura

Dentro de `density_weights.maxpat`, acrescente um `inlet` → slider existente obj-1 e derive desse slider um quarto `outlet`, colocado à direita dos três pesos. Na interface, ligue o comando density ao inlet 1 do bpatcher obj-4 e use a saída 4 para confirmar a posição realmente aplicada. O restante do protocolo fica na interface; não criar barramentos internos de densidade. No **Inspector → Comment** das novas portas, use **`Density position (0..1).`** e **`Applied density position (0..1).`**. A tabela completa de nomes das portas está no checklist §4. Preserve o receiver de triângulo já montado.

Temperatura tem uma particularidade: o slider atual usa offset 0,05 e multiplicador 1,95. Envie a temperatura em unidades reais ao flonum **obj-63**, preservando sua conexão ao `send temp`. Para atualizar o slider obj-35 sem recalcular a temperatura, use o segundo ramo de um `trigger f f`: temperatura → `expr ($f1 - 0.05) / 1.95` → `prepend set` → slider. Assim o flonum recebe 1, e o desenho recebe aproximadamente 0,48718. Não envie o valor real 1 como posição bruta desse slider.

### Habilitação no Main

No Main, acrescente `receive teia_test_enabled` → `unpack i i i` → toggles existentes:

- G → obj-7, que alimenta `send on_glissan`.
- C → obj-9, que alimenta `send on_cluster`.
- E → obj-11, que alimenta `send on_extreme`.

Mantenha os envios já existentes. Use as saídas desses toggles em `pack i i i`, com G no inlet quente; o unpack atualiza E/C antes de G disparar a lista. Essa lista fornecerá a confirmação de `enabled`.

## 5. Confirmações dos valores realmente aplicados

O gravador espera **sete ecos de parâmetros** e **duas respostas de motores prontos** para cada ID. Sem isso, para em cinco segundos antes de gravar.

Formato dos ecos, enviados em `send teia_test_status`:

```text
applied <run_id> triangle <G> <C> <E>
applied <run_id> density <position>
applied <run_id> temperature <value>
applied <run_id> permanence <value>
applied <run_id> contrast <control_value>
applied <run_id> clock_ms <milliseconds>
applied <run_id> enabled <G> <C> <E>
```

Use os valores **na saída dos controles existentes**, não uma cópia imediata do comando recebido. O gravador compara cada eco com o pedido, com tolerância numérica de 0,00001.

| Eco | Origem real |
| --- | --- |
| triangle | Três saídas do bpatcher de gestos → `pack f f f`, G no inlet quente |
| density | Nova saída 4 do bpatcher density_weights obj-4 |
| temperature | Saída do flonum obj-63 |
| permanence | Saída do flonum obj-49 |
| contrast | Saída do slider obj-122, antes de `scale 0. 1. 0.5 2.` |
| clock_ms | Saída do novo number do intervalo do relógio |
| enabled | Pack das saídas dos três toggles do Main |

Para cada eco, crie um `prepend applied`, atualizado no início da execução:

```text
receive teia_test_run_id
    ↓
[set applied $1 triangle]
    ↓
prepend applied
    ↓
send teia_test_status
```

Nesse exemplo, o pack dos pesos entra no mesmo `prepend applied`. A mensagem `set` só muda o prefixo e não dispara saída. Faça o mesmo para os outros seis nomes, usando a origem correspondente da tabela. No Main, o ID também chega por `receive teia_test_run_id`.

## 6. Ready: sinalizar depois de instalar cada matriz

Não ligue o comando `start` diretamente à resposta `ready`, nem use uma espera arbitrária como confirmação. **Não é preciso alterar `markov_engine.maxpat`.** No arquivo salvo atual, a saída de `zl.reg` obj-37 executa primeiro o ramo de instalação das transições/abertura do gate (`order 0`, obj-49) e depois o relatório `matrix` (`order 1`, obj-9 → outlet obj-95). Preservar essa ordem explícita.

Na interface, para cada motor, ligue **saída 2 → `route matrix` → saída 1 → `t b` → inlet direito de `gate 1 0`**. Preserve os três outlets atuais e seus fios. Comment junto ao conversor: **`Matrix installed; engine ready.`**

**`begin` fecha os dois gates de resposta; `commit` abre os dois imediatamente antes de enviar o start aos motores.** Nenhum ready de mudanças intermediárias dos controles deve atravessar a preparação. O checklist §5 registra a ordem verificada; §6F descreve a montagem na interface.

Para cada motor, use uma mensagem de saída que guarde o ID atual:

```text
receive teia_test_run_id
    ↓
[set ready $1 gesture]
    ↓
[ready pending gesture]
    ↓
send teia_test_status
```

O bang que atravessou o gate chega à última message box, fazendo-a emitir o texto guardado. Para o motor de densidade use `density` no lugar de `gesture`. As respostas são:

```text
ready <run_id> gesture
ready <run_id> density
```

O `commit` deve usar `trigger b b`: outlet direito abre ambos os gates; outlet esquerdo dispara a mensagem existente `; m_engine_1 start; m_engine_2 start;`. No início de cada execução o ID muda; respostas antigas não liberam a execução nova.

## 7. Eventos mínimos durante a gravação

Na interface:

```text
receive g_state → prepend state gesture → send teia_test_status
```

Da saída **0 do motor de densidade obj-22**:

```text
prepend state density → send teia_test_status
```

Não use `receive m_state` como substituto: o patch inspecionado não o usa como fonte efetiva do estado de densidade.

O controlador guarda o último estado observado antes da captura e registra mudanças durante entrada/cauda. Tempos são do scheduler, relativos ao comando de gravação; não são alinhamento amostral com o arquivo de entrada. Oito canais do mesmo WAV compartilham a mesma gravação.

## 8. Rodar e editar

1. Monte e salve as mudanças manuais acima; confira os seis sinais nos meters.
2. Abra uma única interface e um único gravador. Desligue outras fontes e a escuta do Main.
3. Em Audio Status do Max, selecione **48000 Hz**; ligue o DSP. O gravador verifica a taxa, mas não altera as preferências globais. Se abriu o gravador enquanto os arquivos estavam sendo criados/atualizados, feche e reabra: o controlador não recompila automaticamente durante uma execução.
4. Clique **Load experiment**. Os controles de ganho mostram os valores carregados. O botão relê `dataset_recorder.json`, relativo ao próprio patch, sem alterar search paths.
5. Opcionalmente ative **Monitor** e escute com ganho inicial −12 dB. Monitor e seu volume não entram no WAV.
6. Clique **Start batch**. Acompanhe Status, Current file e Progress. Sem bridge, a falha de configuração é o comportamento esperado.
7. **Stop** cancela esperas e fecha a gravação. Reiniciar depois volta ao primeiro arquivo, em nova sessão. Não edite a interface durante o lote.

Correções e ganho de entrada podem ser alterados nos campos do gravador antes de Start. São congelados durante o lote e registrados no JSON da execução. Essas edições valem para a sessão; **Load experiment restaura o arquivo**. Para preservar a escolha, edite o JSON também.

Para mais execuções, acrescente entradas a `runs`, com IDs distintos e nomes de WAV existentes no manifesto do dataset. Cada entrada pode ter `parameters` para substituir campos de `defaults`. Se substituir `gain_db`, informe os três gestos; não há mescla parcial desse objeto.

```json
{"id": "03_cassol_glissando", "file": "somax_cassol__01.wav",
 "parameters": {"triangle": [1, 0, 0],
                "gain_db": {"glissando": -3, "cluster": 0, "extreme": 0}}}
```

O ganho adicional de calibração está no gravador, não é enviado para sobrescrever `volRelG/C/E`. Sua consolidação na TEIA fica para depois. O piloto captura aproximadamente **40 MB** de áudio; ampliar para 119 execuções de 13 s ocupa cerca de 2,38 GB, antes dos JSONs.

## 9. Rastreabilidade e limites

O JSON de cada execução inclui fonte e SHA-256 conferido contra o manifesto, corte desde o frame 0, parâmetros solicitados/confirmados, correções, ordem dos canais, informações do WAV, configurações de DSP, tempos, estados, status e SHA-256 dos patches/fontes de código relevantes salvos em disco.

Salve suas alterações antes do lote: hashes de disco não identificam edições ainda não salvas. Versões binárias de externos/driver não ficam fixadas por esses hashes. O instrumento conserva decisões aleatórias, urnas, modulações e buffers de atraso: três segundos de preparação são uma espera em silêncio, **não um reset completo ou uma seed congelada**.

O `sfrecord~` limita a captura à duração pedida em objetos nativos. Ao fechar o arquivo, o controlador confere formato e duração, com tolerância de um vetor de sinal. Entrada e arquivo de saída podem ter um deslocamento de início da ordem do agendamento/vetor; não se promete sincronização amostral entre eles. Verificar no piloto se três segundos de cauda bastam continua obrigatório.

## 10. Validação no Max e no Python

Verificações a executar no Max, após a montagem manual:

- Os sete ecos refletem valores visíveis; ambos os ready chegam só depois da instalação das matrizes.
- Um lote produz dois WAVs e dois JSONs com status `completed`, oito canais e cerca de 13 s cada.
- Alterar o master do Main ou o monitor não altera os canais gravados; não há dry na mistura.
- Stop durante entrada, cauda e preparação não avança ao próximo arquivo; reinício volta ao primeiro.
- Sem um eco/ready ou com valor diferente, não começa a gravar. Um arquivo ausente bloqueia o início; nomes existentes não são reutilizados.
- Desligar DSP durante o lote interrompe e registra erro. Ganhos não podem mudar durante o lote.
- Escutar os gestos, conferir pan e decidir se a cauda foi suficiente antes de ampliar o experimento.

Depois de uma captura real, esta verificação é somente de leitura:

```bash
soundSamples/.venv/bin/python - <<'PY'
import json
from pathlib import Path
import numpy as np
import soundfile as sf

paths = sorted(Path('tests/recordings').glob('*.json'))
assert paths, 'No run JSONs found'
for path in paths:
    meta = json.loads(path.read_text())
    if meta['status'] != 'completed':
        print(path.name, meta['status'], meta.get('error'))
        continue
    wav = path.with_suffix('.wav')
    info = sf.info(wav)
    assert (info.samplerate, info.channels, info.subtype) == (48000, 8, 'FLOAT')
    expected = round(meta['timing']['nominal_capture_ms'] * 48)
    assert abs(info.frames - expected) <= max(1, meta['dsp']['signal_vector'])
    audio, _ = sf.read(wav, dtype='float64', always_2d=True)
    gains = meta['confirmed_parameters']['gain_db']
    rebuilt = sum(audio[:, start:start+2] * 10**(gains[name]/20)
                  for name, start in [('glissando', 2), ('cluster', 4), ('extreme', 6)])
    assert np.allclose(audio[:, :2], rebuilt, rtol=1e-5, atol=2e-6), 'Mix/stem mismatch'
    rms = np.sqrt(np.mean(audio**2, axis=0))
    print(wav.name, info.frames, 'frames; RMS dBFS:',
          np.round(20*np.log10(np.maximum(rms, 1e-15)), 2),
          '; final 100 ms peak:', np.max(np.abs(audio[-4800:]), axis=0))
PY
```

Essa comparação valida a soma gravada; ela não prova sozinha que os taps foram montados antes dos limiters. A topologia e a escuta precisam ser conferidas no Max. A análise científica de intensidade/atividade e a decisão dos ganhos ficam para a etapa seguinte.

## Referências locais consultadas

Instalação `/Applications/Max.app/Contents/Resources/C74/docs/`, versão 8.5.2: referências de `sfrecord~` (oito canais, `open`, `record`, `samptype float32`, sobrescrita), `buffer~`, `play~`, `dspstate~`, `delay`, `slider`, `expr`, `prepend`; guias JavaScript `File`, `Task`, `Buffer`, `Global` e `Patcher`.

Os testes automatizados do controlador usam simulação das APIs do Max. Eles não substituem a abertura do patch, a montagem manual do bridge nem a reprodução/gravação efetiva no Max.

Verificação da implementação em 18/10/2026: JSON/JavaScript e portas/conexões conferidos; arquivos do piloto confirmados como mono/48 kHz/PCM24/10 s; 18 cenários simulados passaram, incluindo lote, ecos/ready ausentes, eco divergente, carregamento sem callback, DSP, parada/reinício (também durante fechamento e antes do primeiro frame), ganhos fixos, hashes e proteção de WAV/JSON existentes. Nenhum áudio real da TEIA foi capturado nesse processo; `recordings/` foi entregue vazio.


## Análise offline — scripts e notebook (20/10)

Abra [audio_analysis.ipynb](audio_analysis.ipynb) no kernel **TEIA Curadoria (.venv)** (`soundSamples/.venv/bin/python`). O notebook já está executado com a sessão completa de dois pilotos, todos os gestos ligados. Use Run All para recalcular; SESSION_ID seleciona outra sessão completa, ENABLED permite os solos. As quatro partes são intensidade, espectro, psicoacústica opcional e exportação opcional. Máximo de quatro execuções em figuras por padrão; tabelas/relatório incluem todas as selecionadas.

O script [audio_analysis.py](audio_analysis.py) pode rodar sem notebook: `soundSamples/.venv/bin/python tests/audio_analysis.py --spectral`. Não grava nada por padrão. Para exportar, escolha um novo caminho explícito em --output ou EXPORT_JSON; sobrescrita é recusada. O ambiente recebeu pyloudnorm 0.2.0, mosqito 1.2.1 e pyuff 2.5.8, sem ampliar o Max ou instalar JupyterLab.

Mantêm-se pan/TEIA e ganhos atuais. RMS inclui silêncios; LUFS tem gates próprios; o limiar de atividade −60 dBFS é exploratório. Picos são amostrais. Sharpness/roughness exigem referência Pa/FS explícita e não rodam automaticamente sobre amplitudes digitais sem escala física. O estudo não implica filtros ou ganhos novos; a 101 de Stop/reinício/pan/cauda continua pendente conforme prioridade alterada pelo usuário.
