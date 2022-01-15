/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
require('./bootstrap');
window.Vue = require('vue').default;

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))
var StarRating = require('vue-star-rating').default;
console.log(StarRating);
Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('star-rating', StarRating);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
 Vue.component('item',{
    'template': '#item-template',
    props:{
        item: Object
    },
    data(){
        return {
            items: "",
            responseAvailable: false,
        }
    },
    components: {
        StarRating
    }
  })
  
  const app = new Vue({
    el: '#app',
    data(){
        return {
            items: "",
            current_items: "",
            page: 4,
            keyword: "",
            responseAvailable: false,
            //apiKey: '<YOUR_RAPIDAPI_KEY>'
        }
    },
    methods: {
        searchKeyword: function(){
            this.responseAvailable = false;
            this.keyword = this.$refs.keyword.value;
            if(this.keyword.length > 2){
            fetch("http://127.0.0.1:8000/api/search/?limit="+this.page+"&keyword="+this.keyword)
            .then(response => { 
                if(response.ok){
                    return response.json()    
                } else{
                    alert("Server returned " + response.status + " : " + response.statusText);
                }                
            })
            .then(response => {
                this.items = response.data; 
                this.responseAvailable = true;
                console.log(response.data);
            
            })
            .catch(err => {
                console.log(err);
            });   
          }     
        },
        initData: function(){
          this.responseAvailable = false;
          fetch("http://127.0.0.1:8000/api/search")
          .then(response => { 
              if(response.ok){
                  return response.json()    
              } else{
                  alert("Server returned " + response.status + " : " + response.statusText);
              }                
          })
          .then(response => {
              this.items = response.data; 
              this.responseAvailable = true;
          
          })
          .catch(err => {
              console.log(err);
          });   
        },
        loadMore: function(){
          this.page += 4;
          this.responseAvailable = false;
          this.keyword = this.$refs.keyword.value;
          this.current_items = this.items;
          if(this.keyword.length > 2){
          fetch("http://127.0.0.1:8000/api/search/?limit="+this.page+"&keyword="+this.keyword)
          .then(response => { 
              if(response.ok){
                  return response.json()    
              } else{
                  alert("Server returned " + response.status + " : " + response.statusText);
              }                
          })
          .then(response => {
              this.items = response.data;
              this.responseAvailable = true;
              console.log(this.current_items);
              console.log(response.data.data);
          
          })
          .catch(err => {
              console.log(err);
          });   
        }  
        }
    }
  });
  
