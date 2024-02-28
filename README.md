# PPPoE-Client-Generator


Um gerador de client pppoe, em massa com capacidade de 10 mil autenticações, utilizando o próprio linux como discador pppoe.

<br />

### Funcionamento
Ao executar o __pppoe-generator__, ele cria as credenciais que serão usadas no arquivo PAP e CHAP do linux: __/etc/ppp/chap-secrets__ e __/etc/ppp/pap-secrets__.

Após escrever, ele inicia um tunel PPPoE apontando para interface específicada com os parâmetros já setados.

<br /><br />
### Configurações
As configurações são bem tranquilas de configurar, segue o passo a passo:

```bash
FILE=userandpass.txt # Arquivo com os usuarios e senha pppoe
MAX_LOGINS=10 # quantidade máxima de logins 
IFACE=wlp0s20f3 # Interface, pode usar vlans
TRIES=80 # tentativas de discagem
```

<br /><br /><br />
### Testes
Testado utilizando um Ubuntu 20.04 Desktop, e um Accel-ppp como servidor de autenticação em um Virtual Box.


![](https://i.imgur.com/8OIjc2u.png)
<br />
Importante: No servidor de autenticação solicite para ignorar usuario e senha ou vocẽ pode registrar todos que estão no arquivo __userandpass.txt__.