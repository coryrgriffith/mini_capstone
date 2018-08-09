/* global Vue, VueRouter, axios */

var OrdersPage = {
  template: "#orders-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      orders: []
    };
  },
  created: function() {
    axios.get('/api/orders').then(function(response) {
      this.orders = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get('/api/products').then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/orders", component: OrdersPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});