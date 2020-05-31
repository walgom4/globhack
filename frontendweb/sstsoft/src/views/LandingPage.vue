<template>
    <span>
        <login :modalLoginVisible.sync="openModal" @loginModalClosed="openModal = false"></login>

        <v-app light>
            <!-- Toolbar inicial -->
            <v-toolbar class="white">
                <img :src="linkImgs.logo" height="100%">
                <v-spacer></v-spacer>
                <v-toolbar-items>
                    <v-btn text class="accent" @click="openModal = true">Iniciar Sesión</v-btn>
                </v-toolbar-items>
            </v-toolbar>

            <v-content>
                <!-- Banner informativo -->
                <section>
                    <v-parallax :src="linkImgs.baner" height="600">
                        <v-layout column align-center justify-center class="black--text">
                            <h1 class="black--text mb-2 display-1 text-xs-center" style="font-weight: 900; text-shadow: 3px 2px #ffffff">!Cuidémonos Juntos!</h1>
                            <div class="black--text subheading mb-3 text-xs-center" style="text-shadow: 2px 2px #ffffff">En estos momentos de dificultad debemos estar más unidos que nunca. No dejaremos que la distancia sea un impedimento para cuidarnos. Es tú momento para aportar tu granito de arena y así lograr que todos podamos volver a trabajar de manera segura. </div>
                            <v-btn class="accent lighten-2 mt-5" dark large @click="$vuetify.goTo('#whatis')">
                            Conocer Más...
                            </v-btn>
                        </v-layout>
                    </v-parallax>
                </section>

                <!-- Parallax 1 Que es y que nos motiva-->
                <section id="whatis">

                    <v-parallax :src="linkImgs.parallax1" height="380">
                        <v-layout
                        column
                        wrap
                        class="my-5"
                        align-center
                        >
                            <v-flex xs12>
                                <v-container grid-list-xl>
                                    <v-layout row wrap align-center>
                                    <v-flex xs12 md6>
                                        <v-card class="elevation-0 transparent">
                                            <v-card-text class="text-xs-center">
                                            <v-icon x-large class="white--text text--lighten-2">mdi-comment-account</v-icon>
                                            </v-card-text>
                                            <v-card-title primary-title class="layout justify-center">
                                                <div class="headline text-xs-center white--text">¿Qué es?</div>
                                            </v-card-title>
                                            <v-card-text class="white--text">
                                                Sabemos que entender protocolos no es tan sencillo, por ello hemos diseñado esta herramienta para ayudarte de manera fácil y gráfica a conocer cómo realizar acciones de cuidado para ti y tu comunidad en tu ambiente laboral y con ello, colaborar a la mitigación de la propagación del COVID-19.
                                            </v-card-text>
                                        </v-card>
                                    </v-flex>
                                    <v-flex xs12 md6>
                                    <v-card class="elevation-0 transparent">
                                        <v-card-text class="text-xs-center">
                                            <v-icon x-large class="white--text text--lighten-2">mdi-lightbulb</v-icon>
                                        </v-card-text>
                                        <v-card-title primary-title class="layout justify-center">
                                            <div class="headline white--text">¿Qué nos motiva?</div>
                                        </v-card-title>
                                        <v-card-text class="white--text">
                                            Las personas y su bienestar, sabemos que entre todos podemos enfrentar esta pandemia y salir adelante. Somos conscientes de lo importante que es para todos regresar a trabajar, por ello, queremos brindar herramientas para que lo hagan de manera segura y sin exponerse o a sus seres queridos. Confiamos en que tú también nos ayudarás en este objetivo.
                                        </v-card-text>
                                    </v-card>
                                    </v-flex>
                                </v-layout>
                                </v-container>
                            </v-flex>
                        </v-layout>
                    </v-parallax>
                </section>

                <!-- Parallax 2 seccion de video e info como funciona-->
                <section>
                    <v-layout
                    column
                    wrap
                    class="my-5"
                    align-center
                    >
                    <v-flex xs12 text-xs-center class="mt-5">
                        <div class="headline black--text" style="font-weight: 900;">¿Cómo funciona?</div>
                    </v-flex>
                    <v-flex xs12>
                        <v-container grid-list-xl>
                        <v-layout row wrap align-center>
                            <v-flex xs12 md2>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text>
                                        <div class="image-lp">
                                            <img :src="linkImgs.todo1" height="400px">
                                        </div>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Ingresa tus datos y los de tu empresa para crear tu usuario.</div>
                                    </v-card-title>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md2>
                                <v-card class="elevation-0 transparent">                                    
                                    <v-card-text>
                                        <div class="image-lp">
                                            <img :src="linkImgs.todo2" height="400px">
                                        </div>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Registra diariamente tu estado de salud.</div>
                                    </v-card-title>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md2>
                                <v-card class="elevation-0 transparent">                                    
                                    <v-card-text>
                                        <div class="image-lp">
                                            <img :src="linkImgs.todo3" height="400px">
                                        </div>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Capacítate sobre cómo prevenir el COVID – 19.</div>
                                    </v-card-title>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md2>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text>
                                        <div class="image-lp">
                                            <img :src="linkImgs.todo4" height="400px">
                                        </div>
                                    </v-card-text>
                                    <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center">Visualiza la información de contacto de tu ARL e informa si te sientes mal.</div>
                                    </v-card-title>
                                </v-card>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-card class="elevation-0 transparent">
                                    <v-card-text>
                                        <iframe width="100%" height="500px" src="https://www.youtube.com/embed/NMmAj1EKdVo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                        </v-layout>
                        </v-container>
                    </v-flex>
                    </v-layout>
                </section>

                <!-- Parallax 3 seccion de beneficios -->
                <section>
                    <v-parallax :src="linkImgs.parallax2" height="380">
                        <v-layout
                        column
                        wrap
                        class="my-5"
                        align-center
                        >
                            <v-flex xs12>
                                <v-container grid-list-xl>
                                <v-layout row wrap align-center>
                                    <v-flex xs12 md4>
                                        <v-card class="elevation-0 transparent">
                                            <v-card-text class="text-xs-center">
                                                <v-icon x-large class="white--text text--lighten-2">mdi-factory</v-icon>
                                            </v-card-text>
                                            <v-card-title primary-title class="layout justify-center">
                                                <div class="headline text-xs-center white--text">Beneficios Empresa</div>
                                            </v-card-title>
                                            <v-card-text class="white--text">
                                                •    Capacitación a tus empleados <br />
                                                •    Resumen del estado de salud de tus empleados <br />
                                                •    Información relevante para la toma de decisiones <br />
                                                •    Apoyo en implementación de protocolos de bioseguridad <br />
                                                •    Conocer al instante si alguno de tus empleados no se siente bien <br />
                                            </v-card-text>
                                        </v-card>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                    <v-card class="elevation-0 transparent">
                                        <v-card-text class="text-xs-center">
                                        <v-icon x-large class="white--text text--lighten-2">mdi-account-plus</v-icon>
                                        </v-card-text>
                                        <v-card-title primary-title class="layout justify-center">
                                        <div class="headline white--text">Beneficios Persona</div>
                                        </v-card-title>
                                        <v-card-text class="white--text">
                                            •    Cuidarás tu salud <br />
                                            •    Reportarás tu estado de manera fácil <br />
                                            •    Te capacitarás de manera sencilla <br />
                                            •    Aprenderás cómo cuidarte y cuidar a los demás <br />
                                            •    Tendrás resumen de tu información <br />
                                            •    Podrás a través de un clic reportar si te sientes mal 
                                        </v-card-text>
                                    </v-card>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                    <v-card class="elevation-0 transparent">
                                        <v-card-text class="text-xs-center">
                                        <v-icon x-large class="white--text text--lighten-2">mdi-account-multiple</v-icon>
                                        </v-card-text>
                                        <v-card-title primary-title class="layout justify-center">
                                        <div class="headline text-xs-center white--text">Beneficios Comunidad</div>
                                        </v-card-title>
                                        <v-card-text class="white--text">
                                            •    Compartir información de cuidado con seres cercanos <br />
                                            •    Desarrollar hábitos de cuidado personal <br />
                                            •    Colaborar con el gobierno para reporte oportuno de información relevante al COVID-19 <br />
                                            •    Cuidándote a ti, nos cuidas a todos <br />
                                        </v-card-text>
                                    </v-card>
                                    </v-flex>
                                </v-layout>
                                </v-container>
                            </v-flex>
                        </v-layout>
                    </v-parallax>
                </section>

                <!-- Formulario contacto-->
                <section>
                    <v-container grid-list-md>                
                    <v-layout row wrap>
                    <v-flex xs12 text-xs-center class="mt-5">
                        <div class="headline">Contacto</div>
                    </v-flex>
                    <v-flex xs8 offset-xs2>

                        <v-card class="elevation-0 transparent">

                            <v-card-text>
                            <v-flex xs12>
                                <v-text-field color="accent" filled label="Email" :rules="emailRules" v-model="email" hint="Ingrese su Email!" persistent-hint></v-text-field>
                            </v-flex>

                            <v-flex xs12>
                                <v-text-field color="accent" filled label="Teléfono" v-model="telefono" hint="Ingrese su número de Telefono!" persistent-hint></v-text-field>
                            </v-flex>

                            <v-flex xs12>
                                <v-text-field color="accent" filled multi-line :rules="asuntoRules" label="Asunto" v-model="asunto"></v-text-field>
                            </v-flex>
                            <v-flex xs12 class="text-xs-center">
                                <v-btn class="accent lighten-2 mb-5" dark large @click="contact">Enviar</v-btn>
                            </v-flex>
                            </v-card-text>

                        </v-card>

                            </v-flex>
                        </v-layout>
                    </v-container>
                </section>

                <!-- footer -->
                <v-footer dark padless>
                    <v-card
                        flat
                        tile
                        class="accent lighten-1 white--text text-center"
                    >
                        <v-card-text>
                        <v-btn
                            v-for="icon in iconos"
                            :key="icon"
                            class="white--text"
                            icon
                        >
                            <v-icon size="24px">{{ icon }}</v-icon>
                        </v-btn>
                        </v-card-text>
                
                        <v-card-text class="white--text pt-0">
                        Phasellus feugiat arcu sapien, et iaculis ipsum elementum sit amet. Mauris cursus commodo interdum. Praesent ut risus eget metus luctus accumsan id ultrices nunc. Sed at orci sed massa consectetur dignissim a sit amet dui. Duis commodo vitae velit et faucibus. Morbi vehicula lacinia malesuada. Nulla placerat augue vel ipsum ultrices, cursus iaculis dui sollicitudin. Vestibulum eu ipsum vel diam elementum tempor vel ut orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
                        </v-card-text>
                
                        <v-divider></v-divider>
                
                        <v-card-text class="white--text">
                        {{ new Date().getFullYear() }} — <strong>SSTSOFT</strong>
                        </v-card-text>
                    </v-card>
                </v-footer>

            </v-content>
        </v-app>  
    </span>
    
