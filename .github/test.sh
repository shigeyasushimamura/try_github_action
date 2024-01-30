#!/bin/bash

# 変数名は_を-の代わりに利用
builder_containerA=app-back-builder
builder_containerB=app-back-builder


docker image ls ${builder_containerA}
docker image ls ${builder_containerB}

docker run -it --rm --name builder --detach ${builder_containerA} /bin/bash
docker run -it --rm --name builder --detach ${builder_containerB} /bin/bash


# テスト実行
docker exec ${builder_containerA} /bin/bash test.sh
docker exec ${builder_containerB} /bin/bash test.sh

# 起動コンテナの停止・削除
docker stop  ${builder_containerA} 
docker stop  ${builder_containerB} 