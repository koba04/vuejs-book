# Vue.jsとは

Angular.jsやKnockout.jsといったフレームワークからの影響を受けているライブラリですが、Angular.jsと比較するとViewModelにフォーカスしたライブラリになっており、DOM操作については別途DirectivesやFiltersといった仕組みが用意されています。他のライブラリと組み合わせることも可能です。

Directivesを見てみるとAngular.jsから移植したようなものも多いのですが、シンプルであることが重視されていて必要最低限の実装のみがあって見通しがよいのも特徴であると言えます。

## Vue.jsの特徴

公式ページではVue.jsの特徴として*Simple*、*Fast*、*Composable*、*Compact*、*Powerful*、*Module Friendly*が挙げられています。

### Simple

HTMLとdataとなるJavaScriptのオブジェクトを定義するだけでよく、独自のフレームワークが提供しているクラスを継承したりする必要はありません。

### Fast

DOMへの反映は非同期でバッチとしてまとめて実行されるため、他のフレームワークと比較しても高速です。

### Composable

ViewModelをComponentとして再利用性があるものとして定義することが出来ます。

### Compact

他のライブラリへの依存もなく、minifyとgzippedすると約13kbとコンパクトです。

### Powerful

HTMLに書く評価式やComputed Propertiesは、自動的に依存している変数を発見し値を追跡してくれます。

### Module Friendly

ComponentやBrowserify，Bowerなど好みのモジュール管理の仕組みを使うことが出来ます。


## Hello Vue.js

```html
<div id="demo">
    <p>{{message}}</p>
    <input v-model="message">
</div>
```

```javascript
var demo = new Vue({
    el: '#demo',
    data: {
        message: 'Hello Vue.js!'
    }
})
```

これで`demo`というViewModelと`#demo`のDOM要素が関連付けられ、双方向にデータバインディングされます。

その結果、`demo.message`をJavaScriptから変更してもinputの値を変更してもModel(ViewModelのインスタンス)とView(DOM)の値は同期されます。