</template>

<script>
import Login from "@/components/LoginModal";
export default {
  name: "LandingPage",
  components: {
    Login
  },
  data: function() {
    return {
      title: "SSTSOFT",
      linkImgs: {
        logo: require(`@/assets/sstlogo.png`),
        baner: require(`@/assets/Banner1.png`),
        parallax1: require(`@/assets/Parallax1.png`),
        parallax2: require(`@/assets/Parallax2.png`),
        todo1: require(`@/assets/1.png`),
        todo2: require(`@/assets/2.png`),
        todo3: require(`@/assets/3.png`),
        todo4: require(`@/assets/4.png`),
      },
      iconos: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-linkedin',
        'mdi-instagram',
      ],
      email: "",
      telefono: "",
      asunto: "",
      asuntoRules: [
        v => {
          return !!v || "Asunto Requerido";
        },
        v =>
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          "E-mail debe ser válido"
      ],
      emailRules: [
        v => {
          return !!v || "Email Requerido";
        },
        v =>
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          "E-mail debe ser válido"
      ],
      openModal: false
    }
  },
  methods: {
    contact(){
        console.log('Contacto!')
    }
  }
}
</script>

<style scoped>
    .image-lp img{
        max-width: 100%;
        display : block;
        margin : auto;
    }
</style>