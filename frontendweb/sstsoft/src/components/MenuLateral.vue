<template>
    <v-navigation-drawer
        persistent
        permanent
        :mini-variant="miniVariant"
        :clipped="clipped"
        v-model="drawer"
        enable-resize-watcher
        fixed
        app
        :width="225"
    >
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
    data() {
      return {
        clipped: false,
        drawer: true,
        fixed: false,
        items: [
          {
            icon: "dashboard",
            title: "Dashboard",
            link: "/dashboard",
            visible: true
          },
          {
            icon: "assignment",
            title: "Accion1",
            link: "/Accion1",
            visible: true
          },
          {
            icon: "edit_location",
            title: "Accion2",
            link: "/Accion2",
            visible: true
          }          
        ],
        miniVariant: false,
        
      };
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

<style scoped>
.lista {
    background-color: #000000 !important;
}


</style>
