export default [
  {
    path: "*",
    meta: {
        public: true
    },
    redirect: {
        path: "/admin"
    }
  },
  {
    path: '/landingpage',
    name: 'LandingPage',
    component: () => import('@/views/LandingPage.vue')
  },
  {
    path: '/admin',
    name: 'Admin',
    component: () => import('@/views/Admin.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/About.vue')
  }
]