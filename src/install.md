# インストール

Vue.jsではIE8はサポートしてないのでIE8のサポートが必要な場合は使用することが出来ません。

## そのまま使用する場合

公式サイトからダウンロードしたファイルをそのままscriptタグで読み込むと、*Vue*というグローバル変数がexportされます。

また、[cdnjs](http://cdnjs.com/)にもホスティングされていますし、[bower](http://bower.io/)を使用することも出来ます。

## モジュールビルドライブラリを使用する場合

Vue.jsがビルドで使用している[component](http://component.io/)や[browserify](http://browserify.org/)を使って`require`で読み込む方法もサポートされています。

```javascript
var Vue = require('vue');
```
