# template

`vm.$el`に挿入されるtemplateを文字列で指定します。`vm.$el`の中に存在していた要素は全てここで指定したtemplate文字列によって置き換えられます。

**replace**のoptionが`true`に指定されている場合は、`el`の中に挿入されるのではなく`el`を上書きします。
(詳しくは**replace**を参照してください)

`#`ではじまる文字列をtemplateに指定した場合は`querySelector`として評価され、取得した要素の`innnerHTML`が使用されます。

これは`<script type="x-template">`によってtemplateの指定したい場合に便利です。

```js
vm = new Vue({
  template: "#some-template"
});

vm = new Vue({
  template: '<div v-text="name"></div>'
});
```

```html
<script type="x-template" id="some-template">
  <div v-text="name"></div>
</script>
```

## Vue.jsのtemplate

Vue.jsはDOMベースのtemplateを使用します。

そして、Vue.jsのcompilerはDOM要素を走査してdirectivesを探しながらデータバインディングを作成しています。

これが何を意味しているのかというと、templateは実際にDOMに変換可能な文字列である必要があるということです。

Vue.jsはDOM fragmentにtemplateを入れておいて、ViewModelのインスタンスを再生するときにそれをcloneして使用します。

また、もしあなたがvalidなHTMLであることを求めるのであれば、direcitveのprefixを`data-`に変更することが出来ます。

```js
Vue.config({
  prefix: "data"
});
```


