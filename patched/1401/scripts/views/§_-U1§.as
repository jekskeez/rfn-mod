package views
{
   import §_-42B§.TweenMax;
   import §_-83V§.Balk;
   import §_-83V§.BalloonBody;
   import §_-83V§.Box;
   import §_-83V§.Trampoline;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-X2T§;
   import §_-I10§.§_-Z1F§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-r2N§;
   
   public class §_-U1§ extends Sprite
   {
      
      private static const §_-01b§:int = 400;
      
      private static const §_-61Q§:int = 0;
      
      private static const §_-a1H§:int = 1;
      
      private static const §_-V2S§:int = 2;
      
      private static const §_-K2w§:int = 3;
      
      private static const §_-FP§:int = 4;
      
      private static const §_-31W§:int = 5;
      
      private static const §_-113§:int = 6;
      
      public static const §_-6n§:int = 7;
      
      private static var §_-B19§:Object = {};
      
      public static var coins:int = 0;
      
      public static var mana:int = 0;
      
      public static var energy:int = 0;
      
      private var type:int = -1;
      
      private var id:int = 0;
      
      private var tween:TweenMax = null;
      
      public function §_-U1§(param1:int, param2:Point)
      {
         super();
         this.type = param1;
         this.x = param2.x;
         this.y = param2.y;
         this.init();
      }
      
      private static function §_-s2b§(param1:int) : Object
      {
         switch(param1)
         {
            case §_-61Q§:
               return {
                  "class":ImageIconEnergy,
                  "count":5,
                  "scale":1
               };
            case §_-a1H§:
               return {
                  "class":ImageIconMana,
                  "count":10,
                  "scale":1
               };
            case §_-V2S§:
               return {
                  "class":Box1,
                  "count":1,
                  "scale":0.5
               };
            case §_-K2w§:
               return {
                  "class":Balk1,
                  "count":1,
                  "scale":0.4,
                  "rotate":45,
                  "offsetY":-8
               };
            case §_-FP§:
               return {
                  "class":BalloonIcon,
                  "count":1,
                  "scale":0.5
               };
            case §_-31W§:
               return {
                  "class":TrampolineView,
                  "count":1,
                  "scale":0.5,
                  "offsetY":10
               };
            case §_-113§:
               return {
                  "class":ImageIconCoins,
                  "count":1,
                  "scale":1
               };
            default:
               return null;
         }
      }
      
      public static function hide() : void
      {
         var _loc1_:§_-U1§ = null;
         for each(_loc1_ in §_-B19§)
         {
            if(_loc1_ != null)
            {
               _loc1_.takeGift();
            }
         }
      }
      
      private static function §_-71s§(param1:int) : int
      {
         switch(param1)
         {
            case §_-61Q§:
               return §_-428§.§_-61Q§;
            case §_-a1H§:
               return §_-428§.§_-a1H§;
            case §_-113§:
               return §_-428§.§_-113§;
            default:
               return §_-428§.§_-Q1C§;
         }
      }
      
      public function show() : void
      {
         var posY:int;
         var posX0:int;
         var posY0:int;
         var time:Number;
         var posX:int = 0;
         while(this.id in §_-B19§ && §_-B19§[this.id] != null)
         {
            ++this.id;
         }
         §_-B19§[this.id] = this;
         posX = int(§_-a9§.§_-9o§ * 0.5) + 70 * int((this.id + 1) * 0.5) * (this.id % 2 == 0 ? 1 : -1);
         posY = 560;
         posX0 = int(this.x + posX) * 0.5;
         posY0 = this.y - 200;
         time = Math.sqrt(Math.pow(this.x - posX,2) + Math.pow(this.y - posY,2)) / §_-01b§;
         this.scaleX = this.scaleY = 0.7;
         TweenMax.to(this,time,{
            "bezier":[{
               "x":posX0,
               "y":posY0
            },{
               "x":posX,
               "y":posY
            }],
            "scaleX":1,
            "scaleY":1,
            "onComplete":function():void
            {
               addEventListener(MouseEvent.MOUSE_OVER,takeGift);
            }
         });
      }
      
      private function init() : void
      {
         var _loc1_:Object = §_-s2b§(this.type);
         var _loc2_:Class = _loc1_["class"];
         var _loc3_:DisplayObject = new _loc2_();
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).gotoAndStop(0);
         }
         _loc3_.scaleX = _loc3_.scaleY = _loc1_["scale"] * 2;
         if("rotate" in _loc1_)
         {
            _loc3_.rotation = _loc1_["rotate"];
         }
         if("offsetY" in _loc1_)
         {
            _loc3_.y = _loc1_["offsetY"] * 2;
         }
         addChild(_loc3_);
         Game.§_-d2t§.addChild(this);
         this.glow();
      }
      
      private function glow() : void
      {
         var target:Object = null;
         target = this;
         this.tween = TweenMax.to(target,0.2,{
            "glowFilter":{
               "color":16777164,
               "alpha":1,
               "blurX":0,
               "blurY":0,
               "strength":1
            },
            "onComplete":function():void
            {
               tween = TweenMax.to(target,0.5,{
                  "glowFilter":{
                     "color":16777164,
                     "alpha":1,
                     "blurX":10,
                     "blurY":10,
                     "strength":1
                  },
                  "onComplete":function():void
                  {
                     tween = TweenMax.to(target,0.5,{
                        "glowFilter":{
                           "color":16777164,
                           "alpha":1,
                           "blurX":30,
                           "blurY":30,
                           "strength":4
                        },
                        "onComplete":function():void
                        {
                           tween = TweenMax.to(target,1,{
                              "glowFilter":{
                                 "color":16777164,
                                 "alpha":1,
                                 "blurX":10,
                                 "blurY":10,
                                 "strength":1
                              },
                              "onComplete":glow
                           });
                        }
                     });
                  }
               });
            }
         });
      }
      
      private function takeGift(param1:MouseEvent = null) : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.takeGift);
         §_-B19§[this.id] = null;
         Game.§_-d2t§.removeChild(this);
         if(this.tween)
         {
            this.tween.§_-h2r§();
         }
         var _loc2_:Object = §_-s2b§(this.type);
         var _loc3_:DisplayObject = new (_loc2_["class"] as Class)() as DisplayObject;
         if(_loc3_ is MovieClip)
         {
            (_loc3_ as MovieClip).gotoAndStop(0);
         }
         _loc3_.scaleX = _loc3_.scaleY = _loc2_["scale"];
         if("rotate" in _loc2_)
         {
            _loc3_.rotation = _loc2_["rotate"];
         }
         if(!("offsetY" in _loc2_))
         {
            _loc2_["offsetY"] = 0;
         }
         var _loc4_:Boolean = int(_loc2_["offsetY"]) != 0;
         §_-r2N§.§_-A3v§(this.x,this.y,_loc2_["count"],§_-71s§(this.type),_loc3_,0,null,1.5,-35,-2,_loc4_ ? int(_loc2_["offsetY"]) : 0,!_loc4_);
         var _loc5_:int = -1;
         switch(this.type)
         {
            case §_-61Q§:
               energy -= _loc2_["count"];
               Connection.§_-R1M§(§_-S2I§.§_-61Q§,[§_-Z1F§.§_-U1f§ + energy + _loc2_["count"],0]);
               break;
            case §_-a1H§:
               mana -= _loc2_["count"];
               Connection.§_-R1M§(§_-S2I§.§_-a1H§,[§_-Z1F§.§_-bc§ + mana + _loc2_["count"],0]);
               break;
            case §_-V2S§:
               _loc5_ = §_-X2T§.§_-X21§(Box);
               break;
            case §_-K2w§:
               _loc5_ = §_-X2T§.§_-X21§(Balk);
               break;
            case §_-FP§:
               _loc5_ = §_-X2T§.§_-X21§(BalloonBody);
               break;
            case §_-31W§:
               _loc5_ = §_-X2T§.§_-X21§(Trampoline);
               break;
            case §_-113§:
               coins -= _loc2_["count"];
               Connection.§_-R1M§(§_-S2I§.§_-s1J§,[Game.self.coins + coins + _loc2_["count"],Game.self.nuts,0]);
         }
      }
   }
}

