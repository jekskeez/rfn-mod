package §_-U19§
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import utils.§_-O1T§;
   import views.§_-lJ§;
   
   public class Clan
   {
      
      private static const §_-tj§:int = 300000;
      
      public static const §_-Y2B§:int = 0;
      
      public static const §_-01X§:int = 1;
      
      public static const §_-HJ§:int = 2;
      
      private var loaded:uint = 0;
      
      private var §_-uk§:Number = 0;
      
      private var §_-r1m§:uint = 0;
      
      private var §_-B1J§:Boolean = false;
      
      private var §_-H2A§:Dictionary = new Dictionary(false);
      
      public var exp:int = 0;
      
      public var §_-034§:int = 0;
      
      public var §_-q1B§:int = 0;
      
      public var level:int = 0;
      
      public var §_-B1D§:int = 0;
      
      public var id:int;
      
      public var §_-W2t§:int = 0;
      
      public var size:int = 0;
      
      public var places:int = 0;
      
      public var state:int = 0;
      
      public var §_-u2q§:int = 0;
      
      public var §_-gF§:Array = null;
      
      public var §_-tm§:Array = null;
      
      public var blacklist:Array = null;
      
      public var §_-o1p§:String = null;
      
      public var name:String = null;
      
      public var §_-51L§:String = null;
      
      public var news:String = null;
      
      public var photo:Bitmap = null;
      
      public var acorns:int = 0;
      
      public var coins:int = 0;
      
      public var totems:§_-a2i§ = new §_-a2i§();
      
      public var §_-Af§:§_-4h§ = new §_-4h§();
      
      public var §_-w2E§:int = 0;
      
      public function Clan(param1:int)
      {
         super();
         this.id = param1;
      }
      
      public function §_-l2O§(param1:int) : void
      {
         this.§_-r1m§ |= param1;
         this.§_-B1J§ = true;
      }
      
      public function §_-t1C§(param1:uint = 0) : Boolean
      {
         if(param1 == 0)
         {
            return this.loaded != 0;
         }
         return this.§_-B1J§ && (this.§_-r1m§ & param1) == param1;
      }
      
      public function §_-c2k§(param1:Boolean) : void
      {
         if(this.§_-uk§ == 0)
         {
            return;
         }
         if(!param1 && new Date().getTime() - this.§_-uk§ <= §_-tj§)
         {
            return;
         }
         this.reset();
      }
      
      public function §_-j1a§(param1:Object) : void
      {
         if("rating_info" in param1)
         {
            this.§_-u2q§ = param1["rating_info"];
         }
         if("rating_history" in param1)
         {
            this.§_-gF§ = param1["rating_history"];
         }
         if("rank" in param1)
         {
            this.level = param1["rank"][0];
            this.exp = param1["rank"][1];
            this.§_-q1B§ = param1["rank"][2];
         }
         if("state" in param1)
         {
            this.state = param1["state"];
         }
         if("info" in param1)
         {
            this.name = param1["name"];
            this.§_-51L§ = param1["photo"];
            this.§_-o1p§ = param1["emblem"];
         }
         if("news" in param1)
         {
            this.news = param1["news"];
            this.news = StringUtil.§_-U2s§(this.news);
         }
         if("leader_id" in param1)
         {
            if(!isNaN(this.§_-W2t§) && this.§_-W2t§ != param1["leader_id"])
            {
               Connection.§_-e2T§(§_-u1O§.§_-63V§,this.id);
            }
            this.§_-W2t§ = param1["leader_id"];
         }
         if("size" in param1)
         {
            this.size = param1["size"];
         }
         if("places" in param1)
         {
            this.places = param1["places"];
         }
         if("rank_range" in param1)
         {
            this.§_-034§ = param1["rank_range"];
         }
         if("totems" in param1)
         {
            this.§_-Af§.§_-p24§(param1["totems"][0]);
            this.§_-w2E§ = param1["totems"][1];
         }
         if("totems_rangs" in param1)
         {
            this.totems.§_-93n§(param1["totems_rangs"]);
         }
         if("totems_bonuses" in param1)
         {
            this.totems.§_-Kx§(param1["totems_bonuses"]);
         }
         if("daily_statistics" in param1)
         {
            this.§_-tm§ = param1["daily_statistics"];
         }
         if("blacklist" in param1)
         {
            this.blacklist = param1["blacklist"];
            §_-lJ§.update();
         }
         if("level_limiter" in param1)
         {
            this.§_-B1D§ = param1["level_limiter"];
         }
      }
      
      public function §_-9P§(param1:uint) : void
      {
         this.loaded |= param1;
         this.§_-r1m§ &= ~param1;
         this.§_-uk§ = new Date().getTime();
      }
      
      public function isLoaded(param1:uint = 0) : Boolean
      {
         if(param1 == 0)
         {
            return this.loaded != 0;
         }
         return (this.loaded & param1) == param1;
      }
      
      public function §_-HU§() : Boolean
      {
         return this.§_-r1m§ == 0;
      }
      
      public function §_-e14§(param1:int, param2:int, param3:int, param4:int) : Bitmap
      {
         var _loc5_:Bitmap = null;
         if(this.photo == null)
         {
            _loc5_ = §_-O1T§.§_-oM§(new NonPhotoImage(),param1,param2);
            _loc5_.x = param3;
            _loc5_.y = param4;
            return _loc5_;
         }
         _loc5_ = this.photo;
         return §_-O1T§.scale(_loc5_,param1,param2);
      }
      
      public function save() : void
      {
         §_-p2U§.add("Clan Save: Clan.photoLink, Clan.emblemLink,\n",this.§_-51L§,this.§_-o1p§);
         Connection.§_-e2T§(§_-u1O§.§_-k1w§,this.§_-51L§,this.§_-o1p§);
      }
      
      public function removeEventListener(param1:Function) : void
      {
         delete this.§_-H2A§[param1];
      }
      
      public function addEventListener(param1:uint, param2:Function) : void
      {
         if(param2 in this.§_-H2A§)
         {
            this.§_-H2A§[param2] |= param1;
         }
         else
         {
            this.§_-H2A§[param2] = param1;
         }
      }
      
      public function dispatchEvent(param1:uint) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc2_:Dictionary = new Dictionary(false);
         for(_loc3_ in this.§_-H2A§)
         {
            _loc2_[_loc3_] = this.§_-H2A§[_loc3_];
         }
         for(_loc3_ in _loc2_)
         {
            _loc4_ = uint(_loc2_[_loc3_] & this.loaded);
            if(_loc4_ == _loc2_[_loc3_])
            {
               _loc3_(this,param1);
            }
         }
      }
      
      private function reset() : void
      {
         this.loaded = 0;
         this.§_-uk§ = 0;
         this.§_-B1J§ = false;
      }
   }
}

