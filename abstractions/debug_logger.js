// Estado persistente: cada campo guarda o ultimo valor conhecido.
// Assim, quando SO UM valor muda, o snapshot escrito ainda sai completo
// (em vez de depender de todos os valores chegarem juntos num unico pacote do Max).
var state = {
    tri1: 0, tri2: 0, tri3: 0,
    selfBoost1: 0, selfBoost2: 0, selfBoost3: 0,
    temperature: 0,
    cell_0_0: 0, cell_0_1: 0, cell_0_2: 0,
    cell_1_0: 0, cell_1_1: 0, cell_1_2: 0,
    cell_2_0: 0, cell_2_1: 0, cell_2_2: 0
};

var path = "/Users/micaelantunesdasilva/Documents/__dev/teia2/debug_output.jsonl";

// A ordem acompanha os inlets do pak de 7 valores no Interface.maxpat.
var inputFields = [
    "tri1", "tri2", "tri3",
    "selfBoost1", "selfBoost2", "selfBoost3", "temperature"
];

// O route e o pak da matriz enviam as celulas por linha.
var matrixFields = [
    "cell_0_0", "cell_0_1", "cell_0_2",
    "cell_1_0", "cell_1_1", "cell_1_2",
    "cell_2_0", "cell_2_1", "cell_2_2"
];

// O patch atual usa "log" para ambos os pacotes. O tamanho identifica
// qual grupo atualizar, preservando os ultimos valores do outro grupo.
function log() {
    if (arguments.length == 7) {
        updatePacket(inputFields, arguments);
    } else if (arguments.length == 9) {
        updatePacket(matrixFields, arguments);
    } else {
        post("debug_logger: log espera 7 ou 9 valores; recebeu " +
             arguments.length + "\n");
    }
}

// Tambem aceita seletores explicitos, caso os sprintf sejam renomeados
// para "inputs" e "matrix" no Max. Isso nao e necessario para o patch atual.
function inputs() {
    updatePacket(inputFields, arguments);
}

function matrix() {
    updatePacket(matrixFields, arguments);
}

function updatePacket(fields, values) {
    if (values.length != fields.length) {
        post("debug_logger: pacote espera " + fields.length +
             " valores; recebeu " + values.length + "\n");
        return;
    }
    // Atualiza o grupo inteiro antes de gravar, evitando uma linha por campo.
    for (var i = 0; i < fields.length; i++) {
        state[fields[i]] = values[i];
    }
    write();
}

// Cada linha contem o ultimo estado conhecido, nao uma transacao do Csound:
// o pak de 9 valores emite tambem enquanto as celulas chegam uma a uma.
// Por isso, algumas linhas ainda podem misturar celulas de dois calculos.

// Chamada pelo Max com uma mensagem "set <nome> $1" (ex: "set tri1 $1").
// O Max casa o primeiro simbolo da mensagem ("set") com esta funcao
// e passa o resto como argumentos.
function set(name, value) {
    if (!(name in state)) {
        post("debug_logger: campo desconhecido '" + name + "'\n");
        return;
    }
    state[name] = value;
    write();
}

function write() {
    var f = new File(path, "readwrite", "TEXT");
    if (!f.isopen) {
        f = new File(path, "write", "TEXT");
    }
    if (f.isopen) {
        f.position = f.eof;
        f.writeline(JSON.stringify(state));
        f.close();
    } else {
        post("debug_logger: nao abriu o arquivo\n");
    }
}
