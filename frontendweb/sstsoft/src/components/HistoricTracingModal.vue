<template>
    <v-dialog
        v-model="modalHOpenLocal"
        width="600"
        persistent
    >
  
        <v-card>
          <v-card-title
            class="headline accent white--text"
            primary-title
          >
            <span style="margin:auto; display:table;"> <strong > Historial Seguimiento - {{userIdLocal}}</strong> </span> 
          </v-card-title>
  
          <v-card-text>
                <v-layout align-center justify-center>
                    <v-flex xs12 sm12 md12 lg12>
                            <v-card class="elevation-1 pa-3">
                            <v-card-text>
                                <VueTabulator v-model="datosTable" :options="optionsTable" ref="tableHistoric"/> 
                            </v-card-text>
                            </v-card>
                    </v-flex>
                </v-layout>
              
          </v-card-text>
  
          <v-divider></v-divider>
  
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="accent"
              text
              @click="closeModal"
            >
              Cerrar
            </v-btn>
          </v-card-actions>
        </v-card>

    </v-dialog>
</template>

<script>
import { AdminService } from "@/services/admin.service";
export default {
    name: 'HistoricTracingModal',
    data() {
        return {
            optionsTable: {
                //autoColumns: true,
                locale: 'es',
                langs: {
                    "es":{
                        "pagination":{
                            "first":"Primera",
                            "first_title":"Primera Página", 
                            "last":"Última",
                            "last_title":"Última Página",
                            "prev":"Anterior",
                            "prev_title":"Página Anterior",
                            "next":"Siguiente",
                            "next_title":"Siguiente Página",
                        },
                    }
                },
                columns:[
                    {title:"Fecha", field:"date", hozAlign:"right", headerFilter:true},
                    {title:"Observaciones", field:"observations", hozAlign:"center", headerFilter:true}                    

                ],
                placeholder: "Información de Histórico de Seguimiento",
                height: 450,
                layout:"fitColumns",
                layoutColumnsOnNewData: true,
                tooltips: true,
                pagination: 'local',
                paginationSize: 11,
                clipboard: "copy",
                headerFilterPlaceholder:"Buscar...",
                //responsiveLayout: true
            },
            datosTable: [],
        }            
    },
    methods: {
        async getHistoricTracing() {
            this.datosTable = []            
            const respuesta = await AdminService.getHistoricTracing(this.userIdLocal)
            this.datosTable = respuesta.data                    
            
        },
        closeModal(){           
            this.modalHOpenLocal = false;
        },
    },
    props: {
        modalHVisible: {
          type: Boolean,
          default: false
        },
        userId: {
          type: String
        }
    },
    computed: {
        modalHOpenLocal: { 
            get: function () {
                return this.modalHVisible
            },
            set (value) {
                if (!value) {
                  this.$emit('historicModalClosed', false)
                }
            }
        },
        userIdLocal(){           
            return this.userId
        }
    }
}
</script>

<style>

</style>