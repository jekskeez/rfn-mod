package §_-dc§
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import utils.§_-93C§;
   import views.§_-fu§;
   
   public class Clan
   {
      
      private static const §_-m2Y§:int = 300000;
      
      public static const §_-73C§:int = 0;
      
      public static const §_-k1P§:int = 1;
      
      public static const §_-jY§:int = 2;
      
      private var loaded:uint = 0;
      
      private var §_-G1r§:Number = 0;
      
      private var §_-21P§:uint = 0;
      
      private var §_-L1k§:Boolean = false;
      
      private var §_-81x§:Dictionary = new Dictionary(false);
      
      public var exp:int = 0;
      
      public var §_-F2k§:int = 0;
      
      public var §_-K2A§:int = 0;
      
      public var level:int = 0;
      
      public var §_-xy§:int = 0;
      
      public var id:int;
      
      public var §_-R2z§:int = 0;
      
      public var size:int = 0;
      
      public var places:int = 0;
      
      public var state:int = 0;
      
      public var §_-t2n§:int = 0;
      
      public var §_-A1h§:Array = null;
      
      public var §_-Ox§:Array = null;
      
      public var blacklist:Array = null;
      
      public var §_-M24§:String = null;
      
      public var name:String = null;
      
      public var §_-cy§:String = null;
      
      public var news:String = null;
      
      public var photo:Bitmap = null;
      
      public var acorns:int = 0;
      
      public var coins:int = 0;
      
      public var totems:§_-D2W§ = new §_-D2W§();
      
      public var §_-G2I§:§_-e2E§ = new §_-e2E§();
      
      public var §_-6S§:int = 0;
      
      public function Clan(param1:int)
      {
         super();
         this.id = param1;
      }
      
      public function §_-3i§(param1:int) : void
      {
         this.§_-21P§ |= param1;
         this.§_-L1k§ = true;
      }
      
      public function §_-uM§(param1:uint = 0) : Boolean
      {
         if(param1 == 0)
         {
            return this.loaded != 0;
         }
         return this.§_-L1k§ && (this.§_-21P§ & param1) == param1;
      }
      
      public function §_-3Y§(param1:Boolean) : void
      {
         if(this.§_-G1r§ == 0)
         {
            return;
         }
         if(!param1 && new Date().getTime() - this.§_-G1r§ <= §_-m2Y§)
         {
            return;
         }
         this.reset();
      }
      
      public function §_-U1w§(param1:Object) : void
      {
         if("rating_info" in param1)
         {
            this.§_-t2n§ = param1["rating_info"];
         }
         if("rating_history" in param1)
         {
            this.§_-A1h§ = param1["rating_history"];
         }
         if("rank" in param1)
         {
            this.level = param1["rank"][0];
            this.exp = param1["rank"][1];
            this.§_-K2A§ = param1["rank"][2];
         }
         if("state" in param1)
         {
            this.state = param1["state"];
         }
         if("info" in param1)
         {
            this.name = param1["name"];
            this.§_-cy§ = param1["photo"];
            this.§_-M24§ = param1["emblem"];
         }
         if("news" in param1)
         {
            this.news = param1["news"];
            this.news = StringUtil.§_-T2i§(this.news);
         }
         if("leader_id" in param1)
         {
            if(!isNaN(this.§_-R2z§) && this.§_-R2z§ != param1["leader_id"])
            {
               Connection.§_-Li§(§_-h2B§.§_-e1g§,this.id);
            }
            this.§_-R2z§ = param1["leader_id"];
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
            this.§_-F2k§ = param1["rank_range"];
         }
         if("totems" in param1)
         {
            this.§_-G2I§.§_-DQ§(param1["totems"][0]);
            this.§_-6S§ = param1["totems"][1];
         }
         if("totems_rangs" in param1)
         {
            this.totems.§_-23F§(param1["totems_rangs"]);
         }
         if("totems_bonuses" in param1)
         {
            this.totems.§_-N22§(param1["totems_bonuses"]);
         }
         if("daily_statistics" in param1)
         {
            this.§_-Ox§ = param1["daily_statistics"];
         }
         if("blacklist" in param1)
         {
            this.blacklist = param1["blacklist"];
            §_-fu§.update();
         }
         if("level_limiter" in param1)
         {
            this.§_-xy§ = param1["level_limiter"];
         }
      }
      
      public function §_-s10§(param1:uint) : void
      {
         this.loaded |= param1;
         this.§_-21P§ &= ~param1;
         this.§_-G1r§ = new Date().getTime();
      }
      
      public function isLoaded(param1:uint = 0) : Boolean
      {
         if(param1 == 0)
         {
            return this.loaded != 0;
         }
         return (this.loaded & param1) == param1;
      }
      
      public function §_-Y2w§() : Boolean
      {
         return this.§_-21P§ == 0;
      }
      
      public function §_-81e§(param1:int, param2:int, param3:int, param4:int) : Bitmap
      {
         var _loc5_:Bitmap = null;
         if(this.photo == null)
         {
            _loc5_ = §_-93C§.§_-e2o§(new NonPhotoImage(),param1,param2);
            _loc5_.x = param3;
            _loc5_.y = param4;
            return _loc5_;
         }
         _loc5_ = this.photo;
         return §_-93C§.scale(_loc5_,param1,param2);
      }
      
      public function save() : void
      {
         §_-TQ§.add("Clan Save: Clan.photoLink, Clan.emblemLink,\n",this.§_-cy§,this.§_-M24§);
         Connection.§_-Li§(§_-h2B§.§_-F1y§,this.§_-cy§,this.§_-M24§);
      }
      
      public function removeEventListener(param1:Function) : void
      {
         delete this.§_-81x§[param1];
      }
      
      public function addEventListener(param1:uint, param2:Function) : void
      {
         if(param2 in this.§_-81x§)
         {
            this.§_-81x§[param2] |= param1;
         }
         else
         {
            this.§_-81x§[param2] = param1;
         }
      }
      
      public function dispatchEvent(param1:uint) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc2_:Dictionary = new Dictionary(false);
         for(_loc3_ in this.§_-81x§)
         {
            _loc2_[_loc3_] = this.§_-81x§[_loc3_];
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
         this.§_-G1r§ = 0;
         this.§_-L1k§ = false;
      }
   }
}

