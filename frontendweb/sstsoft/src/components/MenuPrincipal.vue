<template>
    <span>
        <v-app-bar dark flat fixed app class="accent">
            

            <!-- menu para pantalla pequeña -->
            <span class="hidden-md-and-up">
              <v-menu>
                <template v-slot:activator="{ on }">
                  <v-app-bar-nav-icon v-on="on"></v-app-bar-nav-icon>
                </template>
                <v-list>
                  <v-list-item v-for="item in itemsFiltered" :key="item.icon" :to="item.link" active-class="accent">
                    <v-list-item-content>
                      <v-list-item-title>{{ item.title }}</v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>   
                </v-list>
              </v-menu>
            </span>
            <!-- fin menu -->

              <img :src="srcImage" width="10%" class="hidden-sm-and-down">
              <v-btn
                class="hidden-sm-and-down"
                v-for="item in itemsFiltered"
                :key="item.icon"
                :to="item.link"
                color="accent"
                depressed
                large
              >{{ item.title }}</v-btn>
            

            <v-spacer></v-spacer>

            <!-- dropdown menu -->
            <v-menu offset-y>
                <template v-slot:activator="{ on }">
                  <v-btn text v-on="on" color="black">
                    <v-icon left>expand_more</v-icon>
                    <span>Menú</span>
                  </v-btn>
                </template>
                <v-list>
                    <v-list-item v-for="link in menu" :key="link.text">
                      <v-list-item-action>
                          <v-icon v-html="link.icon"></v-icon>
                      </v-list-item-action>

                        <v-list-item-title @click="selectorEventos(link.action)">{{ link.text }}</v-list-item-title>
                     
                    </v-list-item>

                </v-list>
            </v-menu>

        </v-app-bar>
    </span>
</template>

<script>
export default {
    data() {
      return {
        srcImage: require(`@/assets/sstlogo.png`),
        clipped: false,
        items: [
          {
            icon: "map",
            title: "Ver1",
            link: "/Ver1",
            visible: true
          },
          {
            icon: "dashboard",
            title: "Ver2",
            link: "/dashboard",
            visible: true
          }         
        ],
        title: "SSTSOFT",
        menu: [
            { icon: 'exit_to_app', text: 'Salida', action: 'logout' }
        ]

      };
    },
    methods:{
      managePerfil(){
        // eslint-disable-next-line no-unused-vars
        this.$router.push({ path: "/perfil" }).catch(err => {});
      },
      selectorEventos(name) {
        this[name]();
      }
    },
    computed: {
        itemsFiltered: function() {
            return this.items.filter(function(u) {
                return u.visible
            })
        }
    }
}
</script>

<style>
.v-list{
  cursor: pointer;
}

#app > div.v-application--wrap > span > header > div > a.hidden-sm-and-down.v-btn--active.v-btn.v-btn--depressed.v-btn--router.theme--dark.v-size--default.accent {
  color: transparent;
}

#app > div.v-application--wrap > span > header > div > a.hidden-sm-and-down.v-btn--active.v-btn.v-btn--depressed.v-btn--router.theme--dark.v-size--default.accent > span {
  color: white;
}

#app > div > span > header > div > a:nth-child(3) {
    color: transparent;
}
#app > div > span > header > div > a:nth-child(3) > span {
    color: white;
}

#app > div.v-application--wrap > span > header > div > a:nth-child(4) {
  color: transparent;
}

#app > div.v-application--wrap > span > header > div > a:nth-child(4) > span {
    color: white;
}

</style>
