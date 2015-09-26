stock Player_CheckPlayerRPName(name[]){
  new nrpnick[10];

  if(name[0] < 65 || name[0] > 90) nrpnick[1] = 1;
  for(new i = 1; i < strlen(name); i++){
    if(name[i] == 95) nrpnick[0]++;
    else if(nrpnick[0] == 1){
      nrpnick[0]++;
      if(name[i] < 65 || name[i] > 90) nrpnick[2] = 1;
    }
    else if((nrpnick[i] < 97 || name[i] > 122) && nrpnick[0] == 0){
      if(name[i] < 65 || name[i] > 90) nrpnick[3] += 15;
      else nrpnick[3]++;
    }
    else if((name[i] > 96 && name[i] < 123) && nrpnick[0] == 0) nrpnick[5]++;
    else if((name[i] < 97 || name[i] > 122) && nrpnick[0] == 2){
      if(name[i] < 65 || name[i] > 90) nrpnick[4] += 15;
      else nrpnick[4]++;
    }
    else if((name[i] > 96 && name[i] < 123) && nrpnick[0] == 2) nrpnick[6]++;
  }

  if(nrpnick[0] != 2 || nrpnick[1] != 0 || nrpnick[2] != 0 || nrpnick[3] != 0 || nrpnick[4] != 0){
    SendClientMessage(playerid, -1, "Ваш ник не подходит для игры на нашем RolePlay сервере. Пример правильного ника: {33CCFF}Ivan_Ivanov");
    if(nrpnick[0] != 2){
      if(nrpnick[0] == 0) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В нике обязательно использование одного {33CCFF}\"_\"{ffffff} для разделения на Имя и Фамилию.");
      else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В нике нельзя многократно использовать символ {33CCFF}\"_\".");
    }
    if(nrpnick[1] != 0) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Ваш ник должен начинаться с заглавной буквы.");
    if(nrpnick[2] == 1) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Вторая половина вашего ника должна начинаться с заглавной буквы.");
    if(nrpnick[3] != 0){
      if(nrpnick[3] >= 15) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В первой части вашего ника вы используете заглавные буквы более одного раза.");
      else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В первой части вашего ника вы используете запрещенные символы.");
    }
    if(nrpnick[4] != 0){
      if(nrpnick[4] >= 15) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Во второй части вашего ника вы используете заглавные буквы более одного раза.");
      else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Во второй части вашего ника вы используете запрещенные символы.");
    }
    if(nrpnick[5] < 3) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Первая половина вашего ника слишком короткая.");
    if(nrpnick[6] < 3 && nrpnick[0] >= 2) SendClientMessage(playeridб -1, "{33CCFF}Подсказка: {ffffff}Вторая половина вашего ника слишком короткая.");

    Kick(playerid); // Думаю вы знаете, что нужно вызывать эту функцию с задержкой, иначе текст не будет отправлен игроку.
  }
}
