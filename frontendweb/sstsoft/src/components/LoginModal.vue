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
            <span style="margin:auto; display:table;"> <strong > Login </strong> </span> 
          </v-card-title>
  
          <v-card-text>
                <v-layout align-center justify-center>
                    <v-flex xs12 sm12 md12 lg12>
                            <v-card class="elevation-1 pa-3">
                            <v-card-text>
                                <div class="layout column align-center">
                                    <img src="@/assets/sstlogo.png" alt="Satlock WEB" width="200" height="120">
                                </div>
                                <v-form 
                                ref="form"
                                v-model="valid"
                                lazy-validation
                                @submit="login"
                                >
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
                                <v-btn block color="accent" type="submit" :loading="loading" :disabled="!valid">Ingresar</v-btn>
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
/* eslint-disable no-unused-vars */
import { AdminService } from "@/services/admin.service";
import { TokenService } from "@/services/storage.service";
import router from "@/router/index";
export default {
    name: 'login',
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
    methods: {
        async login(e){
            e.preventDefault()
            if (this.$refs.form.validate()) {
                const recursos = await AdminService.login(this.model);
                if(recursos.data.key){
                    TokenService.setKey(recursos.data.key);
                    TokenService.setUser(this.model.user);
                    TokenService.setUserPw(this.model.password);
                    router.push({ name: "User" }).catch(err => {});
                }
            }
        },
        closeModal(){           
            this.modalOpenLocal = false;
            this.resetForm();
        },
        resetForm(){
            this.model.user = ""
            this.model.password = ""
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

<style scoped>
    #login {
        height: 50%;
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
        content: "";
        z-index: 0;
    }
</style>