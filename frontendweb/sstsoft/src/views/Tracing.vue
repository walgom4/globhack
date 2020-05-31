<template>
  <div>
      <AdminTracingModal :modalVisible.sync="openModal" :userId="userId" @tracingModalClosed="openModal = false"></AdminTracingModal>

      <v-container grid-list-xl fluid>
            <v-layout row wrap>
                <v-flex lg12 sm12 xs12>
                    <v-widget title="Seguimiento"  content-bg="white">                        
                        <div slot="widget-content" class="table-wrapper">                    
                            <VueTabulator v-model="datosTable" :options="optionsTable" ref="tableRegisters"/>                        
                        </div>
                    </v-widget>  
                </v-flex>
            </v-layout>
      </v-container>
  </div>
</template>

<script>
/* eslint-disable no-unused-vars */
import VWidget from '@/components/VWidget';
import { AdminService } from "@/services/admin.service";
import AdminTracingModal from "@/components/AdminTracingModal";
export default {
    name: 'Tracing',
    components: {
        VWidget,
        AdminTracingModal  
    },
    data() {
        return {
            //opciones de configuracion de tablas
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
                    {title:"Me siento Mal", field:"ill", hozAlign:"center",formatter:"tickCross"},
                    {title:"Documento", field:"user_fk_health.id", hozAlign:"center", headerFilter:true},
                    {title:"Nombre", field:"user_fk_health.name", hozAlign:"right", headerFilter:true},
                    {title:"Apellido", field:"user_fk_health.last_name", hozAlign:"right", headerFilter:true},
                    {title:"Gripa", field:"flu", hozAlign:"center",formatter:"tickCross"},
                    {title:"Fiebre", field:"fever", hozAlign:"center",formatter:"tickCross"},
                    {title:"Tos", field:"cough", hozAlign:"center",formatter:"tickCross"},
                    {title:"Garganta Seca", field:"sore_throat", hozAlign:"center",formatter:"tickCross"},
                    {title:"Congestion Nasal", field:"nasal_congestion", hozAlign:"center",formatter:"tickCross"},
                    {title:"Fatiga", field:"fatigue", hozAlign:"right",formatter:"tickCross"},
                    {title:"Dificultad al Respirar", field:"difficult_breathe", hozAlign:"center",formatter:"tickCross"},
                    {title:"Dolor Muscular", field:"muscle_pain", hozAlign:"center",formatter:"tickCross"},
                    {title:"Diarrea", field:"diarrhea", hozAlign:"center",formatter:"tickCross"},
                    {title:"Vómito", field:"threw_up", hozAlign:"center",formatter:"tickCross"},
                    {title:"Temperatura", field:"temperature", hozAlign:"center"},
                    {title:"Fecha", field:"date", hozAlign:"center"},
                    {title:"Observaciones", field:"observations", hozAlign:"center"},
                    {title:"Atender", field:"id", formatter:function(cell, formatterParams, onRendered){
                        return "<i class = 'material-icons'>accessibility_new</i>";
                    },
                    width:100, align:"center",cellClick:(e, cell)=>{ 
                        console.log('edi', cell._cell.row.data.user_fk_health.id);
                        this.userId = cell._cell.row.data.user_fk_health.id
                        this.openModal = true
                    }},
                    {title:"Historial", field:"id", formatter:function(cell, formatterParams, onRendered){
                        return "<i class = 'material-icons'>history</i>";
                    },
                    width:100, align:"center",cellClick:function(e, cell){ 
                        console.log('hist', cell._cell.row.data.user_fk_health.id);
                    }},
                    

                ],
                placeholder: "Información de Registros Pendientes",
                height: 550,
                layout:"fitColumns",
                layoutColumnsOnNewData: true,
                tooltips: true,
                pagination: 'local',
                paginationSize: 12,
                clipboard: "copy",
                headerFilterPlaceholder:"Buscar...",
                //responsiveLayout: true
            },
            datosTable: [],
            openModal:false,
            userId: ""
        }
    },
    mounted(){
        this.getTracing()
    },
    methods: {
        async getTracing() {
            this.datosTable = []            
            const respuesta = await AdminService.getTracing()
            console.log('service', respuesta.data)
            this.datosTable = respuesta.data                    
            
        },
        edit(data){
            console.log('registro', data)
        }
    }
}
</script>

<style>
    .table-wrapper {
        width: 100%;
        height: 600px;
    }

    .tabulator .tabulator-header .tabulator-col {
        background: #800080;
        color: black;
    }

    .tabulator .tabulator-header .tabulator-col .tabulator-header-filter {
        background-color: white;
    }
</style>