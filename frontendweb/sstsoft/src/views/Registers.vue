<template>
  <div>
     <EditUserModal :modalLoginVisible.sync="openModal" @loginModalClosed="openModal = false"></EditUserModal>

      <v-container grid-list-xl fluid>
            <v-layout row wrap>
                <v-flex lg12 sm12 xs12>
                    <v-widget title="Registros Pendientes"  content-bg="white">                        
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
import EditUserModal from "@/components/EditUserModal";
export default {
    name: 'Registers',
    components: {
        VWidget,
        EditUserModal   
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
                    {title:"Documento", field:"id", hozAlign:"center", headerFilter:true},
                    {title:"Apellido", field:"last_name", hozAlign:"right", headerFilter:true},
                    {title:"Nombre", field:"name", hozAlign:"center", headerFilter:true},
                    {title:"Teléfono", field:"phone", hozAlign:"center", headerFilter:true},
                    {title:"E-mail", field:"email", hozAlign:"center", headerFilter:true},
                    {title:"Dirección", field:"address", hozAlign:"center", headerFilter:true},
                    {title:"Editar", field: "ID" ,formatter:function(cell, formatterParams, onRendered){
                        return "<i class = 'material-icons'>edit</i>";
                    },
                    width:100, align:"center",cellClick:(e, cell)=>{ 
                        console.log('edi', cell._cell.row.data.id);
                        this.openModal = true
                    }},
                    

                ],
                placeholder: "Información de Registros Pendientes",
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
            openModal:false
        }
    },
    mounted(){
        this.getUserRegisters()
    },
    methods: {
        async getUserRegisters() {
            this.datosTable = []            
            const respuesta = await AdminService.getRegisters()
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
        height: 450px;
    }

    .tabulator .tabulator-header .tabulator-col {
        background: #800080;
        color: black;
    }

    .tabulator .tabulator-header .tabulator-col .tabulator-header-filter {
        background-color: white;
    }
</style>