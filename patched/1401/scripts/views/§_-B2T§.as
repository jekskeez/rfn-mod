package views
{
   import §_-I10§.§_-I2h§;
   import §_-I10§.§_-f22§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-x1Z§;
   
   public class §_-B2T§ extends Sprite
   {
      
      private static const §_-n2U§:Number = 900;
      
      private static const §_-C3W§:Number = 620;
      
      private static const §_-B3N§:Array = [{
         "z":0,
         "coordX":0,
         "coordY":0
      },{
         "z":1,
         "coordX":0,
         "coordY":479
      },{
         "z":2,
         "coordX":682,
         "coordY":325
      },{
         "z":3,
         "coordX":262,
         "coordY":241
      },{
         "z":4,
         "coordX":249,
         "coordY":357
      },{
         "z":5,
         "coordX":481,
         "coordY":188
      },{
         "z":6,
         "coordX":838,
         "coordY":185
      },{
         "z":7,
         "coordX":486,
         "coordY":536
      },{
         "z":8,
         "coordX":66,
         "coordY":539
      },{
         "z":9,
         "coordX":66,
         "coordY":456
      },{
         "z":10,
         "coordX":168,
         "coordY":521
      },{
         "z":11,
         "coordX":312,
         "coordY":400
      },{
         "z":12,
         "coordX":321,
         "coordY":219
      }];
      
      private var §_-8y§:Object = null;
      
      private var §_-v1m§:Array = null;
      
      private var §_-r2i§:Boolean;
      
      private var §_-82b§:Sprite;
      
      private var §_-8A§:DisplayObject;
      
      private var §_-s2G§:DisplayObject;
      
      public function §_-B2T§(param1:Array, param2:Boolean = false)
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         super();
         this.§_-82b§ = new Sprite();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§,false,0,true);
         §_-f22§.§_-sY§();
         this.§_-r2i§ = param2;
         this.§_-8y§ = {};
         this.§_-v1m§ = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = §_-I2h§.§_-eC§(param1[_loc5_]);
            if(!(this.§_-r2i§ && _loc3_ != §_-I2h§.§_-p1a§ && _loc3_ != §_-I2h§.§_-j2V§))
            {
               _loc4_ = new (§_-I2h§.§_-s1f§(param1[_loc5_]) as Class)();
               _loc4_.x = §_-B3N§[_loc3_]["coordX"];
               _loc4_.y = §_-B3N§[_loc3_]["coordY"];
               if(this.§_-v1m§.indexOf(_loc3_) == -1)
               {
                  this.§_-v1m§.push(_loc3_);
               }
               this.§_-8y§[_loc3_] = {
                  "item":_loc4_,
                  "id":param1[_loc5_]
               };
            }
            _loc5_++;
         }
         this.§_-v1m§.sort(this.§_-62a§);
         this.§_-B3O§();
         this.§_-bv§();
         this.§_-C1Z§();
      }
      
      public function load(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Boolean = false;
         if(§_-f22§.§_-a1r§ != -1)
         {
            param1 = param1.concat(§_-f22§.§_-a1r§);
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = §_-I2h§.§_-eC§(param1[_loc5_]);
            if(!(this.§_-r2i§ && _loc2_ != §_-I2h§.§_-p1a§ && _loc2_ != §_-I2h§.§_-j2V§))
            {
               if(_loc4_.indexOf(_loc2_) == -1)
               {
                  _loc4_.push(_loc2_);
               }
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this.§_-v1m§.length)
         {
            if(_loc4_.indexOf(this.§_-v1m§[_loc5_]) == -1)
            {
               _loc6_ = this.§_-8y§[this.§_-v1m§[_loc5_]]["item"];
               this.§_-A2M§(_loc6_);
               this.§_-8y§[this.§_-v1m§[_loc5_]] = null;
            }
            _loc5_++;
         }
         this.§_-v1m§ = _loc4_;
         this.§_-v1m§.sort(this.§_-62a§);
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = §_-I2h§.§_-eC§(param1[_loc5_]);
            if(!(this.§_-r2i§ && _loc2_ != §_-I2h§.§_-p1a§ && _loc2_ != §_-I2h§.§_-j2V§))
            {
               if(Boolean(this.§_-8y§[_loc2_]) && this.§_-8y§[_loc2_]["id"] == param1[_loc5_])
               {
                  this.§_-8y§[_loc2_]["item"].alpha = 1;
                  this.§_-8y§[_loc2_]["item"].filters = [];
               }
               else
               {
                  if(Boolean(this.§_-8y§[_loc2_]) && Boolean(this.§_-8y§[_loc2_]["item"]))
                  {
                     this.§_-A2M§(this.§_-8y§[_loc2_]["item"]);
                  }
                  _loc3_ = new (§_-I2h§.§_-s1f§(param1[_loc5_]) as Class)();
                  _loc3_.x = §_-B3N§[_loc2_]["coordX"];
                  _loc3_.y = §_-B3N§[_loc2_]["coordY"];
                  _loc7_ = param1[_loc5_] == §_-f22§.§_-a1r§ && _loc2_ != §_-I2h§.§_-p1a§ && _loc2_ != §_-I2h§.§_-j2V§;
                  _loc3_.alpha = _loc7_ ? 0.35 : 1;
                  _loc3_.filters = _loc7_ ? §_-x1Z§.§_-k1X§ : [];
                  this.§_-8y§[_loc2_] = {
                     "item":_loc3_,
                     "id":param1[_loc5_]
                  };
               }
            }
            _loc5_++;
         }
         this.§_-B3O§();
         this.§_-bv§();
         this.§_-C1Z§();
      }
      
      private function §_-A2M§(param1:DisplayObject) : void
      {
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function §_-bv§() : void
      {
         this.§_-8A§ = this.§_-8y§[§_-I2h§.§_-p1a§] ? this.§_-8y§[§_-I2h§.§_-p1a§]["item"] as DisplayObject : null;
         this.§_-s2G§ = this.§_-8y§[§_-I2h§.§_-j2V§] ? this.§_-8y§[§_-I2h§.§_-j2V§]["item"] as DisplayObject : null;
      }
      
      private function §_-wm§(param1:Event) : void
      {
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-Y1V§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-Y1V§);
         this.§_-C1Z§();
      }
      
      private function §_-h2j§(param1:Event) : void
      {
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-Y1V§);
      }
      
      private function §_-Y1V§(param1:Event) : void
      {
         this.§_-C1Z§();
      }
      
      private function §_-B3O§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         while(numChildren > 0)
         {
            removeChildAt(numChildren - 1);
         }
         while(this.§_-82b§.numChildren > 0)
         {
            this.§_-82b§.removeChildAt(this.§_-82b§.numChildren - 1);
         }
         var _loc1_:int = 0;
         for(; _loc1_ < this.§_-v1m§.length; _loc1_++)
         {
            _loc2_ = int(this.§_-v1m§[_loc1_]);
            if(!this.§_-8y§[_loc2_])
            {
               continue;
            }
            _loc3_ = this.§_-8y§[_loc2_]["item"];
            switch(_loc2_)
            {
               case §_-I2h§.§_-p1a§:
                  addChild(_loc3_);
                  break;
               case §_-I2h§.§_-j2V§:
                  addChild(_loc3_);
                  break;
               default:
                  this.§_-82b§.addChild(_loc3_);
            }
         }
         addChild(this.§_-82b§);
      }
      
      private function §_-C1Z§() : void
      {
         if(!stage)
         {
            return;
         }
         var _loc1_:Number = (Game.starling.stage.stageWidth - §_-n2U§) * 0.5;
         var _loc2_:Number = (Game.starling.stage.stageHeight - §_-C3W§) * 0.5;
         var _loc3_:Number = Number(§_-B3N§[§_-I2h§.§_-j2V§]["coordY"]);
         var _loc4_:Number = _loc2_ + _loc3_;
         if(this.§_-8A§)
         {
            this.§_-8A§.x = 0;
            this.§_-8A§.y = 0;
            this.§_-8A§.width = Game.starling.stage.stageWidth;
            this.§_-8A§.height = _loc4_;
         }
         if(this.§_-s2G§)
         {
            this.§_-s2G§.x = 0;
            this.§_-s2G§.y = _loc4_;
            this.§_-s2G§.width = Game.starling.stage.stageWidth;
            this.§_-s2G§.height = Game.starling.stage.stageHeight - _loc4_;
         }
         this.§_-82b§.x = _loc1_;
         this.§_-82b§.y = _loc2_;
      }
      
      private function §_-62a§(param1:int, param2:int) : int
      {
         return §_-B3N§[param1]["z"] > §_-B3N§[param2]["z"] ? 1 : -1;
      }
   }
}

