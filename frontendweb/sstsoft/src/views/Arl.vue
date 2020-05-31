<template>
  <v-container fluid fill-height>
        <v-layout align-center justify-center>
                   
          <div class="text-md-center">
              <div class="layout column align-center">
                  <img :src="urlImg" alt="Satlock WEB" width="100%" height="100%">
              </div>
            
            <div>
              <v-btn color="accent">Editar</v-btn>
            </div>  
          </div>
        </v-layout>
      </v-container>
</template>

<script>
export default {

  name: "ARL",
  data: function() {
    return {
      urlImg: require(`@/assets/ARLinfo.png`),
    }
    
  }
}
</script>

<style>

</style>