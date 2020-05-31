import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';

import "@/plugins/echarts";

import VueCookies from 'vue-cookies'
Vue.use(VueCookies);

import VueTabulator from "vue-tabulator";
Vue.use(VueTabulator);


Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
