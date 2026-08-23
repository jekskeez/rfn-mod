package §_-u1R§
{
   import §_-22D§.TweenMax;
   import §_-S1n§.§_-f1W§;
   import §_-X1k§.§_-A3y§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import utils.StringUtil;
   import utils.§_-B1d§;
   import utils.§_-o1Q§;
   
   public class §_-2r§ extends Sprite
   {
      
      protected static const §_-C1Q§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16777215,null,null,null,null,null,"center");
      
      protected static const §_-z1o§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,10,16711680);
      
      protected static var §_-q1u§:int = 0;
      
      protected static var §_-H2A§:Array = [];
      
      protected static var elements:Vector.<§_-2r§> = new Vector.<§_-2r§>(0);
      
      protected var parentIssuance:Sprite = null;
      
      protected var type:int = 0;
      
      protected var index:int = 0;
      
      protected var value:int = 0;
      
      protected var count:int = 0;
      
      protected var offsetX:int = 0;
      
      protected var offsetY:int = 0;
      
      protected var tween:TweenMax = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-oj§:§_-f1W§ = null;
      
      public function §_-2r§(param1:int, param2:int, param3:int, param4:int = 1, param5:int = 0, param6:int = 0)
      {
         super();
         this.type = param1;
         this.index = param2;
         this.value = param3;
         this.count = param4;
         this.offsetX = param5;
         this.offsetY = param6;
         this.x = int(Game.starling.stage.stageWidth * 0.5);
         this.y = int(Game.starling.stage.stageHeight * 0.5);
         this.§_-bQ§();
         this.§_-z2m§();
      }
      
      public static function §_-ac§(param1:Function) : void
      {
         §_-H2A§.push(param1);
      }
      
      public static function hide() : void
      {
         while(elements.length > 0)
         {
            elements.shift().takeReward();
         }
      }
      
      public function show(param1:Sprite) : void
      {
         var parentIssuance:Sprite = param1;
         this.parentIssuance = parentIssuance;
         this.parentIssuance.addChildAt(this,0);
         ++§_-q1u§;
         elements.push(this);
         if(§_-A3y§.§_-vg§[this.type])
         {
            this.offsetX += 50 - Math.random() * 100;
            this.offsetY += 50 - Math.random() * 100;
         }
         TweenMax.to(this,0.2,{
            "x":this.posX + this.offsetX,
            "y":this.posY + this.offsetY,
            "delay":this.index * 0.1,
            "onComplete":function():void
            {
               glow();
            }
         });
      }
      
      protected function get image() : DisplayObject
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:§_-i5§ = null;
         var _loc4_:String = null;
         this.icon = new §_-u1F§(this.type,this.value);
         var _loc1_:Sprite = new Sprite();
         _loc1_.addChild(this.icon);
         switch(this.type)
         {
            case §_-A3y§.§_-M1U§:
               _loc3_ = new §_-i5§(this.count + " " + StringUtil.word("монет",this.count),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-A3y§.§_-l2X§:
               _loc3_ = new §_-i5§(this.count + " " + StringUtil.word("орехов",this.count),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-A3y§.§_-W27§:
               _loc3_ = new §_-i5§(this.count.toString(),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5) - 6;
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               _loc2_ = new ImageIconEnergy();
               _loc2_.x = _loc3_.x + _loc3_.textWidth + 4;
               _loc2_.y = _loc3_.y + 2;
               _loc1_.addChild(_loc2_);
               break;
            case §_-A3y§.§_-fz§:
               _loc3_ = new §_-i5§(this.count.toString(),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5) - 6;
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               _loc2_ = new ImageIconMana();
               _loc2_.x = _loc3_.x + _loc3_.textWidth + 4;
               _loc2_.y = _loc3_.y + 2;
               _loc1_.addChild(_loc2_);
               break;
            case §_-A3y§.§_-j1G§:
               _loc3_ = new §_-i5§(this.count + " " + StringUtil.word("очко",this.count),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-A3y§.§_-y2q§:
               _loc3_ = new §_-i5§(§_-B1d§.§_-wQ§(this.count * (24 * 60 * 60)),0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-A3y§.§_-Z2h§:
               switch(this.value)
               {
                  case 0:
                     _loc4_ = gls("{0} случайных\nколлекций",this.count);
                     break;
                  case 1:
                     _loc4_ = gls("{0} редких\nколлекций",this.count);
                     break;
                  default:
                     _loc4_ = "";
               }
               _loc3_ = new §_-i5§(_loc4_,0,0,§_-C1Q§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
               if(this.count > 0)
               {
                  _loc3_ = new §_-i5§(§_-B1d§.§_-wQ§(this.count * (24 * 60 * 60)),0,0,§_-C1Q§);
                  _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
                  _loc3_.y = _loc1_.height + 8;
                  _loc1_.addChild(_loc3_);
               }
         }
         return _loc1_;
      }
      
      protected function get §_-38§() : String
      {
         var _loc1_:String = "";
         switch(this.type)
         {
            case §_-A3y§.§_-y2q§:
               _loc1_ = §_-B1d§.§_-wQ§(this.count * (24 * 60 * 60),true);
               break;
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
               if(this.count > 0)
               {
                  _loc1_ = §_-B1d§.§_-wQ§(this.count * (24 * 60 * 60),true);
               }
               break;
            default:
               _loc1_ = this.count.toString();
         }
         return _loc1_;
      }
      
      protected function get §_-61a§() : DisplayObject
      {
         return new §_-g1m§(this.type,this.value);
      }
      
      protected function get §_-p23§() : uint
      {
         return 16777164;
      }
      
      protected function get posX() : int
      {
         return int(Game.starling.stage.stageWidth * 0.5) - 300 * ((this.index + 1) % 3 - 1);
      }
      
      protected function get posY() : int
      {
         var _loc1_:int = this.index % 3 == 0 ? 150 : 200;
         return this.index < 3 ? int(Game.starling.stage.stageHeight - _loc1_) : _loc1_;
      }
      
      protected function §_-bQ§() : void
      {
         var _loc1_:DisplayObject = this.image;
         _loc1_.x = -(_loc1_.width * 0.5);
         _loc1_.y = -(_loc1_.height * 0.5);
         _loc1_.name = "image";
         addChild(_loc1_);
      }
      
      protected function §_-z2m§() : void
      {
         this.§_-oj§ = new §_-f1W§(this,§_-A3y§.§_-z1m§(this.type,this.value),§_-A3y§.§_-i1F§(this.type,this.value));
      }
      
      protected function takeReward(param1:MouseEvent = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Function = null;
         if(!this.parentIssuance.contains(this))
         {
            return;
         }
         --§_-q1u§;
         if(§_-q1u§ == 0)
         {
            _loc2_ = §_-H2A§.slice();
            §_-H2A§ = [];
            while(_loc2_.length > 0)
            {
               _loc3_ = _loc2_.shift();
               _loc3_.apply();
            }
            elements = new Vector.<§_-2r§>(0);
         }
         this.parentIssuance.removeChild(this);
         §_-o1Q§.§_-K2u§(this.x,this.y,this.§_-38§,this.type,this.§_-61a§,0,null,1.5,-35,-2);
         this.§_-oj§.remove();
         this.§_-oj§ = null;
         GameSounds.play("bundle_item_take");
      }
      
      protected function glow() : void
      {
         var target:Object = null;
         var color:uint = 0;
         target = this.icon || this;
         color = this.§_-p23§;
         this.tween = TweenMax.to(target,0.2,{
            "glowFilter":{
               "color":color,
               "alpha":1,
               "blurX":0,
               "blurY":0,
               "strength":1
            },
            "onComplete":function():void
            {
               tween = TweenMax.to(target,0.5,{
                  "glowFilter":{
                     "color":color,
                     "alpha":1,
                     "blurX":5,
                     "blurY":5,
                     "strength":1
                  },
                  "onComplete":function():void
                  {
                     tween = TweenMax.to(target,0.5,{
                        "glowFilter":{
                           "color":color,
                           "alpha":1,
                           "blurX":15,
                           "blurY":15,
                           "strength":4
                        },
                        "onComplete":function():void
                        {
                           tween = TweenMax.to(target,1,{
                              "glowFilter":{
                                 "color":color,
                                 "alpha":1,
                                 "blurX":5,
                                 "blurY":5,
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
   }
}

