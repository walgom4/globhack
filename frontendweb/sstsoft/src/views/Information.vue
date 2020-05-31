<template>
  <span>
    <v-container grid-list-xl fluid>
            <v-layout row wrap> 

                <!-- Carrousel de infografia-->   
                <v-flex lg12 sm12 xs12>
                    <v-widget title="Infografía" content-bg="white">
                        <v-btn icon slot="widget-header-action">                            
                        </v-btn>
                        <div slot="widget-content" class="info-wrapper">                       
                            <v-carousel height="900px">
                              <v-carousel-item
                                v-for="(item,i) in itemsFiltered"
                                :key="i"
                                reverse-transition="fade-transition"
                                transition="fade-transition"
                              >
                              <img :src="item.image" style="width:100%;height:100%;"/>
                              </v-carousel-item>
                            </v-carousel>
                        </div>
                    </v-widget>  
                </v-flex>  

            </v-layout>
    </v-container>
  </span>
</template>

<script>
import VWidget from '@/components/VWidget';
import { AdminService } from "@/services/admin.service";
export default {
    name: 'Information',
    components: {
      VWidget   
    },
    data() {
        return {
          items: []
        }
    },
    mounted(){
        this.getWebRegisters()
    },
    methods: {
        async getWebRegisters() {
            this.items = []            
            const respuesta = await AdminService.getResources()
            this.items = respuesta.data                    
            
        }
    },
    computed: {
        itemsFiltered: function() {
            return this.items.filter(function(u) {
                return u.image !== null
            })
        }
    }

}
</script>

<style>
  .info-wrapper {
        width: 100%;
        height: 1000px;
    }
</style>