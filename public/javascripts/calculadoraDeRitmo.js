function calculadoraDeRitmo(minutos, segundos, decimos, distancia, intensidade) {
  decimos = (10 * segundos) + (1 * decimos) + (minutos * 600);
  distancia = distancia/1000;
  ritmo = (decimos/distancia)*((200-intensidade)/100);
  minutos = (ritmo/600).floor();
  segundos = ((ritmo%600)/10).toFixed(0);
  return "Ritmo: " + (minutos > 0 ? (minutos) + "'" : "") + (segundos > 0 ? (segundos) + "''": "") + "/km" ;

}
