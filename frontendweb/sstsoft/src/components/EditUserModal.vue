<template>
  <v-dialog
        v-model="modalOpenLocal"
        width="600"
        persistent
    >
  
        <v-card>
          <v-card-title
            class="headline accent"
            primary-title
          >
            <span style="margin:auto; display:table;"> <strong > Editar Usuario - {{userIdLocal}}</strong> </span> 
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
                                @submit="edit"
                                >

                                <v-container grid-list-xl fluid>
                                        <v-layout row wrap>
                                            <v-flex lg8 sm12>
                                                <v-autocomplete
                                                v-model="area_fk_user_local"
                                                :items="areas"
                                                item-text="name"
                                                item-value="id"
                                                color="accent"
                                                item-color="accent"
                                                outlined
                                                dense
                                                clearable
                                                label="Area"                                      
                                                ></v-autocomplete>
                                            </v-flex> 

                                            <v-flex lg4 sm12>
                                                <v-switch
                                                    color="accent"
                                                    style="margin:auto;"
                                                    v-model="model.is_sst"
                                                    :label="'SST: Si / No'"
                                                ></v-switch> 
                                            </v-flex>
                                    </v-layout>
                                </v-container>                                     
                                        
                                    <v-btn block color="accent" type="submit" :disabled="!valid">Editar</v-btn>
                                      
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
    name: 'editarUserModal',
    data() {
        return {
            model: {
                id: "",
                area_fk_user: 0,
                is_sst: true              
            },
            valid: true,
            areas: []
        }            
    },
    created(){
        this.obtainAreas();
    },
    props: {
        modalEditVisible: {
          type: Boolean,
          default: false
        },
        userId: {
          type: String
        },
        is_sst: {
          type: Boolean
        },
        area_fk_user: {
          type: Number,
          default: 0
        }
    },
    methods: {
        closeModal(){           
            this.modalOpenLocal = false;
            this.resetForm();
        },
        resetForm(){
            this.model.id = ""
            this.model.area_fk_user = ""
            this.model.is_sst = true
        },
        async obtainAreas () {
            const respuesta = await AdminService.getArea();
            this.areas = respuesta.data
        },
        async edit(e){
            e.preventDefault()
            if (this.$refs.form.validate()) {
                
                this.model.id = this.userIdLocal
                this.model.area_fk_user = this.area_fk_user_local

                const recursos = await AdminService.editRegistersUnique(this.model);
                console.log(recursos)
            }
        },
    },
    computed: {
        modalOpenLocal: { 
            get: function () {
                return this.modalEditVisible
            },
            set (value) {
                if (!value) {
                  this.$emit('editModalClosed', false)
                }
            }
        },
        userIdLocal(){           
            return this.userId
        },
        is_sst_local:{           
            get: function () {
                return this.is_sst
            },
            set (value) {
                this.model.is_sst = value
            }
        },
        area_fk_user_local(){           
            return this.area_fk_user
        }
    }
}
</script>

<style>

</style>