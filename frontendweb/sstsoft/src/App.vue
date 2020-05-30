<template>
  <v-app>
      <MenuPrincipal/>           
      <MenuLateral/>
      <v-content>
        <router-view></router-view>
      </v-content>

      <v-footer
          absolute
          fixed
          dark
          class="font-weight-medium"
          color="black"
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
    //
  }),
};
</script>
