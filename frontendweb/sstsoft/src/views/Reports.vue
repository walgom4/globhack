<template>
  <div>

      <v-container grid-list-xl fluid>
            <v-layout row wrap> 

                <!-- Grafica Registro diario Síntomas-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Registro diario Síntomas" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="jsonDiario" ref="diario" :autoresize="true"></chart>
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica Estado del Personal-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Estado del Personal" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="jsonPersonal" ref="personal" :autoresize="true"></chart>   
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica casa vs trabajo-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Casa / Trabajo" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="jsonCasa" ref="casa" :autoresize="true"></chart>
                        </div>
                    </v-widget>  
                </v-flex>  

                <!-- Grafica lavado de manos-->   
                <v-flex lg6 sm12 xs12>
                    <v-widget title="Registro Lavado de Manos" content-bg="white">
                        <v-btn icon slot="widget-header-action">
                            <v-tooltip bottom>
                                <template v-slot:activator="{ on }">
                                    <v-icon class="text--secondary" v-on="on">refresh</v-icon>
                                </template>
                                <span>Recargar</span>
                            </v-tooltip>
                        </v-btn>
                        <div slot="widget-content" class="chart-wrapper">                       
                            <chart :options="jsonManos" ref="manos" :autoresize="true"></chart>
                        </div>
                    </v-widget>  
                </v-flex> 

            </v-layout>
      </v-container>
  </div>
</template>

<script>
import casatrabajo from "@/json_templates/casatrabajo";
import diario from "@/json_templates/diario";
import personal from "@/json_templates/personal";
import lavadomanos from "@/json_templates/lavadomanos";
import VWidget from '@/components/VWidget';
export default {
    name: 'Reports',
    components: {
    VWidget   
  },
    data() {
        return {
            jsonDiario: diario,
            jsonPersonal: personal,
            jsonCasa: casatrabajo,
            jsonManos: lavadomanos 
        }
    },
}
</script>

<style>
    .chart-wrapper {
        width: 100%;
        height: 400px;
    }
    .echarts {
        width: 100%;
        height: 100%;
    }
</style>