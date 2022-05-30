/* var database = require("../database/config");

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
} */

var database = require("../database/config");

function buscarUltimasMedidas(idVeiculo, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        valorTemperatura as temperatura,  
                        dataHora,
                        CONVERT(varchar, dataHora, 108) as momento_grafico
                    from HistMedida
                    where fkVeiculo = ${idVeiculo}
                    order by idHistMedida  desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        valorTemperatura as temperatura,
                        dataHora,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico
                    from HistMedida
                    where fkVeiculo = ${idVeiculo}
                    order by idHistMedida desc limit ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idVeiculo) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        valorTemperatura as temperatura,  
                        CONVERT(varchar, dataHora, 108) as momento_grafico, 
                        fkVeiculo
                        from HistMedida where fkVeiculo = ${idVeiculo} 
                    order by idHistMedida desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        valorTemperatura as temperatura,
                        DATE_FORMAT(dataHora,'%H:%i:%s') as momento_grafico, 
                        fkVeiculo 
                        from HistMedida where fkVeiculo = ${idVeiculo} 
                    order by idHistMedida desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}