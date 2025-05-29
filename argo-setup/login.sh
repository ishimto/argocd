#!/bin/bash


USERNAME=admin
PASSWORD=$1

argocd login localhost:1234 \
  --username $USERNAME \
  --password $PASSWORD \
  --insecure
