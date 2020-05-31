<template>
  <v-dialog
        v-model="modalOpenLocal"
        width="700"
        persistent
    >
  
        <v-card>
          <v-card-title
            class="headline accent"
            primary-title
          >
            <span style="margin:auto; display:table;"> <strong > Editar Usuario </strong> </span> 
          </v-card-title>
  
          <v-card-text>
                <v-layout align-center justify-center>
                    <v-flex xs12 sm12 md12 lg12>
                            <v-card class="elevation-1 pa-3">
                            <v-card-text>
                                <v-form 
                                ref="form"
                                v-model="valid"
                                lazy-validation
                                @submit="login"
                                >

                                    <v-layout row wrap> 
                                        <v-flex sm6 lg6>
                                            <v-text-field
                                                append-icon="mdi-account-search"
                                                name="login"
                                                label="Usuario"
                                                type="text"
                                                :rules="userRules"
                                                v-model="model.user"
                                                color="black"
                                                required
                                            ></v-text-field>
                                        </v-flex>

                                        <v-flex sm6 lg6>
                                            <v-text-field
                                                :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
                                                name="password"
                                                label="Contraseña"
                                                id="password"
                                                :type="value ? 'password' : 'text'"
                                                @click:append="() => (value = !value)"
                                                :rules="passRules"
                                                v-model="model.password"
                                                color="black"
                                                required
                                            ></v-text-field>
                                        </v-flex>
                                        <v-btn block color="accent" type="submit" :loading="loading" :disabled="!valid">Ingresar</v-btn>
                                    </v-layout>   
                                </v-form>
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
export default {
    name: 'editarUserModal',
    data() {
        return {
            //para mostrar ocultar password
            value: String,
            loading: false,
            model: {
                user: "",
                password: ""               
            },
            valid: true,
            userRules: [
                v => !!v || "Usuario Requerido"
            ],
            passRules: [
                v => !!v || "Contraseña Requerida"
            ]
        }            
    },
    props: {
        modalLoginVisible: {
          type: Boolean,
          default: false
        }
    },
    computed: {
        modalOpenLocal: { 
            get: function () {
                return this.modalLoginVisible
            },
            set (value) {
                if (!value) {
                  this.$emit('loginModalClosed', false)
                }
            }
        }
    }
}
</script>

<style>

</style>