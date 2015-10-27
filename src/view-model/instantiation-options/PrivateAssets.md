# Private Assets

ViewModelをインスタンス化する際に指定することで、指定したViewModelと子のViewModelだけでのみ有効な`directives`や`filter`、`components`などを作成することが出来ます。

作成出来るのは下記の通りです。

* directives
* filters
* components
* partials
* transitions


```js
vm = new Vue({
  el: "#main",
  template: '{{name}} <ul><li v-repeat="list">{{ $value | addTax}}</li></ul><div v-component="banner"></div>',
  data: {
    name: "assets",
    tax: 1.05,
    list: [100, 1000, 10000]
  },
  filters: {
    addTax: function(val) {
      return +val * this.$get("tax");
    }
  },
  components: {
    banner: Vue.extend({
      template: "this is banner"
    })
  }
});

// <ul>
//  <li>105</li>
//  <li>1050</li>
//  <li>10500</li>
// </ul>
// <div>this is banner</div>
```
