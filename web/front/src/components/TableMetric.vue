<template>  
    <div align="center">
        <v-card class="mx-10 mt-5 text-center"   width=1300 height=500>
            <v-app-bar
                dark
                color="#0d0db1"
                height="40"
            >
                <v-spacer/>
                <v-title>Metricas calculadas</v-title>
                <v-spacer/>
            </v-app-bar>
            <v-card-text>
                <v-row align="center" justify="center" class="mx-auto">
                    <v-col><strong>Dia</strong></v-col>
                    <v-col><strong>Porcentaje trenes a tiempo</strong></v-col>
                    <v-col><strong>Cantidad de trenes a PAD</strong></v-col>
                    <v-col><strong>Cantidad de trenes a ABW</strong></v-col>
                    <v-col><strong>Cantidad de trenes a SNF</strong></v-col>
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
                                <v-col>{{item.date}}</v-col>
                                <v-col>{{item.percentage_ontime}}</v-col>
                                <v-col>{{item.quantity_train_to_pad}}</v-col>
                                <v-col>{{item.quantity_train_to_abw}}</v-col>
                                <v-col>{{item.quantity_train_to_snf}}</v-col>
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

