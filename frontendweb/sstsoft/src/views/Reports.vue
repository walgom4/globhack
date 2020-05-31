<template>
  <div>

      <v-container grid-list-xl fluid>
            <v-layout row wrap>
                <!-- Grafica lavado de manos-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Lavado de Manos" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" @click="getInicialesFinales" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="pieJsonInFin" ref="pieInFin" :autoresize="true" @click="getDataInFinFromGraph" @legendselectchanged="legendReactive($event, pieJsonInFin)" ></chart>   
                            <!-- @restore="restaurar($event, 'getInicialesFinales')" -->
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica bien mal-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Sanos / Con Sintomas" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" @click="getInicialesFinales" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="pieJsonInFin" ref="pieInFin" :autoresize="true" @click="getDataInFinFromGraph" @legendselectchanged="legendReactive($event, pieJsonInFin)" ></chart>   
                            <!-- @restore="restaurar($event, 'getInicialesFinales')" -->
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica casa trabajo-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Casa / Trabajo" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" @click="getInicialesFinales" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="pieJsonInFin" ref="pieInFin" :autoresize="true" @click="getDataInFinFromGraph" @legendselectchanged="legendReactive($event, pieJsonInFin)" ></chart>   
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica sintomas-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Por Sintomas" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" @click="getInicialesFinales" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="pieJsonInFin" ref="pieInFin" :autoresize="true" @click="getDataInFinFromGraph" @legendselectchanged="legendReactive($event, pieJsonInFin)" ></chart>
                        </div>
                    </v-widget>  
                </v-flex>  

            </v-layout>
      </v-container>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>