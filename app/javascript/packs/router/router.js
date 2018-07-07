import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import About from '../components/about.vue'
import Contact from '../components/contact.vue'

Vue.use(VueRouter)

const routes = [
  { path: '', component: Index },
  { path: '/about', component: About },
  { path: '/contact', component: Contact },
]

export default new VueRouter({
  mode: 'history',
  routes: routes,
})
