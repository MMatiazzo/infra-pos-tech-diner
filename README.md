# Infraestrutura 🏗️ - Pós Tech Diner

Projeto desenvolvido para entrega do *Tech Challenge* da **Pós Tech - Software Architecture** (Fase 5).

## Grupo 11 - SOAT 4
- Alexandre Mikio Kimura Fukano - **RM 351127** (alexandremkimura@hotmail.com)
- Lucas Proença Renó - **RM 351351** (lucasreno9@gmail.com)
- Matheus Agusuto Leme Matiazzo - **RM 351128** (mathmatiazzo@gmail.com)
- Vinicius Carloto Carnelocce - **RM 351126** (viniciuscarloto@gmail.com)

## Visão Geral
O projeto foi desenvolvido para ajudar uma lanchonete de bairro em expansão que ainda não possui um sistema de controle de pedidos. A aplicação consiste em quatro microserviços:
- [Pedido](https://github.com/MMatiazzo/pos-tech-diner-pedido): Responsável por gerenciar os pedidos dos usuários e os produtos;
- [Produção](https://github.com/MMatiazzo/pos-tech-diner-producao): Responsável por gerenciar a produção dos pedidos;
- [Cliente](https://github.com/MMatiazzo/pos-tech-diner-cliente): Responsável por autenticar os usuários;
- [Pagamento](https://github.com/MMatiazzo/pos-tech-diner-pagamento): Responsável por gerenciar os pagamentos dos pedidos;

## Infraestrutura
Além dos microsserviços, existe um [projeto de infraestrutura](https://github.com/MMatiazzo/infra-pos-tech-diner) que visa criar uma infraestrutura para os microsserviços da aplicação utilizando Amazon Web Services. O projeto foi desenvolvido utilizando Terraform e Github Actions.

## Vídeo de Apresentação - Fase 5
[![logo-youtube](https://github.com/user-attachments/assets/4ef4ce8c-af75-4bb3-9461-6322dab45e7d)](https://www.youtube.com/watch?v=87CyZxSenM4)

## Objetivo

Este projeto visa criar uma infraestrutura para os microsserviços da aplicação utilizando Amazon Web Services. A infraestrutura é composta por:
- **VPC**: Rede virtual privada para os microsserviços;
- **Subnets**: Sub-redes para os microsserviços;
- **Security Groups**: Grupos de segurança para os microsserviços;
- **RDS**: Banco de dados relacional para os microsserviços;
- **Elasticache**: Serviço de cache para os microsserviços;
- **ECS**: Serviço de container para os microsserviços;
- **Elastic Load Balancer**: Balanceador de carga para os microsserviços;
- **S3**: Armazenamento de objetos para os microsserviços;
- **CloudWatch**: Monitoramento dos microsserviços;
- **SQS**: Fila de mensagens para os microsserviços.

### Stack utilizada:

- **Terraform**: Infraestrutura como código;