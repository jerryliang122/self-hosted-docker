#!/bin/bash
# 读取环境变量token
env_token=$TOKEN
# 检查env_token是否为空
if [ -z "$env_token" ]; then
  echo "环境变量token不存在，请设置后再运行脚本"
  exit 1
fi
# 运行./config.sh命令
sudo ./bin/installdependencies.sh
./config.sh --url https://github.com/jerryliang122/self-hosted-docker --token $env_token
./run.sh
exit 0 