package §_-H7§
{
   import §_-42B§.TweenMax;
   import §_-I10§.§_-428§;
   import §_-e1G§.§_-o2Z§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import utils.StringUtil;
   import utils.§_-ex§;
   import utils.§_-r2N§;
   
   public class §_-b2x§ extends Sprite
   {
      
      protected static const §_-CD§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16777215,null,null,null,null,null,"center");
      
      protected static const §_-Fb§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,10,16711680);
      
      protected static var §_-y2v§:int = 0;
      
      protected static var §_-81x§:Array = [];
      
      protected static var elements:Vector.<§_-b2x§> = new Vector.<§_-b2x§>(0);
      
      protected var parentIssuance:Sprite = null;
      
      protected var type:int = 0;
      
      protected var index:int = 0;
      
      protected var value:int = 0;
      
      protected var count:int = 0;
      
      protected var offsetX:int = 0;
      
      protected var offsetY:int = 0;
      
      protected var tween:TweenMax = null;
      
      private var icon:DisplayObject = null;
      
      private var §_-XW§:§_-o2Z§ = null;
      
      public function §_-b2x§(param1:int, param2:int, param3:int, param4:int = 1, param5:int = 0, param6:int = 0)
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
         this.§_-p1F§();
         this.§_-92J§();
      }
      
      public static function §_-5D§(param1:Function) : void
      {
         §_-81x§.push(param1);
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
         ++§_-y2v§;
         elements.push(this);
         if(§_-428§.§_-u2l§[this.type])
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
         var _loc3_:§_-22V§ = null;
         var _loc4_:String = null;
         this.icon = new §_-Zh§(this.type,this.value);
         var _loc1_:Sprite = new Sprite();
         _loc1_.addChild(this.icon);
         switch(this.type)
         {
            case §_-428§.§_-113§:
               _loc3_ = new §_-22V§(this.count + " " + StringUtil.word("монет",this.count),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-428§.§_-wG§:
               _loc3_ = new §_-22V§(this.count + " " + StringUtil.word("орехов",this.count),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-428§.§_-61Q§:
               _loc3_ = new §_-22V§(this.count.toString(),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5) - 6;
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               _loc2_ = new ImageIconEnergy();
               _loc2_.x = _loc3_.x + _loc3_.textWidth + 4;
               _loc2_.y = _loc3_.y + 2;
               _loc1_.addChild(_loc2_);
               break;
            case §_-428§.§_-a1H§:
               _loc3_ = new §_-22V§(this.count.toString(),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5) - 6;
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               _loc2_ = new ImageIconMana();
               _loc2_.x = _loc3_.x + _loc3_.textWidth + 4;
               _loc2_.y = _loc3_.y + 2;
               _loc1_.addChild(_loc2_);
               break;
            case §_-428§.§_-8r§:
               _loc3_ = new §_-22V§(this.count + " " + StringUtil.word("очко",this.count),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-428§.§_-O2P§:
               _loc3_ = new §_-22V§(§_-ex§.§_-a1G§(this.count * (24 * 60 * 60)),0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-428§.§_-Z2n§:
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
               _loc3_ = new §_-22V§(_loc4_,0,0,§_-CD§);
               _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
               _loc3_.y = _loc1_.height + 8;
               _loc1_.addChild(_loc3_);
               break;
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
               if(this.count > 0)
               {
                  _loc3_ = new §_-22V§(§_-ex§.§_-a1G§(this.count * (24 * 60 * 60)),0,0,§_-CD§);
                  _loc3_.x = int((_loc1_.width - _loc3_.textWidth) * 0.5);
                  _loc3_.y = _loc1_.height + 8;
                  _loc1_.addChild(_loc3_);
               }
         }
         return _loc1_;
      }
      
      protected function get §_-p2W§() : String
      {
         var _loc1_:String = "";
         switch(this.type)
         {
            case §_-428§.§_-O2P§:
               _loc1_ = §_-ex§.§_-a1G§(this.count * (24 * 60 * 60),true);
               break;
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
               if(this.count > 0)
               {
                  _loc1_ = §_-ex§.§_-a1G§(this.count * (24 * 60 * 60),true);
               }
               break;
            default:
               _loc1_ = this.count.toString();
         }
         return _loc1_;
      }
      
      protected function get §_-WV§() : DisplayObject
      {
         return new §_-z1v§(this.type,this.value);
      }
      
      protected function get §_-U1n§() : uint
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
      
      protected function §_-p1F§() : void
      {
         var _loc1_:DisplayObject = this.image;
         _loc1_.x = -(_loc1_.width * 0.5);
         _loc1_.y = -(_loc1_.height * 0.5);
         _loc1_.name = "image";
         addChild(_loc1_);
      }
      
      protected function §_-92J§() : void
      {
         this.§_-XW§ = new §_-o2Z§(this,§_-428§.§_-L2n§(this.type,this.value),§_-428§.§_-64§(this.type,this.value));
      }
      
      protected function takeReward(param1:MouseEvent = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Function = null;
         if(!this.parentIssuance.contains(this))
         {
            return;
         }
         --§_-y2v§;
         if(§_-y2v§ == 0)
         {
            _loc2_ = §_-81x§.slice();
            §_-81x§ = [];
            while(_loc2_.length > 0)
            {
               _loc3_ = _loc2_.shift();
               _loc3_.apply();
            }
            elements = new Vector.<§_-b2x§>(0);
         }
         this.parentIssuance.removeChild(this);
         §_-r2N§.§_-A3v§(this.x,this.y,this.§_-p2W§,this.type,this.§_-WV§,0,null,1.5,-35,-2);
         this.§_-XW§.remove();
         this.§_-XW§ = null;
         GameSounds.play("bundle_item_take");
      }
      
      protected function glow() : void
      {
         var target:Object = null;
         var color:uint = 0;
         target = this.icon || this;
         color = this.§_-U1n§;
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

