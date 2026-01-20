# Tech Challenge – Fase 2 – Arquitetura de Microsserviços

## Visão Geral
Este projeto implementa a evolução do ToggleMaster para uma arquitetura de microsserviços
executando em Kubernetes (AWS EKS), com foco em escalabilidade, resiliência e observabilidade.

## Microsserviços
- auth-service (Go)
- flag-service (Python)
- targeting-service (Python)
- evaluation-service (Go)
- analytics-service (Python)

## Arquitetura
- Kubernetes (EKS)
- NGINX Ingress Controller
- RDS PostgreSQL (dados transacionais)
- ElastiCache Redis (cache)
- DynamoDB (eventos)
- SQS (fila de eventos)
- HPA (CPU-based autoscaling)
- KEDA (testado para autoscaling por fila)

## Escalabilidade
- evaluation-service: HPA baseado em CPU
- analytics-service: HPA por CPU (KEDA por fila testado)

## Como executar
```bash
kubectl apply -f k8s/namespaces
kubectl apply -f k8s/configmaps
kubectl apply -f k8s/secrets
kubectl apply -f k8s/deployments
kubectl apply -f k8s/services
kubectl apply -f k8s/ingress
