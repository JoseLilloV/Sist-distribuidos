<template>  
    <div align="center">
        <v-card class=" text-center" color="#d3d3e7" width=250 height=500>
           <v-app-bar
                dark
                color="#0d0db1"
                height="40"
            >
                <v-spacer/>
                <v-title>About Us</v-title>
                <v-spacer/>
            </v-app-bar>  
            Integrantes: <br/>
            - Arturo Cadenas <br/>
            - Jose Lillo <br/>
            - Cristóbal Vásquez <br/> <br/>

            Este proyecto tiene como objetivo desarrollar un sistema distribuido 
            para consumir los datos que dispone la National Rail Enquiries en su
            API pública sobre las estaciones de trenes de Londres, en particular
            aqui analizamos la estación de London Liverpool (LST)
        </v-card>
    </div>
</template>

<script>
export default {
  name: 'NavApp',
  props: {
    list: Array
  },
   data: () =>({    
   })
}
</script>

