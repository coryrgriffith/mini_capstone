/* global Vue, VueRouter, axios */
var EditProductPage = {
  template: "#edit-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      supplier_id: "",
      description: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response);
      this.name = response.data.name;
      this.price = response.data.price;
      this.supplier_id = response.data.supplier.id;
      this.description = response.data.description;
    }.bind(this));
    console.log("edit action");
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name, 
        input_price: this.price,
        input_supplier_id: this.supplier_id,
        input_description: this.description
      };
      console.log(params);
      axios
        .patch("/api/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var ProductPage = {
  template: "#product-page",
  data: function() {
    return {
      product: {
        name: "",
        price: "",
        description: "",
        supplier: ""
      }
    };
  },
  created: function() {
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      supplier_id: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name, 
        input_price: this.price,
        input_supplier_id: this.supplier_id,
        input_description: this.description
      };
      console.log(params);
      axios
        .post("/api/products", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ProductsPage = {
  template: "#products-page",
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
      products: [],
      productFilter: "",
      sortAttribute: "name",
      sortOrder: 1
    };
  },
  created: function() {
    axios.get('/api/products').then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {
    setSortAttribute: function(attribute) {
      this.sortAttribute = attribute;
    },
    toggleSortOrder: function() {
      this.sortOrder = this.sortOrder * -1;
    }
  },
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/orders", component: OrdersPage},
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: NewProductPage},
    { path: "/products", component: ProductsPage},
    { path: "/products/:id", component: ProductPage},
    { path: "/products/:id/edit", component: EditProductPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});