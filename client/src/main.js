import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUI  from "mint-ui"
import "mint-ui/lib/style.css"
import {Swipe,SwipeItem} from 'vant'
import 'vant/lib/index.css';
import { Lazyload } from 'vant';
import "./font/iconfont.css"
import { Tabbar, TabbarItem } from 'vant';

Vue.use(Tabbar);
Vue.use(TabbarItem);
Vue.use(Lazyload);
Vue.use(MintUI);
Vue.config.productionTip = false;
Vue.use(Swipe);
Vue.use(SwipeItem);

// 功能一：引入axios库
// 1.引入axios库
import axios from "axios";
// 2.配置记录服务器基础路径
axios.defaults.baseURL="http://127.0.0.1:4000/";
// 3.配置保存session数据
axios.defaults.withCredentials=true;
// 4.注册
Vue.prototype.axios=axios;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
