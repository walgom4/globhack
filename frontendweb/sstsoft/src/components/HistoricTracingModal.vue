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
export default {

}
</script>

<style>

</style>