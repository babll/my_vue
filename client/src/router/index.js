import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../components/sc/Login.vue'
import Reg from '../components/sc/Reg.vue'
import Index from '../components/sc/Index.vue'
import Cart from '../components/sc/cart.vue'
import List from '../components/sc/List.vue'
import Details from '../components/sc/Details.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/Home',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path: '/reg',
    name: 'Reg',
    component: Reg
  },
  {
    path: '/index',
    name: 'Index',
    component: Index
  },
  {
    path: '/cart',
    name: 'Cart',
    component: Cart
  },
  {
    path: '/list',
    name: 'List',
    component: List
  },
  {
    path: '/Details',
    name: 'Details',
    component: Details
  }
]

const router = new VueRouter({
  routes
})

export default router
