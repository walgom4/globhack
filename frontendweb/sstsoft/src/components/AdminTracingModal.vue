<template>
    <v-dialog
        v-model="modalOpenLocal"
        width="600"
        persistent
    >
  
        <v-card>
          <v-card-title
            class="headline accent white--text"
            primary-title
          >
            <span style="margin:auto; display:table;"> <strong > Añadir Seguimiento - {{userIdLocal}}</strong> </span> 
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
                                @submit="addObservation"
                                >

                                <v-container grid-list-xl fluid>
                                        <v-layout row wrap>
                                            <v-flex lg12 sm12>
                                                <v-menu
                                                    accent
                                                    ref="menu"
                                                    v-model="menu"
                                                    :close-on-content-click="false"
                                                    :return-value.sync="date"
                                                    transition="scale-transition"
                                                    offset-y
                                                    min-width="290px"
                                                    >
                                                    <template v-slot:activator="{ on }">
                                                        <v-text-field
                                                        color="accent"
                                                        v-model="date"
                                                        label="Fecha"
                                                        prepend-icon="event"
                                                        readonly
                                                        v-on="on"
                                                        ></v-text-field>
                                                    </template>
                                                    <v-date-picker color="accent" v-model="date" no-title scrollable>
                                                        <v-spacer></v-spacer>
                                                        <v-btn text color="accent" @click="menu = false">Cancelar</v-btn>
                                                        <v-btn text color="accent" @click="$refs.menu.save(date)">OK</v-btn>
                                                    </v-date-picker>
                                                </v-menu>
                                            </v-flex> 

                                            <v-flex lg12 sm12>
                                                <v-text-field color="accent" filled multi-line label="Oservaciones" v-model="model.observations"></v-text-field>
                                            </v-flex>
                                    </v-layout>
                                </v-container>                                     
                                        
                                    <v-btn block color="accent" type="submit" :disabled="!valid">Agregar</v-btn>
                                      
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
import { AdminService } from "@/services/admin.service";
export default {
    name: 'AdminTracingModal',
    data() {
        return {
            model: {
                id: "",
                observations: true              
            },
            valid: true,
            date: new Date().toISOString().substr(0, 10),
            menu: false
        }            
    },
    props: {
        modalVisible: {
          type: Boolean,
          default: false
        },
        userId: {
          type: String
        }
    },
    methods: {
        closeModal(){           
            this.modalOpenLocal = false;
            this.resetForm();
        },
        resetForm(){
            this.model.id = ""
            this.model.observations = ""
        },
        async addObservation(e){
            e.preventDefault()
            if (this.$refs.form.validate()) {
                
                this.model.id = this.userIdLocal
                this.model.area_fk_user = this.area_fk_user_local

                await AdminService.editRegistersUnique(this.model);
            }
        },
    },
    computed: {
        modalOpenLocal: { 
            get: function () {
                return this.modalVisible
            },
            set (value) {
                if (!value) {
                  this.$emit('tracingModalClosed', false)
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