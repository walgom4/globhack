export default [
  {
    path: "*",
    meta: {
        public: true
    },
    redirect: {
        path: "/landingPage"
    }
  },
  {
    path: '/landingpage',
    meta: {
        public: true
    },
    name: 'LandingPage',
    component: () => import('@/views/LandingPage.vue')
  },
  {
    path: '/user',
    meta: {
        public: false
    },
    name: 'User',
    component: () => import('@/views/User.vue')
  },
  {
    path: '/registers',
    meta: {
        public: false
    },
    name: 'Registers',
    component: () => import('@/views/Registers.vue')
  },
  {
    path: '/reports',
    meta: {
        public: false
    },
    name: 'Reports',
    component: () => import('@/views/Reports.vue')
  },
  {
    path: '/tracing',
    meta: {
        public: false
    },
    name: 'Tracing',
    component: () => import('@/views/Tracing.vue')
  },
  {
    path: '/info',
    meta: {
        public: false
    },
    name: 'Information',
    component: () => import('@/views/Information.vue')
  },
  {
    path: '/arl',
    meta: {
        public: false
    },
    name: 'Arl',
    component: () => import('@/views/Arl.vue')
  },
  {
    path: "/404",
    meta: {
        public: true
    },
    name: "NotFound",
    component: () =>
        import(`@/pages/NotFound.vue`)
  },
  {
    path: "/403",
    meta: {
        public: true
    },
    name: "AccessDenied",
    component: () =>
        import(`@/pages/Deny.vue`)
  },
  {
    path: "/500",
    meta: {
        public: true
    },
    name: "ServerError",
    component: () =>
        import(`@/pages/Error.vue`)
  },
]