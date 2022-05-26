var database = require("../database/config");

function buscarUltimasMedidas(idVeiculo, limite_linhas) {
    instrucaoSql = `select 
                        valorTemperatura,
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from HistMedida
                    where fkVeiculo = ${idVeiculo}
                    order by idHistMedida desc limit ${limite_linhas}`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idVeiculo) {
    instrucaoSql = `select 
                        valorTemperatura,
                        dataHora, 
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fkVeiculo 
                        from HistMedida where fkVeiculo = ${idVeiculo} 
                    order by idHistMedida desc limit 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}