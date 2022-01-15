<!DOCTYPE html>
<html>
<head>
 <meta charset='utf-8'>
 <meta http-equiv='X-UA-Compatible' content='IE=edge'>
 <title>Movies Rateing</title>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link href="{{ asset('/css/app.css') }}" rel="stylesheet" >
</head>
<body>

<div  id="app" >
    <!--
@{{initData()}}-->
<div class="container" >
    <div class="row" >
        <div class="col" >
<h1 class="text-center text-danger bg-dark p-3 mb-0 rounded">Movies Rates</h1>
<div class="bg-light p-3 mb-4" >
            <input type="text" class="form-control" v-on:keyup="searchKeyword" ref="keyword" placeholder="Search..." />
        </div>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link fw-bold active" id="home-tab" data-bs-toggle="tab" data-bs-target="#movies" type="button" role="tab" aria-controls="movies" aria-selected="true">Movies</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link fw-bold" id="profile-tab" data-bs-toggle="tab" data-bs-target="#tv_shows" type="button" role="tab" aria-controls="tv_shows" aria-selected="false">TV Shows</button>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
    <!-- Latest Movies -->
    <div class="tab-pane fade show active" id="movies" role="tabpanel" aria-labelledby="movies-tab">
        
        <div>
            <div class="row mt-3 mb-5">
                <item v-for="item in items" v-bind:item ="item"></item>
            </div>
            <div v-if="movies_end === 'no'">
                <p class="bg-dark text-white text-center cur" v-on:click="loadMore" >View More</p>
            </div>
        </div>
    </div>

    <!-- Latest TV Shows -->
    <div class="tab-pane fade" id="tv_shows" role="tabpanel" aria-labelledby="tv_shows-tab">
        <div>
            <div class="row mt-3 mb-5">
                <tv-show v-for="tv_show in tv_shows" v-bind:item ="tv_show"></tv-show>
            </div>
            <div v-if="tv_shows_end === 'no'">
            <p class="bg-dark text-white text-center cur" v-on:click="loadMoreTV" >View More</p>
            </div>
        </div>
    </div>

</div>


            </div>
        </div>
    </div>



</div>

<script type="text/x-template" id="item-template">
    <div class="col-lg-3 col-md-6 col-xs-12 mb-3">
<div class="card ">
        <img v-bind:src="'storage/' + item.image" class="card-img-top" />
    <div class="card-body" >
        <h6>@{{item.title}}</h6>
        <p class="card-text bg-light p-2"><b>Rate:</b> <span class="text-warning">@{{item.rate}}</span>
        <star-rating v-model="item.rate" @rating-selected="setRating($event, item.id)" v-bind:increment="0.5" v-bind:max-rating="5" v-bind:star-size="25" ></star-rating>      
    </p>
    </div>
</div>
</div>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://unpkg.com/vue@2.6.11/dist/vue.js"></script>
<!--<script src="{{ asset('/js/app.js') }}"></script>-->
<script src="js/app.js"></script>
<script>
//import StarRating from 'vue-star-rating';
</script>

</body>
</html>