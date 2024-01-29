#!/bin/bash


builder_container=<builderイメージ名>
docker image ls ${builder_container}

docker run -it --rm --name builder --detach ${builder_container} /bin/bash

# テスト実行
docker exec builder /bin/bash <呼び出し先test.shのコンテナ上におけるファイルパス>

# 起動コンテナの停止・削除
docker stop builder