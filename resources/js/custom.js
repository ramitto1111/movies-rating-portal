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
  