# Projeto final

1. VPC + Subnets
2. Regras de FW (130.211.0.0/22 e 35.191.0.0/16, opicionalmente aceitando conexoes de todos pra testar SSH)
3. Instance Template (Com scripts do NGINX por regiao)
4. MIG
5. HTTP(S) Load Balancer

Podem utilizar ou criar modulos, podem utilizar backend e etc.

Me entreguem a arquitetura, criem o codigo como seu coracao desejar.

Para testar, abram o IP do seu loadbalancer no navegador ou utilize o shell abaixo para ver no terminal:

```bash
for i in $(seq 1 200); do curl -s http://ip_do_loadbalancer/; done
```
