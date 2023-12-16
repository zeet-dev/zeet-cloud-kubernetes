#!/bin/bash

SECRET=zeet-admin-token
TOKEN=$(kubectl -n zeet get secret "${SECRET}" -o json | jq -r '.data["token"]' | base64 --decode)

cat $KUBECONFIG | sed '/^users:/,$d' | sed 's/^    user:.*/    user: zeet-admin/g' >kubeconfig.yaml
cat <<EOF >>kubeconfig.yaml
users:
- name: zeet-admin
  user:
    token: $TOKEN
EOF
