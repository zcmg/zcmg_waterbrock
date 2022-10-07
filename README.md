**FiveM ESX Script**

![ezgif com-gif-maker](https://user-images.githubusercontent.com/88593228/194673057-d996b416-4af0-445e-a958-4dd9910cc7bb.gif)

Ao entrar na água os itens electronicos (definidos no config) ficam estragados, que darão origem a outros itens (definidos no config).

Caso não tenha os itens pode usar o sql a baixo.
## SQL

INSERT INTO items (name, label) VALUES ('phone', 'Telemóvel');
INSERT INTO items (name, label) VALUES ('phone_used', 'Telemóvel Estragado');
INSERT INTO items (name, label) VALUES ('radio', 'Rádio');
INSERT INTO items (name, label) VALUES ('radio_used', 'Rádio Estragado');

## Dependências
-zcmg_notificacao
