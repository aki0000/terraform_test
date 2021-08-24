# terraform_test
Terraformの実行テスト

```
# Terraformの設定を記載した後に最初に実行するコマンド
terraform init

# Terraformの設定にしたがって、インスタンスをapply
terraform apply

# tfファイルのフォーマットを整形
terraform fmt

# tf構文の確認
terraform validate

# applyされたインスタンスを破棄
terraform destroy
# or 
terraform apply -destroy
```

## Configure kubeconfig
`eks`の場合
```
# configの出力
terraform output kubectl_config > ~/.kube/config
# configmapの出力
terraform output EKS_ConfigMap > config_map.yml
# configmapの適用
kubectl apply -f config_map.yml 
# EKSのworkernodeの接続/Statusをチェック
kubectl get nodes
NAME                         STATUS     ROLES    AGE   VERSION
ip-10-0-0-118.ec2.internal   NotReady   <none>   2s    v1.20.4-eks-6b7464
ip-10-0-1-250.ec2.internal   NotReady   <none>   4s    v1.20.4-eks-6b7464
```