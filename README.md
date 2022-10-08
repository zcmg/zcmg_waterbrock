**FiveM ESX Script**

![ezgif com-gif-maker](https://user-images.githubusercontent.com/88593228/194673057-d996b416-4af0-445e-a958-4dd9910cc7bb.gif)
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/88593228/194711579-28c43a68-ad8d-486e-a5f6-46a2aa9f5600.gif)


Ao entrar na água os itens electronicos (definidos no config) ficam estragados, que darão origem a outros itens (definidos no config).
Possivelidade de reparar os itens avariados.

Caso não tenha os itens pode usar o sql a baixo.
## SQL

INSERT INTO items (name, label) VALUES ('phone', 'Telemóvel');
INSERT INTO items (name, label) VALUES ('phone_used', 'Telemóvel Estragado');
INSERT INTO items (name, label) VALUES ('radio', 'Rádio');
INSERT INTO items (name, label) VALUES ('radio_used', 'Rádio Estragado');

## Dependências
-zcmg_notificacao<br/>
-zcmg_barra
