#!/bin/bash

if [ "$1" = "" ]; then
  echo 'dockerコンテナの名前を指定してください'
  echo 'sh createDocker.sh コンテナ名'
  exit 1
fi

# dockerコンテナの作成
docker build . --tag $1

# インストールされたPHPのバージョンの確認
docker run --rm $1 php --run 'echo phpinfo();' | grep 'PHP Version'

echo "<? echo 'hello php7.2\n';" > index.php

# phpの実行
docker run --volume `pwd`:/root --rm $1 php index.php

exit 0
