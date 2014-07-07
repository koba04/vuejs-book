# replace

template文字列で`el`で指定している要素自体を置き換えるかどうか指定します。

この要素が有効なのは、`el`に親要素があって、templateのroot要素となる要素が1つだけの場合です。
また、`el`で指定されていた属性値はそのままtemplateのroot要素にコピーされます。

```html
<section><div id="main" class="main">xxxx</div></section>
```
```js
vm = new Vue({
  el: "#main",
  replace: true,
  template: '<p v-text="name"></p>',
  data: {
    name: "koba04"
  }
});

console.log(document.body.innerHTML);
// <section><p class="main" id="main">koba04</p></section>
```
http://jsfiddle.net/koba04/6aQWL/

