<template>  
    <div align="center">
        <v-card class="mx-10 mt-5 text-center"   width=1300 height=500>
            <v-app-bar
                dark
                color="#0d0db1"
                height="40"
            >
                <v-spacer/>
                <v-title>Datos de las salidas</v-title>
                <v-spacer/>
            </v-app-bar>
            <v-card-text>
                <v-row align="center" justify="center" class="mx-auto">
                    <!--(date, time, location_name, crs, crs_origin, crs_destination, origin, destination, std, etd)-->
                    <v-col><strong>date</strong></v-col>
                    <v-col><strong>time</strong></v-col>
                    <v-col><strong>location_name</strong></v-col>
                    <v-col><strong>crs</strong></v-col>
                    <v-col><strong>crs_origin</strong></v-col>
                    <v-col><strong>crs_destination</strong></v-col>
                    <v-col><strong>origin</strong></v-col>
                    <v-col><strong>destination</strong></v-col>
                    <v-col><strong>std</strong></v-col>
                    <v-col><strong>etd</strong></v-col>
                </v-row>
            </v-card-text>
            <v-card-text>
                <v-virtual-scroll
                :items="list"
                :item-height="50"
                height=370
                >
                    <template v-slot:default="{ item }">
                        <v-list>
                            <v-divider></v-divider>
                            <v-row align="center" justify="center" class="mx-auto">
                                <!--(date, time, location_name, crs, crs_origin, crs_destination, origin, destination, std, etd)-->
                                <v-col>{{item.date}}</v-col>
                                <v-col>{{item.time}}</v-col>
                                <v-col>{{item.location_name}}</v-col>
                                <v-col>{{item.crs}}</v-col>
                                <v-col>{{item.crs_origin}}</v-col>
                                <v-col>{{item.crs_destination}}</v-col>
                                <v-col>{{item.origin}}</v-col>
                                <v-col>{{item.destination}}</v-col>
                                <v-col>{{item.std}}</v-col>
                                <v-col>{{item.etd}}</v-col>
                            </v-row>
                        </v-list>
                    </template>
                </v-virtual-scroll>
            </v-card-text>
        </v-card>
    </div>
</template>

<script>
export default {
  name: 'TableMetric',
  props: {
    list: Array
  },
   data: () =>({    
   })
}
</script>

