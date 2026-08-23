package §_-D0§
{
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-f4§;
   import §_-u1R§.§_-g1m§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-B1d§;
   import utils.§_-o1Q§;
   
   public class §_-33U§ extends Sprite
   {
      
      public static const §_-i2u§:int = 101;
      
      private static const §_-F1z§:int = 197;
      
      private static const §_-15§:int = 80;
      
      private static const §_-dI§:int = 80;
      
      private static const §_-b2k§:int = 72;
      
      private static const §_-ei§:int = 18;
      
      private static const §_-g1z§:int = 8;
      
      private static const PAD:int = 8;
      
      private static const §_-lk§:int = 40;
      
      private static const §_-D1j§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,18,16777215,true,null,null,null,null,"center");
      
      private static const §_-q1K§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,7487780,true);
      
      private static const §_-eo§:Array = [new GlowFilter(0,1,4,4,0.6,2)];
      
      private var §_-53S§:DisplayObject;
      
      private var §_-f1G§:§_-K2G§;
      
      private var §_-jg§:DisplayObject;
      
      private var §_-C3U§:§_-K2G§;
      
      private var §_-H2F§:DisplayObject;
      
      private var §_-FF§:§_-K2G§;
      
      private var level:int;
      
      private var §_-Sa§:int;
      
      private var §_-V2z§:int;
      
      private var §_-i1K§:Object;
      
      private var §_-iE§:Object;
      
      private var passType:int;
      
      private var glowFilter:Array;
      
      public function §_-33U§()
      {
         super();
      }
      
      public function build(param1:int, param2:Object, param3:Object, param4:uint, param5:int) : void
      {
         this.level = param1;
         this.§_-i1K§ = param2;
         this.§_-iE§ = param3;
         this.§_-Sa§ = param2 ? int(param2.rewardId) : 0;
         this.§_-V2z§ = param3 ? int(param3.rewardId) : 0;
         this.passType = param5;
         addChild(this.§_-Y1q§(param4));
         var _loc6_:int = (§_-i2u§ - §_-dI§) * 0.5;
         var _loc7_:Sprite = this.§_-8u§(false);
         _loc7_.x = §_-F1z§ - §_-b2k§ - §_-15§;
         _loc7_.y = _loc6_;
         this.§_-31s§(_loc7_,param2);
         this.§_-53S§ = this.§_-UR§(new ImageIconNuttyPassTaken(),21,§_-15§ - 10,6);
         _loc7_.addChild(this.§_-53S§);
         this.§_-f1G§ = this.§_-CH§(gls("Забрать"),this.§_-k2n§);
         _loc7_.addChild(this.§_-f1G§);
         addChild(_loc7_);
         var _loc8_:Sprite = this.§_-8u§(true);
         _loc8_.x = §_-F1z§ + §_-b2k§;
         _loc8_.y = _loc6_;
         this.§_-31s§(_loc8_,param3);
         this.§_-jg§ = this.§_-UR§(new ImageIconNuttyPassTaken(),21,§_-15§,6);
         _loc8_.addChild(this.§_-jg§);
         this.§_-H2F§ = this.§_-UR§(new ImageIconNuttyPassLock(),0,§_-15§,6);
         this.§_-H2F§.rotation = 18;
         _loc8_.addChild(this.§_-H2F§);
         this.§_-FF§ = this.§_-CH§(gls("Открыть"),this.§_-O2J§);
         this.§_-FF§.§_-y2W§();
         _loc8_.addChild(this.§_-FF§);
         this.§_-C3U§ = this.§_-CH§(gls("Забрать"),this.§_-n2X§);
         this.§_-C3U§.§_-y2W§();
         _loc8_.addChild(this.§_-C3U§);
         addChild(_loc8_);
         this.glowFilter = [new GlowFilter(param4,0.3,16,16,2)];
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         var _loc3_:Boolean = param1 > 0;
         var _loc4_:Boolean = _loc3_ && this.level > param1;
         this.alpha = _loc4_ ? 0.65 : 1;
         this.filters = !_loc4_ && param1 == this.level ? this.glowFilter : [];
         var _loc5_:Boolean = §_-f4§.§_-a1M§(this.§_-Sa§);
         this.§_-53S§.visible = _loc3_ && !_loc4_ && !_loc5_;
         this.§_-f1G§.visible = !_loc4_ && _loc5_;
         var _loc6_:Boolean = §_-f4§.§_-a1M§(this.§_-V2z§);
         this.§_-C3U§.visible = !_loc4_ && param2 && _loc6_;
         this.§_-jg§.visible = _loc3_ && !_loc4_ && param2 && !_loc6_;
         this.§_-H2F§.visible = _loc3_ && !_loc4_ && !param2;
         this.§_-FF§.visible = this.§_-H2F§.visible && NuttyPassManager.§_-13X§(this.passType);
      }
      
      private function §_-Y1q§(param1:uint) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.x = §_-F1z§;
         _loc2_.y = §_-i2u§ * 0.5;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.drawRoundRect(-§_-ei§,-§_-ei§,§_-ei§ * 2,§_-ei§ * 2,8,8);
         _loc3_.graphics.endFill();
         _loc3_.rotation = 45;
         _loc2_.addChild(_loc3_);
         var _loc4_:§_-i5§ = new §_-i5§(String(this.level),0,0,§_-D1j§,36);
         _loc4_.x = -_loc4_.width * 0.5;
         _loc4_.y = -_loc4_.height * 0.5 - 2;
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
      
      private function §_-8u§(param1:Boolean) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:uint = param1 ? uint(16238424) : uint(16049098);
         var _loc4_:uint = param1 ? uint(16508584) : uint(16777215);
         var _loc5_:Shape = new Shape();
         _loc5_.graphics.beginFill(_loc4_);
         _loc5_.graphics.lineStyle(2,_loc3_);
         _loc5_.graphics.drawRoundRect(0,0,§_-15§,§_-dI§,18,18);
         _loc5_.graphics.endFill();
         _loc2_.addChild(_loc5_);
         var _loc6_:Shape = new Shape();
         var _loc7_:Graphics = _loc6_.graphics;
         var _loc8_:int = param1 ? -1 : 1;
         _loc7_.beginFill(_loc3_);
         _loc7_.moveTo(0,-§_-g1z§);
         _loc7_.lineTo(10 * _loc8_,0);
         _loc7_.lineTo(0,§_-g1z§);
         _loc7_.lineTo(0,-§_-g1z§);
         _loc7_.endFill();
         _loc6_.x = param1 ? 0 : §_-15§;
         _loc6_.y = §_-dI§ * 0.5;
         _loc2_.addChild(_loc6_);
         return _loc2_;
      }
      
      private function §_-UR§(param1:DisplayObject, param2:int, param3:int, param4:int) : DisplayObject
      {
         if(param2 > 0)
         {
            param1.scaleX = param1.scaleY = param2 / param1.width;
         }
         param1.x = param3 - param1.width * 0.5;
         param1.y = param4 - param1.height * 0.5;
         param1.filters = §_-eo§;
         param1.visible = false;
         return param1;
      }
      
      private function §_-CH§(param1:String, param2:Function) : §_-K2G§
      {
         var _loc3_:§_-K2G§ = new §_-K2G§(param1,§_-15§ + 2,13,param2);
         _loc3_.x = (§_-15§ - _loc3_.width) * 0.5;
         _loc3_.y = §_-dI§ - _loc3_.height * 0.5;
         _loc3_.visible = false;
         return _loc3_;
      }
      
      private function §_-31s§(param1:Sprite, param2:Object) : void
      {
         if(!param2)
         {
            return;
         }
         var _loc3_:Array = param2.items is Array ? param2.items : null;
         var _loc4_:Sprite = new Sprite();
         param1.addChild(_loc4_);
         if(!_loc3_ || _loc3_.length <= 1)
         {
            this.§_-R1f§(_loc4_,param2);
         }
         else
         {
            this.§_-N1K§(_loc4_,_loc3_);
         }
      }
      
      private function §_-R1f§(param1:Sprite, param2:Object) : void
      {
         var text:String;
         var layout:Function;
         var icon:DisplayObject = null;
         var field:§_-i5§ = null;
         var container:Sprite = param1;
         var reward:Object = param2;
         icon = new §_-g1m§(reward.type,reward.id);
         container.addChild(icon);
         text = this.§_-js§(reward.type,reward.count);
         field = null;
         if(text)
         {
            field = new §_-i5§(text,0,0,§_-q1K§);
            container.addChild(field);
         }
         layout = function():void
         {
            icon.scaleX = icon.scaleY = §_-lk§ / Math.max(icon.width,icon.height);
            if(field)
            {
               field.x = (icon.width - field.width) * 0.5;
               field.y = icon.height + 2;
            }
            §_-K§(container);
         };
         if(this.§_-i2f§(reward.type))
         {
            icon.addEventListener(Event.COMPLETE,function onLoaded(param1:Event):void
            {
               icon.removeEventListener(Event.COMPLETE,onLoaded);
               layout();
            });
         }
         else
         {
            layout();
         }
      }
      
      private function §_-N1K§(param1:Sprite, param2:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Sprite = null;
         var _loc3_:Array = [];
         var _loc4_:Number = 0;
         for each(_loc5_ in param2)
         {
            _loc8_ = this.§_-v1p§(_loc5_);
            _loc3_.push(_loc8_);
            if(_loc8_.width > _loc4_)
            {
               _loc4_ = _loc8_.width;
            }
         }
         _loc6_ = 0;
         for each(_loc8_ in _loc3_)
         {
            _loc8_.x = int((_loc4_ - _loc8_.width) * 0.5);
            _loc8_.y = _loc6_;
            _loc6_ += _loc8_.height + 4;
            param1.addChild(_loc8_);
         }
         _loc7_ = §_-15§ - PAD * 2;
         if(param1.width > _loc7_ || param1.height > _loc7_)
         {
            param1.scaleX = param1.scaleY = Math.min(_loc7_ / param1.width,_loc7_ / param1.height);
         }
         this.§_-K§(param1);
      }
      
      private function §_-v1p§(param1:Object) : Sprite
      {
         var _loc5_:§_-i5§ = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-g1m§ = new §_-g1m§(param1.type,param1.id);
         _loc2_.addChild(_loc3_);
         var _loc4_:String = this.§_-js§(param1.type,param1.count);
         if(_loc4_)
         {
            _loc5_ = new §_-i5§(_loc4_,0,0,§_-q1K§);
            _loc5_.x = _loc3_.width + 2;
            _loc5_.y = (_loc3_.height - _loc5_.height) * 0.5;
            _loc2_.addChild(_loc5_);
         }
         return _loc2_;
      }
      
      private function §_-K§(param1:Sprite) : void
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         var _loc3_:int = §_-15§ - PAD * 2;
         param1.x = PAD + (_loc3_ - param1.width) * 0.5 - _loc2_.x * param1.scaleX;
         param1.y = PAD + (_loc3_ - param1.height) * 0.5 - _loc2_.y * param1.scaleY;
      }
      
      private function §_-k2n§(param1:Event = null) : void
      {
         GameSounds.play(§_-RH§.§_-T1§);
         §_-o1Q§.§_-i1g§(this.§_-f1G§,this.§_-i1K§);
         §_-f4§.§_-6M§(this.§_-Sa§);
      }
      
      private function §_-n2X§(param1:Event = null) : void
      {
         GameSounds.play(§_-RH§.§_-T1§);
         §_-o1Q§.§_-i1g§(this.§_-C3U§,this.§_-iE§);
         §_-f4§.§_-6M§(this.§_-V2z§);
      }
      
      private function §_-O2J§(param1:Event = null) : void
      {
         NuttyPassManager.§_-L2Y§(this.passType);
      }
      
      private function §_-i2f§(param1:int) : Boolean
      {
         return param1 == §_-A3y§.§_-33h§ || param1 == §_-A3y§.§_-o2t§;
      }
      
      private function §_-js§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
            case §_-A3y§.§_-l2X§:
            case §_-A3y§.§_-W27§:
            case §_-A3y§.§_-fz§:
            case §_-A3y§.§_-j1G§:
               return param2 > 0 ? String(param2) : "";
            case §_-A3y§.§_-y2q§:
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
               return param2 > 0 ? §_-B1d§.§_-wQ§(param2 * 86400,true) : "";
            default:
               return param2 > 1 ? String(param2) : "";
         }
      }
   }
}

