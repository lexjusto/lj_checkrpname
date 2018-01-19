stock CheckRPName(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));

    new reason[10];

    if(name[0] < 65 || name[0] > 90) reason[1] = 1;
    for(new i = 1; i < strlen(name); i++)
    {
        if(name[i] == 95) reason[0]++;
        else if(reason[0] == 1)
        {
            reason[0]++;
            if(name[i] < 65 || name[i] > 90) reason[2] = 1;
        }
        else if((reason[i] < 97 || name[i] > 122) && reason[0] == 0)
        {
            if(name[i] < 65 || name[i] > 90) reason[3] += 15;
            else reason[3]++;
        }
        else if((name[i] > 96 && name[i] < 123) && reason[0] == 0) reason[5]++;
        else if((name[i] < 97 || name[i] > 122) && reason[0] == 2)
        {
            if(name[i] < 65 || name[i] > 90) reason[4] += 15;
            else reason[4]++;
        }
        else if((name[i] > 96 && name[i] < 123) && reason[0] == 2) reason[6]++;
    }

    if(reason[0] != 2 || reason[1] != 0 || reason[2] != 0 || reason[3] != 0 || reason[4] != 0)
    {
        SendClientMessage(playerid, -1, "Ваш ник не подходит для игры на нашем RolePlay сервере. Пример правильного ника: {33CCFF}Ivan_Ivanov");
        if(reason[0] != 2)
        {
            if(reason[0] == 0) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В нике обязательно использование одного {33CCFF}\"_\"{ffffff} для разделения на Имя и Фамилию.");
            else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В нике нельзя многократно использовать символ {33CCFF}\"_\".");
        }
        if(reason[1] != 0) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Ваш ник должен начинаться с заглавной буквы.");
        if(reason[2] == 1) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Вторая половина вашего ника должна начинаться с заглавной буквы.");
        if(reason[3] != 0)
        {
            if(reason[3] >= 15) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В первой части вашего ника вы используете заглавные буквы более одного раза.");
            else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}В первой части вашего ника вы используете запрещенные символы.");
        }
        if(reason[4] != 0)
        {
            if(reason[4] >= 15) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Во второй части вашего ника вы используете заглавные буквы более одного раза.");
            else SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Во второй части вашего ника вы используете запрещенные символы.");
        }
        if(reason[5] < 3) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Первая половина вашего ника слишком короткая.");
        if(reason[6] < 3 && reason[0] >= 2) SendClientMessage(playerid, -1, "{33CCFF}Подсказка: {ffffff}Вторая половина вашего ника слишком короткая.");

        Kick(playerid);
    }
    return true;
}