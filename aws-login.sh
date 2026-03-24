#!/bin/bash

echo "🔐 AWS Academy login setup"

read -p "AWS Access Key ID: " ACCESS_KEY
read -s -p "AWS Secret Access Key: " SECRET_KEY
echo
read -s -p "AWS Session Token: " SESSION_TOKEN
echo
read -p "AWS Region [us-east-1]: " REGION

REGION=${REGION:-us-east-1}

aws configure set aws_access_key_id "$ACCESS_KEY"
aws configure set aws_secret_access_key "$SECRET_KEY"
aws configure set aws_session_token "$SESSION_TOKEN"
aws configure set region "$REGION"
aws configure set output "json"

echo
echo "✅ Credenciales guardadas"
echo "🧪 Validando sesión..."

aws sts get-caller-identity

if [ $? -eq 0 ]; then
  echo "✅ AWS CLI configurado correctamente"
else
  echo "❌ Error: no se pudo validar la sesión"
fi
