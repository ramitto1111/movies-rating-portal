<?php

namespace App\Http\Controllers;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class Home extends Controller
{
    //
    public function index(){
        $data = ['search' => 'keyword'];
        $data["latest_movies"] = Item::where("type", "Movies")->orderBy("rate", "desc")->take(5)->get();
        $data["latest_tv_shows"] = Item::where("type", "TV Show")->orderBy("rate", "desc")->take(2)->get();
        return view("home", $data);
    }

    public function searchList(Request $req){
        if($req->keyword){
            $phrase =  "";
            $key_number =  "";
            //$phrased = array("5 stars", "at least 3 stars", "after 2015", "older than 5 years");
            $keyword = $req->keyword;
            $where_array = [];
            $where_string = "";
            if(str_contains($keyword, 'star')){
                preg_match_all('!\d+!', $keyword, $stars_number);
                if(!empty($stars_number[0])){
                $key_number = $stars_number[0][0];
                if(str_contains($keyword, 'at least')){
                    $phrase =  "at least";
                } else {
                    $phrase =  "stars";
                }
                }
            } elseif(str_contains($keyword, 'after')){
                preg_match_all('!\d+!', $keyword, $year_date);
                if(!empty($year_date[0])){
                $key_number = $year_date[0][0];
                $phrase =  "after";
                }
            } elseif(str_contains($keyword, 'older than')){
                preg_match_all('!\d+!', $keyword, $year_number);
                if(!empty($year_number[0])){
                $key_number = $year_number[0][0];
                $key_number = date("Y") - $key_number; 
                $phrase =  "older than";
                }
            } 
            DB::enableQueryLog();
            $movies = DB::table("items")->where("type", "Movies")
            ->where("title", "like", "%".$keyword."%")
            ->orwhere(function($query) use ($phrase, $key_number, $keyword){
                if(!empty($phrase))    
                    $query->where("type", "Movies");
                if($phrase == "at least" && !empty($key_number)){
                    $query->where("rate", ">=", $key_number);
                } elseif($phrase == "stars" && !empty($key_number)){
                    $query->where("rate", $key_number);
                } elseif($phrase == "after" && !empty($key_number)){
                    $query->where("year", ">", $key_number);
                }  elseif($phrase == "older than" && !empty($key_number)){
                    $query->where("year", "<", $key_number);
                } else {
                    // Do Nothing
                }
            })
            ->orderBy("rate", "desc")
            ->limit($req->limit)
            ->get();
            $total_movies_count = DB::table("items")->where("type", "Movies")
            ->where("title", "like", "%".$keyword."%")
            ->orwhere(function($query) use ($phrase, $key_number, $keyword){
                if(!empty($phrase))    
                    $query->where("type", "Movies");
                if($phrase == "at least" && !empty($key_number)){
                    $query->where("rate", ">=", $key_number);
                } elseif($phrase == "stars" && !empty($key_number)){
                    $query->where("rate", $key_number);
                } elseif($phrase == "after" && !empty($key_number)){
                    $query->where("year", ">", $key_number);
                }  elseif($phrase == "older than" && !empty($key_number)){
                    $query->where("year", "<", $key_number);
                } else {
                    // Do Nothing
                }
            })
            ->count();
            
            $tv_shows = DB::table("items")->where("type", "TV Show")
            ->where("title", "like", "%".$keyword."%")
            ->orwhere(function($query) use ($phrase, $key_number, $keyword){
                if(!empty($phrase))    
                    $query->where("type", "TV Show");
                if($phrase == "at least" && !empty($key_number)){
                    $query->where("rate", ">=", $key_number);
                } elseif($phrase == "stars" && !empty($key_number)){
                    $query->where("rate", $key_number);
                } elseif($phrase == "after" && !empty($key_number)){
                    $query->where("year", ">", $key_number);
                }  elseif($phrase == "older than" && !empty($key_number)){
                    $query->where("year", "<", $key_number);
                } else {
                    // Do Nothing
                }
            })
            ->orderBy("rate", "desc")
            ->limit($req->limit1)
            ->get();

            $total_tv_shows_count = DB::table("items")->where("type", "TV Show")
            ->where("title", "like", "%".$keyword."%")
            ->orwhere(function($query) use ($phrase, $key_number, $keyword){
                if(!empty($phrase))    
                    $query->where("type", "TV Show");
                if($phrase == "at least" && !empty($key_number)){
                    $query->where("rate", ">=", $key_number);
                } elseif($phrase == "stars" && !empty($key_number)){
                    $query->where("rate", $key_number);
                } elseif($phrase == "after" && !empty($key_number)){
                    $query->where("year", ">", $key_number);
                }  elseif($phrase == "older than" && !empty($key_number)){
                    $query->where("year", "<", $key_number);
                } else {
                    // Do Nothing
                }
            })
            ->count();
            //$data = Item::where("title", "like", "%".$req->keyword."%")->orderBy("rate", "desc")->get()->paginate(4);
            //DB::enableQueryLog();
            /*
            $query = DB::table("items")->where("type", "Movies")
            ->where("title", "like", "%".$req->keyword."%");
            if($x == 1)
            $query->orwhere("rate", ">=", $rate)
            $query->orderBy("rate", "desc")
            ->take($req->limit);
            $data = $query->get();
            */
            //$query = DB::getQueryLog();
            //$query = end($query);
            //print_r($query);
            $movies_count = $movies->count();
            $tv_shows_count = $tv_shows->count();
            //$total_movies_count = Item::where("title", "like", "%".$req->keyword."%")->where("type", "Movies")->count();
            
        } else {
            $movies = Item::where("type", "Movies")->orderBy("rate", "desc")->limit($req->limit)->get();
            $tv_shows = Item::where("type", "TV Show")->orderBy("rate", "desc")->limit($req->limit1)->get();
            $movies_count = $movies->count();
            $tv_shows_count = $tv_shows->count();
            $total_movies_count = Item::where("type", "Movies")->count();
            $total_tv_shows_count = Item::where("type", "TV Show")->count();

        }
        $movies_end = ($total_movies_count == $movies_count) ? 'yes' : 'no';
        $tv_shows_end = ($total_tv_shows_count == $tv_shows_count) ? 'yes' : 'no';
        $data = [
            'movies' => $movies,
            'tv_shows' => $tv_shows, 
            'movies_end' => $movies_end, 
            'tv_shows_end' => $tv_shows_end];
        return response()->json(['data' => $data], 200);
    }

    public function setRating(Request $req){
        $rate = $req->rate;
        $id = $req->id;
        $item = Item::find($id);
        $rateing_counts = $item->rateing_counts;
        $rateing_counts++;
        $rate =  ($item->rate + $rate) / 2;
        $rate = round($rate, 1);
        DB::table("items")->where("id", $id)->update(["rate" => $rate, "rateing_counts" => $rateing_counts ]);
        return response()->json(["rate" => $item->rate], 200);
    }
}
