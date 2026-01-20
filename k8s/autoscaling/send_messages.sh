#!/bin/bash

QUEUE_URL="https://sqs.us-east-1.amazonaws.com/817878529306/analytics-queue"
REGION="us-east-1"

echo "Enviando 10 mensagens para o SQS..."

for i in $(seq 1 10); do
  EVENT_ID="sqs-batch-$i-$(date +%s)"

  aws sqs send-message \
    --queue-url "$QUEUE_URL" \
    --message-body "{
      \"event_id\": \"$EVENT_ID\",
      \"flag_name\": \"beta_feature\",
      \"result\": true,
      \"timestamp\": \"$(date +%s)\",
      \"user_id\": \"user-$i\"
    }" \
    --region "$REGION" > /dev/null

  echo "Mensagem $i enviada (event_id=$EVENT_ID)"
done

echo "Envio concluído."
