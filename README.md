# aureole
nginxとさくらクラウドのAppRunの色々実験用

## setup
`.env`に環境変数を設定してください

|name|value|
|--|--|
|`CONTAINER_REGISTORY`| イメージをpushするコンテナレジストリのホスト名 |
|`OAUTH2_REDIRECT_URL`| OAuth2のコールバックURL `${hostname}/oauth2/callback`になるはず|
|`OAUTH2_CLIENT_ID`| OAuth2のクライアントID|
|`OAUTH2_COOKIE_SECRET`| OAuth2Proxyの手順で作成したシークレット |
|`OAUTH2_CLIENT_SECRET` | OAuth2のクライアントシークレット|
