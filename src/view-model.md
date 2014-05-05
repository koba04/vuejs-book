# ViewModel

ViewModelはVueのコンストラクタから作成することが出来ます。

```javascript
vm = new Vue({
  data: {
    name: "foo",
  }
});
```

## View

`vm.$el`で参照することが出来るDOMオブジェクトがViewを担っています。

データが変更された場合は非同期でViewに反映されるためパフォーマンスにも優れています。

* requestAnimationFrame(webkitRequestAnimationFrame)が利用できる環境ではそれを使用し、使用できない環境ではsetTimeoutを0msでの呼び出しを使用します。

`$el`を使ってDOM操作することはあまりなくて、そういった場合はDirectiveやFilterを使うといいでしょう。

## Model

データ自体はただのJavaScriptのオブジェクトであり、Object.definePropertyを使って変更や参照を監視していることが特徴です。

