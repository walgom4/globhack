<template>
  <span>
        <div>
            <v-container grid-list-xl fluid>
                    <v-layout row wrap>
                        <!-- Tabla atencion eventos usuario-->
                        <v-flex lg12 sm12 xs12>
                            <v-widget title="Bienvenido Usuario X"  content-bg="white" >
                                <div slot="widget-content" class="wrapper">

                                        <v-row dense>
                                            <v-col
                                                v-for="card in cards"
                                                :key="card.title"
                                                :cols="card.flex"
                                            >
                                                <v-card :to="card.url">
                                                <v-img
                                                    :src="card.src"
                                                    class="white--text align-end"
                                                    gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                                    height="250px"
                                                >
                                                    <v-card-title v-text="card.title"></v-card-title>
                                                </v-img>

                                                <v-card-text>
                                                    {{card.text}}
                                                </v-card-text>
                                                </v-card>
                                            </v-col>
                                        </v-row>

                                </div>
                            </v-widget>
                        </v-flex>
                    </v-layout>
            </v-container>
        </div>
  </span>
</template>

<script>
import VWidget from '@/components/VWidget';
export default {
    name: 'user',
    components: {
        VWidget
    },
    data: () => ({
        cards: [
        { title: 'Registros Pendientes', src: require(`@/assets/RegistrosPendientes.png`),  text: "Verifica los nuevos usuarios y completa su información.", url:"/registers", flex: 4 },
        { title: 'Estadísticas', src: require(`@/assets/Estadisticas.png`), text: "Da un vistazo general a la situación de tu empresa.", url:"/reports", flex: 4 },
        { title: 'Seguimientos', src: require(`@/assets/Seguimientos.png`), text: "Controla y verifica el estado de tus empleados.", url:"/tracing", flex: 4 },
        { title: 'Información', src: require(`@/assets/Informacion.png`), text: "Accede a las capacitaciones y mantente seguro.", url:"/info", flex: 6 },
        { title: 'ARL', src: require(`@/assets/ARL.png`), text: "Revisa y edita la información de tu ARL.", url:"/arl", flex: 6 }
        ],
    }),
}
</script>

<style>
    .wrapper {
        width: 100%;
        height: 700px;
    }
</style>