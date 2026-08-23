package views
{
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-m2r§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.§_-y1l§;
   
   public class §_-53g§ extends Sprite
   {
      
      private static const §_-Q2T§:Number = 900;
      
      private static const §_-p27§:Number = 620;
      
      private static const §_-q28§:Array = [{
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
      
      private var §_-32h§:Object = null;
      
      private var §_-z6§:Array = null;
      
      private var §_-C1l§:Boolean;
      
      private var §_-R14§:Sprite;
      
      private var §_-Fl§:DisplayObject;
      
      private var §_-m2G§:DisplayObject;
      
      public function §_-53g§(param1:Array, param2:Boolean = false)
      {
         var _loc3_:int = 0;
         var _loc4_:DisplayObject = null;
         super();
         this.§_-R14§ = new Sprite();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§,false,0,true);
         §_-I2l§.§_-C1q§();
         this.§_-C1l§ = param2;
         this.§_-32h§ = {};
         this.§_-z6§ = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = §_-m2r§.§_-iM§(param1[_loc5_]);
            if(!(this.§_-C1l§ && _loc3_ != §_-m2r§.§_-n1E§ && _loc3_ != §_-m2r§.§_-ed§))
            {
               _loc4_ = new (§_-m2r§.§_-71N§(param1[_loc5_]) as Class)();
               _loc4_.x = §_-q28§[_loc3_]["coordX"];
               _loc4_.y = §_-q28§[_loc3_]["coordY"];
               if(this.§_-z6§.indexOf(_loc3_) == -1)
               {
                  this.§_-z6§.push(_loc3_);
               }
               this.§_-32h§[_loc3_] = {
                  "item":_loc4_,
                  "id":param1[_loc5_]
               };
            }
            _loc5_++;
         }
         this.§_-z6§.sort(this.§_-Z24§);
         this.§_-U23§();
         this.§_-i14§();
         this.§_-31X§();
      }
      
      public function load(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Boolean = false;
         if(§_-I2l§.§_-K2h§ != -1)
         {
            param1 = param1.concat(§_-I2l§.§_-K2h§);
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = §_-m2r§.§_-iM§(param1[_loc5_]);
            if(!(this.§_-C1l§ && _loc2_ != §_-m2r§.§_-n1E§ && _loc2_ != §_-m2r§.§_-ed§))
            {
               if(_loc4_.indexOf(_loc2_) == -1)
               {
                  _loc4_.push(_loc2_);
               }
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this.§_-z6§.length)
         {
            if(_loc4_.indexOf(this.§_-z6§[_loc5_]) == -1)
            {
               _loc6_ = this.§_-32h§[this.§_-z6§[_loc5_]]["item"];
               this.§_-Wm§(_loc6_);
               this.§_-32h§[this.§_-z6§[_loc5_]] = null;
            }
            _loc5_++;
         }
         this.§_-z6§ = _loc4_;
         this.§_-z6§.sort(this.§_-Z24§);
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc2_ = §_-m2r§.§_-iM§(param1[_loc5_]);
            if(!(this.§_-C1l§ && _loc2_ != §_-m2r§.§_-n1E§ && _loc2_ != §_-m2r§.§_-ed§))
            {
               if(Boolean(this.§_-32h§[_loc2_]) && this.§_-32h§[_loc2_]["id"] == param1[_loc5_])
               {
                  this.§_-32h§[_loc2_]["item"].alpha = 1;
                  this.§_-32h§[_loc2_]["item"].filters = [];
               }
               else
               {
                  if(Boolean(this.§_-32h§[_loc2_]) && Boolean(this.§_-32h§[_loc2_]["item"]))
                  {
                     this.§_-Wm§(this.§_-32h§[_loc2_]["item"]);
                  }
                  _loc3_ = new (§_-m2r§.§_-71N§(param1[_loc5_]) as Class)();
                  _loc3_.x = §_-q28§[_loc2_]["coordX"];
                  _loc3_.y = §_-q28§[_loc2_]["coordY"];
                  _loc7_ = param1[_loc5_] == §_-I2l§.§_-K2h§ && _loc2_ != §_-m2r§.§_-n1E§ && _loc2_ != §_-m2r§.§_-ed§;
                  _loc3_.alpha = _loc7_ ? 0.35 : 1;
                  _loc3_.filters = _loc7_ ? §_-y1l§.§_-e1O§ : [];
                  this.§_-32h§[_loc2_] = {
                     "item":_loc3_,
                     "id":param1[_loc5_]
                  };
               }
            }
            _loc5_++;
         }
         this.§_-U23§();
         this.§_-i14§();
         this.§_-31X§();
      }
      
      private function §_-Wm§(param1:DisplayObject) : void
      {
         if(Boolean(param1) && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function §_-i14§() : void
      {
         this.§_-Fl§ = this.§_-32h§[§_-m2r§.§_-n1E§] ? this.§_-32h§[§_-m2r§.§_-n1E§]["item"] as DisplayObject : null;
         this.§_-m2G§ = this.§_-32h§[§_-m2r§.§_-ed§] ? this.§_-32h§[§_-m2r§.§_-ed§]["item"] as DisplayObject : null;
      }
      
      private function §_-F10§(param1:Event) : void
      {
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-I1D§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-I1D§);
         this.§_-31X§();
      }
      
      private function §_-D1y§(param1:Event) : void
      {
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-I1D§);
      }
      
      private function §_-I1D§(param1:Event) : void
      {
         this.§_-31X§();
      }
      
      private function §_-U23§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         while(numChildren > 0)
         {
            removeChildAt(numChildren - 1);
         }
         while(this.§_-R14§.numChildren > 0)
         {
            this.§_-R14§.removeChildAt(this.§_-R14§.numChildren - 1);
         }
         var _loc1_:int = 0;
         for(; _loc1_ < this.§_-z6§.length; _loc1_++)
         {
            _loc2_ = int(this.§_-z6§[_loc1_]);
            if(!this.§_-32h§[_loc2_])
            {
               continue;
            }
            _loc3_ = this.§_-32h§[_loc2_]["item"];
            switch(_loc2_)
            {
               case §_-m2r§.§_-n1E§:
                  addChild(_loc3_);
                  break;
               case §_-m2r§.§_-ed§:
                  addChild(_loc3_);
                  break;
               default:
                  this.§_-R14§.addChild(_loc3_);
            }
         }
         addChild(this.§_-R14§);
      }
      
      private function §_-31X§() : void
      {
         if(!stage)
         {
            return;
         }
         var _loc1_:Number = (Game.starling.stage.stageWidth - §_-Q2T§) * 0.5;
         var _loc2_:Number = (Game.starling.stage.stageHeight - §_-p27§) * 0.5;
         var _loc3_:Number = Number(§_-q28§[§_-m2r§.§_-ed§]["coordY"]);
         var _loc4_:Number = _loc2_ + _loc3_;
         if(this.§_-Fl§)
         {
            this.§_-Fl§.x = 0;
            this.§_-Fl§.y = 0;
            this.§_-Fl§.width = Game.starling.stage.stageWidth;
            this.§_-Fl§.height = _loc4_;
         }
         if(this.§_-m2G§)
         {
            this.§_-m2G§.x = 0;
            this.§_-m2G§.y = _loc4_;
            this.§_-m2G§.width = Game.starling.stage.stageWidth;
            this.§_-m2G§.height = Game.starling.stage.stageHeight - _loc4_;
         }
         this.§_-R14§.x = _loc1_;
         this.§_-R14§.y = _loc2_;
      }
      
      private function §_-Z24§(param1:int, param2:int) : int
      {
         return §_-q28§[param1]["z"] > §_-q28§[param2]["z"] ? 1 : -1;
      }
   }
}

