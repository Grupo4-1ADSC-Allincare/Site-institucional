function calcular() {
  var lote = 1300000
  var quantidade = Number(qtd_lotes.value)
  var vacinas_perdidas = Number(vac_perdidas.value)
  var preço = Number(valor_vacina.value)
  var calc1 = lote * quantidade
  var calc2 = calc1 - vacinas_perdidas
  var calc3 = preço * vacinas_perdidas
  var calc4 = calc2 * preço
  var porcentagem_perda = (vacinas_perdidas * 100) / calc1
  var estimativa_redução_vacinas = (vacinas_perdidas * 17) / 100
  var estimativa_redução_monetaria = (calc3 * 17) / 100

  resultado.innerHTML = `A transportadora entregou <b>${calc2}</b> de vacinas, perdendo no processo <b style='color: #E6005A'>${vacinas_perdidas}</b> vacinas, com isso
  houve um prejuízo monetário de <b style='color: #E6005A'>${calc3.toLocaleString(
    'pt-Br',
    { style: 'currency', currency: 'BRL' }
  )}</b> por conta das vacinas perdidas.
  Essa perda equivale à <b style='color: #E6005A'>${porcentagem_perda.toFixed(
    2
  )}%</b> das vacinas.
  Com o nosso serviço estimamos uma redução não só nas perdas das vacinas, mas também uma redução do prejuízo monetário. Essa redução 
  é de <b style='color: #00B167'>17%</b>, estimando que na próxima entrega haja uma <b><u>perda menor</u></b>, que seria de <b style='color: #00B167'>${estimativa_redução_vacinas}</b> vacinas e um <b><u>prejuízo monetário menor</u></b>, sendo <b style='color: #00B167'>${estimativa_redução_monetaria.toLocaleString(
    'pt-Br',
    { style: 'currency', currency: 'BRL' }
  )}</b>. `
}
