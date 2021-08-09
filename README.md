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