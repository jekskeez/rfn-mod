package views
{
   import §_-22D§.TweenMax;
   import §_-8Q§.Balk;
   import §_-8Q§.BalloonBody;
   import §_-8Q§.Box;
   import §_-8Q§.Trampoline;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-n1C§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-o1Q§;
   
   public class §_-O2E§ extends Sprite
   {
      
      private static const §_-Bs§:int = 400;
      
      private static const §_-W27§:int = 0;
      
      private static const §_-fz§:int = 1;
      
      private static const §_-u1r§:int = 2;
      
      private static const §_-H1F§:int = 3;
      
      private static const §_-X2§:int = 4;
      
      private static const §_-Kw§:int = 5;
      
      private static const §_-M1U§:int = 6;
      
      public static const §_-x2G§:int = 7;
      
      private static var §_-h9§:Object = {};
      
      public static var coins:int = 0;
      
      public static var mana:int = 0;
      
      public static var energy:int = 0;
      
      private var type:int = -1;
      
      private var id:int = 0;
      
      private var tween:TweenMax = null;
      
      public function §_-O2E§(param1:int, param2:Point)
      {
         super();
         this.type = param1;
         this.x = param2.x;
         this.y = param2.y;
         this.init();
      }
      
      private static function §_-x1F§(param1:int) : Object
      {
         switch(param1)
         {
            case §_-W27§:
               return {
                  "class":ImageIconEnergy,
                  "count":5,
                  "scale":1
               };
            case §_-fz§:
               return {
                  "class":ImageIconMana,
                  "count":10,
                  "scale":1
               };
            case §_-u1r§:
               return {
                  "class":Box1,
                  "count":1,
                  "scale":0.5
               };
            case §_-H1F§:
               return {
                  "class":Balk1,
                  "count":1,
                  "scale":0.4,
                  "rotate":45,
                  "offsetY":-8
               };
            case §_-X2§:
               return {
                  "class":BalloonIcon,
                  "count":1,
                  "scale":0.5
               };
            case §_-Kw§:
               return {
                  "class":TrampolineView,
                  "count":1,
                  "scale":0.5,
                  "offsetY":10
               };
            case §_-M1U§:
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
         var _loc1_:§_-O2E§ = null;
         for each(_loc1_ in §_-h9§)
         {
            if(_loc1_ != null)
            {
               _loc1_.takeGift();
            }
         }
      }
      
      private static function §_-03E§(param1:int) : int
      {
         switch(param1)
         {
            case §_-W27§:
               return §_-A3y§.§_-W27§;
            case §_-fz§:
               return §_-A3y§.§_-fz§;
            case §_-M1U§:
               return §_-A3y§.§_-M1U§;
            default:
               return §_-A3y§.§_-736§;
         }
      }
      
      public function show() : void
      {
         var posY:int;
         var posX0:int;
         var posY0:int;
         var time:Number;
         var posX:int = 0;
         while(this.id in §_-h9§ && §_-h9§[this.id] != null)
         {
            ++this.id;
         }
         §_-h9§[this.id] = this;
         posX = int(§_-Zy§.§_-21V§ * 0.5) + 70 * int((this.id + 1) * 0.5) * (this.id % 2 == 0 ? 1 : -1);
         posY = 560;
         posX0 = int(this.x + posX) * 0.5;
         posY0 = this.y - 200;
         time = Math.sqrt(Math.pow(this.x - posX,2) + Math.pow(this.y - posY,2)) / §_-Bs§;
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
         var _loc1_:Object = §_-x1F§(this.type);
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
         Game.§_-q1L§.addChild(this);
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
         §_-h9§[this.id] = null;
         Game.§_-q1L§.removeChild(this);
         if(this.tween)
         {
            this.tween.§_-kl§();
         }
         var _loc2_:Object = §_-x1F§(this.type);
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
         §_-o1Q§.§_-K2u§(this.x,this.y,_loc2_["count"],§_-03E§(this.type),_loc3_,0,null,1.5,-35,-2,_loc4_ ? int(_loc2_["offsetY"]) : 0,!_loc4_);
         var _loc5_:int = -1;
         switch(this.type)
         {
            case §_-W27§:
               energy -= _loc2_["count"];
               Connection.§_-u2v§(§_-s2l§.§_-W27§,[§_-hO§.§_-i2E§ + energy + _loc2_["count"],0]);
               break;
            case §_-fz§:
               mana -= _loc2_["count"];
               Connection.§_-u2v§(§_-s2l§.§_-fz§,[§_-hO§.§_-Sy§ + mana + _loc2_["count"],0]);
               break;
            case §_-u1r§:
               _loc5_ = §_-n1C§.§_-q2W§(Box);
               break;
            case §_-H1F§:
               _loc5_ = §_-n1C§.§_-q2W§(Balk);
               break;
            case §_-X2§:
               _loc5_ = §_-n1C§.§_-q2W§(BalloonBody);
               break;
            case §_-Kw§:
               _loc5_ = §_-n1C§.§_-q2W§(Trampoline);
               break;
            case §_-M1U§:
               coins -= _loc2_["count"];
               Connection.§_-u2v§(§_-s2l§.§_-K1j§,[Game.self.coins + coins + _loc2_["count"],Game.self.nuts,0]);
         }
      }
   }
}

