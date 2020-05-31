<template>
    <v-navigation-drawer
        persistent
        permanent
        :mini-variant="drawerChange"
        :clipped="clipped"
        v-model="drawer"
        enable-resize-watcher
        fixed
        app
        :width="225"
    >
      <!-- Tarjeta de usuario -->
      <v-list-item two-line style="background-color:gray;" :class="drawerChange && 'px-0'">
              <v-list-item-avatar > 
                <img src="https://randomuser.me/api/portraits/men/81.jpg">
              </v-list-item-avatar>
  
              <v-list-item-content>
                <v-list-item-title>Un empleado</v-list-item-title>
                <v-list-item-subtitle>De un área</v-list-item-subtitle>
              </v-list-item-content>
      </v-list-item>
        
        <!-- menu lateral -->
        <v-list class="lista">
            <v-list-item v-for="(item, i) in itemsFiltered" :key="i" :to="item.link">
                <v-list-item-action>
                    <v-icon v-html="item.icon" class="white--text"></v-icon>
                </v-list-item-action>

                <v-list-item-content>
                    <v-list-item-title class="white--text">{{item.title}}</v-list-item-title>
                </v-list-item-content>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>
    
</template>

<script>
export default {
    name: "MenuLateral",
    props: {
        drawerL: {
            type: Boolean,
            default: true
        },
    },
    data() {
      return {
        clipped: false,
        drawer: true,
        fixed: false,
        items: [
          {
            icon: "mdi-account-star",
            title: "Menú Principal",
            link: "/user",
            visible: true
          },
          {
            icon: "mdi-folder-multiple",
            title: "Registros Pendientes",
            link: "/registers",
            visible: true
          },
          {
            icon: "mdi-chart-pie",
            title: "Estadísticas",
            link: "/reports",
            visible: true
          },
          {
            icon: "mdi-account-switch",
            title: "Seguimientos",
            link: "/tracing",
            visible: true
          },
          {
            icon: "mdi-information",
            title: "Información",
            link: "/info",
            visible: true
          },
          {
            icon: "mdi-hospital-building",
            title: "ARL",
            link: "/arl",
            visible: true
          }          
        ]
        
      };
    },    
    computed: {
        itemsFiltered: function() {
            return this.items.filter(function(u) {
                return u.visible
            })
        },
        drawerChange: {
            get: function () {
                return this.drawerL
            },
            set (value) {
                if (!value) {
                  this.$emit('drawerChanged')
                }
            }
        }
    }
}
</script>

<style scoped>
.lista {
    background-color: #000000 !important;
}


</style>
