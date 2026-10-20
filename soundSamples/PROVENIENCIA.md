# Proveniência do dataset de calibração da TEIA

Registro iniciado em **18/10/2026**. Esta pasta contém fontes candidatas à calibração,
não dados de validação já coletados. O dataset exportado terá dois trechos de dez
segundos por fonte elegível: **16 trechos, de oito fontes**, e uma referência derivada
incluída no dataset como `Original.wav`: **17 arquivos de áudio no total**.
Tempos e hashes definitivos serão registrados no manifesto após revisão e exportação.

**Revisão da seleção em 18/10/2026:** após aprovar as oito fontes restantes, o usuário
excluiu `duos_trumpet_guitar` (`S-Trumpet_ElecGuitar-Track01.wav`). O registro dessa fonte
abaixo é histórico de proveniência, não inclusão no dataset final. O arquivo original
permanece intacto. Os primeiros 10 segundos de Excerpt 1 foram solicitados explicitamente
como arquivo adicional para uso no dataset, sem substituir seus dois cortes aprovados.

## 1. Violoncelo — Katharina Gross / cellomondo

**Informação fornecida por Micael Antunes:** os três excerpts são gravações realizadas
por **Katharina Gross** durante o projeto **cellomondo**. A grafia foi conferida no
[site da intérprete](https://www.katharinagross.at/) e na
[página oficial do projeto](https://cellomondo.jimdofree.com/about-1/).

| Arquivo local | Caracterização fornecida pelo usuário | Papel |
|---|---|---|
| `Excerpt 1.aif` | Mais melódico | Fonte independente para dois cortes |
| `Excerpt 2.aif` | Técnicas estendidas | Fonte independente para dois cortes |
| `Excerpt 3.aif` | Predominância de percussão | Fonte independente para dois cortes |
| `Original.wav` atual | Aproximadamente 7,1 segundos; segundo o usuário, igual ao início de Excerpt 1 | Referência anterior, preservada; não acrescenta fonte independente |

**Crédito provisório:** Katharina Gross, violoncelo; gravações do projeto cellomondo,
material fornecido por Micael Antunes.

Obra/sessão específica, data e local de gravação, responsável pela captação e condições
de autorização ainda não foram informados. Não atribuir automaticamente esses arquivos
a uma faixa comercial ou obra do catálogo do projeto, nem declarar uma licença aberta.
A caracterização musical acima é do usuário, não uma classificação automática.

A nova referência `dataset/<versão>/Original.wav` será derivada de **0 a 10 segundos de
`Excerpt 1.aif`**, com o mesmo preparo dos cortes. Não é loop do arquivo curto nem
substituição do `Original.wav` existente. Não deve ser contada como décima fonte.

## 2. Material musical distribuído com Somax2 — IRCAM

Os três arquivos foram disponibilizados individualmente no repositório oficial
[DYCI2/Somax2](https://github.com/DYCI2/Somax2), em `max/somax/corpus/`. Acesso e tamanhos
foram conferidos em 18/10/2026; não foi necessário instalar o software. Os nomes abaixo
são preservados como publicados, inclusive a grafia `Fabbrizio2c.wav`.

| Arquivo | Artista creditado / identificação | Fonte direta |
|---|---|---|
| `Fabbrizio2c.wav` | Fabrizio Cassol | [WAV oficial](https://raw.githubusercontent.com/DYCI2/Somax2/master/max/somax/corpus/Fabbrizio2c.wav) |
| `Joelle.wav` | Joëlle Léandre | [WAV oficial](https://raw.githubusercontent.com/DYCI2/Somax2/master/max/somax/corpus/Joelle.wav) |
| `Marco_guitar.wav` | Marco Fiorini; guitarra indicada no nome | [WAV oficial](https://raw.githubusercontent.com/DYCI2/Somax2/master/max/somax/corpus/Marco_guitar.wav) |

A associação dos nomes é baseada nos nomes dos arquivos e nos
[créditos da distribuição](https://github.com/DYCI2/Somax2#credits), que agradecem o
material musical desses artistas. Obra, sessão, local, data e captação específicos
ainda não estão identificados para cada arquivo. Não inferir que todas as fontes
sejam musicalmente monofônicas ou que toda a gravação seja improvisação livre.

**Crédito provisório:** artista correspondente; material distribuído com Somax2,
IRCAM / equipe Représentations musicales. Citar a origem e o arquivo efetivamente usados.

**Licença específica do áudio: não confirmada.** A licença GPL-3.0 do software não
estabelece, por si só, a permissão de reutilizar ou redistribuir as gravações e seus
exemplos processados. Este registro de acesso não substitui essa conferência.

## 3. Improvising Duos — Universidade de Edimburgo

**Referência do dataset:** Moran, Nikki; Keller, Peter (2016). *Improvising Duos — Audio
only*. University of Edinburgh, Edinburgh College of Art.
[DOI: 10.7488/ds/1685](https://doi.org/10.7488/ds/1685).

[Página de origem e arquivos](https://datashare.ed.ac.uk/items/9dc2a8dd-4fef-4c91-aca6-0e2a53100c81).
Os intérpretes permanecem anônimos conforme as condições de coleta do dataset.

| Arquivo local | Sessão | Instrumentação do duo; identificação da faixa |
|---|---|---|
| `F-Clarinet_AltoSax-Track01.wav` | Improvisação livre | Clarinete / sax alto; instrumento efetivo de Track01 ainda por conferir |
| `F-SopSax_Drums-Track01.wav` | Improvisação livre | Sax soprano / bateria; instrumento efetivo de Track01 ainda por conferir |
| `S-Trumpet_ElecGuitar-Track01.wav` | Improvisação sobre o standard *Autumn Leaves* | Trompete / guitarra elétrica; instrumento efetivo de Track01 ainda por conferir |

**A faixa trompete/guitarra está excluída da seleção atual.** As outras duas faixas
desta tabela permanecem no dataset. Seu estado de aprovação não foi alterado pela exclusão.

Não afirmar que Track01 contém o primeiro instrumento do nome sem documentação ou
escuta. Faixa individual não garante isolamento acústico do outro músico. Conferir
vazamento na revisão; não classificar automaticamente a faixa como entrada monofônica.

### Documentação das tomadas

Os intervalos de performance usados para restringir as sugestões foram transcritos
das planilhas oficiais, consultadas em 18/10/2026:

- [Free Jazz duos audio.xlsx](https://datashare.ed.ac.uk/server/api/core/bitstreams/8c598329-b78a-4e4f-b5a3-ae0abe89c690/content), abas `Clarinet_AltoSax` e `SopSax_Drums`.
- [Standard Jazz duos audio.xlsx](https://datashare.ed.ac.uk/server/api/core/bitstreams/65acf39d-3c6b-4284-be38-6cf17f1204e9/content), aba `Trumpet_ElecGuitar`.

O notebook contém os intervalos completos utilizados; os inícios/fins escolhidos e a
tomada correspondente podem ser recuperados pela configuração e pelos tempos do manifesto.
As pausas entre tomadas não são tratadas como material candidato.

### Condições publicadas

O registro indica **CC BY-NC-SA 4.0**, com condições específicas: preservar o anonimato,
citar o dataset em publicações que utilizem os dados e destinar as gravações à pesquisa
acadêmica. O registro restringe expressamente usos comerciais, artísticos ou de
entretenimento. Não apresentar esses arquivos como material livre para incorporar na
peça da TEIA. Conferir a adequação de eventual divulgação de exemplos transformados
às condições publicadas e ao uso pretendido.

Referência metodológica associada: Moran, N.; Hadley, L. V.; Bader, M.; Keller, P. E.
(2015). *Perception of “Back-Channeling” Nonverbal Feedback in Musical Duo Improvisation*.
PLOS ONE, 10(6), e0130070. [DOI: 10.1371/journal.pone.0130070](https://doi.org/10.1371/journal.pone.0130070).

## 4. Seleção, preparo e rastreabilidade

- Dois cortes de **10 segundos sem sobreposição por fonte**; sugestões a cada 0,5 s.
- Atividade calculada no áudio convertido para mono, em janelas de 100 ms. Limiar:
  maior entre −70 dBFS e 40 dB abaixo do percentil 95 do RMS por janela da fonte.
- Ranking: proporção de atividade decrescente, RMS decrescente, início mais cedo.
  Em caso de conflito, procurar um par não sobreposto. Maior atividade não é sinônimo
  de maior interesse musical; os inícios finais dependem de revisão por escuta.
- Exportação: média aritmética dos canais → reamostragem polifásica para 48 kHz
  (SciPy, janela Kaiser beta 5, bordas constantes) → fades lineares de 5 ms → ganho
  constante → WAV mono PCM24, exatamente 480.000 amostras.
- Alvo de −24 dBFS RMS, com teto de **pico de amostra** em −1 dBFS. Sem compressor.
  O teto não é uma medição de true peak. Quando necessário, prevalece sobre o alvo de
  RMS; registrar essa ocorrência. RMS não é loudness perceptivo nem LUFS.
- O manifesto guarda fonte/hash, formato, configuração, limites em segundos e frames,
  ganho aplicado, medidas finais, hash de cada WAV e versões das bibliotecas. Inclui
  uma cópia deste documento e seu hash, além do hash do notebook usado na exportação.
- O rascunho `dataset/revisao_<versão>.json` guarda sugestões, alterações e aprovações.
  Sua atualização é intencional. WAVs/manifesto finais não são sobrescritos.
- O conjunto não implica oito intérpretes/sessões independentes: há três excerpts da
  mesma intérprete e material de origens distintas. A referência adicional não aumenta
  a diversidade de fontes. Seleção de atividade e normalização são escolhas de preparo
  a declarar no artigo, não resultados de calibração da TEIA.

## 5. Uso do notebook e conservação

Ambiente aprovado: `soundSamples/.venv`, Python 3.14. Dependências diretas fixadas:
NumPy 2.5.4, SciPy 1.18.1, SoundFile 0.14.0, Matplotlib 3.11.2 e ipykernel 7.4.0.
As versões efetivamente carregadas constam no manifesto. O notebook é autocontido;
não usa MuBu/Max, librosa, pandas ou JupyterLab.

No VS Code, abrir `curadoria_dataset.ipynb` e escolher o interpretador
`soundSamples/.venv/bin/python` como kernel. Executar inventário/análise, revisar e
aprovar cada fonte, depois habilitar a célula de exportação. A seção final permite
validar/escutar os WAVs exportados mesmo quando os originais não estiverem disponíveis.

**Nenhum original é apagado pelo notebook.** Depois de validar e escutar o dataset,
conservar os cortes e o manifesto juntos e fazer cópia segura antes de retirar fontes
da máquina. Hash e proveniência permitem identificar as fontes; não substituem o
áudio original para fazer novos cortes. O `Original.wav` curto existente é preservado.
