<template>
    <div id="app">
        <v-row align="start">
            <v-col class="mx-16 mt-9" width=100>
                <v-select    width=100
                    outlined
                    :items="listaBD"
                    label="Base de datos"
                    v-model="baseDatos" 
                ></v-select>
                <v-btn
                    dark
                    color="#0d0db1"
                    width="200"
                    height="30"
                    type="button"
                    class="btn btn-info action_btn" 
                    v-on:click="actualizarTablas();"
                >
                Actualizar
                </v-btn>
                <br/>
                <br/>
                <NavApp/>
            </v-col>
            <v-col>
                <TableMetric :list="listMetric"/> <br/>
                <TableDeparture :list="listDeparture"/> <br/>
                <TableData :list="listData"/> <br/>
            </v-col>
        </v-row>
    </div>
</template>

<script>
import TableMetric from './components/TableMetric.vue'
import NavApp from './components/NavApps.vue'
import TableDeparture from './components/TableDeparture.vue'
import TableData from './components/TableData.vue'
import DataService from './service/service'

export default {
name: 'App',
components: {
    TableMetric,
    NavApp,
    TableDeparture,
    TableData
},
  
data: () =>({
    listaBD:['LDBWS', 'LDBWS-replica', 123],
    baseDatos:'LDBWS',
    listMetric:[],
    listDeparture:[],
    listData:[],
}), 

    methods:{
        actualizarTablas(){
            DataService.getAllData()
            .then(response => {
                this.listData = response.data;
            })
            .catch(e =>{
                console.log(e)
            });
            DataService.getAllMetric()
            .then(response => {
                this.listMetric = response.data;
            })
            .catch(e =>{
                console.log(e)
            });
            DataService.getAllDepartures()
            .then(response => {
                this.listDeparture = response.data;
            })
            .catch(e =>{
                console.log(e)
            });

        }
    },
    created(){
        this.actualizarTablas()
    },
    mounted() {
        this.actualizarTablas()
    },

}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
