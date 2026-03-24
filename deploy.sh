#!/bin/bash

BUCKET_NAME="al03081455-devops"

echo "🚀 Iniciando deploy a S3..."
echo "📦 Bucket: $BUCKET_NAME"

if [ ! -f "index.html" ]; then
  echo "❌ Error: no se encontró index.html en este directorio"
  exit 1
fi

aws s3 sync . "s3://$BUCKET_NAME" \
  --delete \
  --exclude ".git/*" \
  --exclude ".DS_Store" \
  --exclude "aws-login.sh" \
  --exclude "refresh-and-deploy.sh" \
  --exclude "deploy.sh"

if [ $? -eq 0 ]; then
  echo "✅ Deploy completado"
else
  echo "❌ Error durante el deploy"
  exit 1
fi
