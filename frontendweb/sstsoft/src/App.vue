<template>
  <v-app>
    
      <MenuPrincipal @emitDrawer="emittedDrawer"  v-if="!$route.meta.public"/>           
      <MenuLateral :drawerL="drawer" v-if="!$route.meta.public"/>
      <v-content>
        <router-view></router-view>
      </v-content>

      <v-footer
          absolute
          fixed
          dark
          class="font-weight-medium"
          color="black"
          v-if="!$route.meta.public"
        >
          <v-col
            class="text-center"
            cols="12"
          >
            &copy;{{ new Date().getFullYear() }} — <strong>SSTSOFT&reg;</strong>
          </v-col>
        </v-footer>
  </v-app>
</template>

<script>
import MenuLateral from '@/components/MenuLateral';
import MenuPrincipal from '@/components/MenuPrincipal';

export default {
  name: 'App',
  components: {
    MenuLateral,
    MenuPrincipal
  },

  data: () => ({
    drawer: false
  }),
  methods:{
    emittedDrawer(value){
      this.drawer = value
    }
  }
};
</script>
