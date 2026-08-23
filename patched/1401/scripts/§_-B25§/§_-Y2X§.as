package §_-B25§
{
   import §_-H7§.§_-z1v§;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-A29§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-ex§;
   import utils.§_-r2N§;
   
   public class §_-Y2X§ extends Sprite
   {
      
      public static const §_-kI§:int = 101;
      
      private static const §_-n2j§:int = 197;
      
      private static const §_-11r§:int = 80;
      
      private static const §_-h6§:int = 80;
      
      private static const §_-b13§:int = 72;
      
      private static const §_-71G§:int = 18;
      
      private static const §_-pH§:int = 8;
      
      private static const PAD:int = 8;
      
      private static const §_-Aq§:int = 40;
      
      private static const §_-d1x§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,18,16777215,true,null,null,null,null,"center");
      
      private static const §_-lP§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,7487780,true);
      
      private static const §_-M2X§:Array = [new GlowFilter(0,1,4,4,0.6,2)];
      
      private var §_-B17§:DisplayObject;
      
      private var §_-M1G§:§_-j18§;
      
      private var §_-ye§:DisplayObject;
      
      private var §_-Y1Z§:§_-j18§;
      
      private var §_-jd§:DisplayObject;
      
      private var §_-r27§:§_-j18§;
      
      private var level:int;
      
      private var §_-83A§:int;
      
      private var §_-A36§:int;
      
      private var §_-w1A§:Object;
      
      private var §_-X1W§:Object;
      
      private var passType:int;
      
      private var glowFilter:Array;
      
      public function §_-Y2X§()
      {
         super();
      }
      
      public function build(param1:int, param2:Object, param3:Object, param4:uint, param5:int) : void
      {
         this.level = param1;
         this.§_-w1A§ = param2;
         this.§_-X1W§ = param3;
         this.§_-83A§ = param2 ? int(param2.rewardId) : 0;
         this.§_-A36§ = param3 ? int(param3.rewardId) : 0;
         this.passType = param5;
         addChild(this.§_-c18§(param4));
         var _loc6_:int = (§_-kI§ - §_-h6§) * 0.5;
         var _loc7_:Sprite = this.§_-U2i§(false);
         _loc7_.x = §_-n2j§ - §_-b13§ - §_-11r§;
         _loc7_.y = _loc6_;
         this.§_-02K§(_loc7_,param2);
         this.§_-B17§ = this.§_-tm§(new ImageIconNuttyPassTaken(),21,§_-11r§ - 10,6);
         _loc7_.addChild(this.§_-B17§);
         this.§_-M1G§ = this.§_-l1t§(gls("Забрать"),this.§_-dz§);
         _loc7_.addChild(this.§_-M1G§);
         addChild(_loc7_);
         var _loc8_:Sprite = this.§_-U2i§(true);
         _loc8_.x = §_-n2j§ + §_-b13§;
         _loc8_.y = _loc6_;
         this.§_-02K§(_loc8_,param3);
         this.§_-ye§ = this.§_-tm§(new ImageIconNuttyPassTaken(),21,§_-11r§,6);
         _loc8_.addChild(this.§_-ye§);
         this.§_-jd§ = this.§_-tm§(new ImageIconNuttyPassLock(),0,§_-11r§,6);
         this.§_-jd§.rotation = 18;
         _loc8_.addChild(this.§_-jd§);
         this.§_-r27§ = this.§_-l1t§(gls("Открыть"),this.§_-e5§);
         this.§_-r27§.§_-81E§();
         _loc8_.addChild(this.§_-r27§);
         this.§_-Y1Z§ = this.§_-l1t§(gls("Забрать"),this.§_-C1V§);
         this.§_-Y1Z§.§_-81E§();
         _loc8_.addChild(this.§_-Y1Z§);
         addChild(_loc8_);
         this.glowFilter = [new GlowFilter(param4,0.3,16,16,2)];
      }
      
      public function update(param1:int, param2:Boolean) : void
      {
         var _loc3_:Boolean = param1 > 0;
         var _loc4_:Boolean = _loc3_ && this.level > param1;
         this.alpha = _loc4_ ? 0.65 : 1;
         this.filters = !_loc4_ && param1 == this.level ? this.glowFilter : [];
         var _loc5_:Boolean = §_-A29§.§_-nT§(this.§_-83A§);
         this.§_-B17§.visible = _loc3_ && !_loc4_ && !_loc5_;
         this.§_-M1G§.visible = !_loc4_ && _loc5_;
         var _loc6_:Boolean = §_-A29§.§_-nT§(this.§_-A36§);
         this.§_-Y1Z§.visible = !_loc4_ && param2 && _loc6_;
         this.§_-ye§.visible = _loc3_ && !_loc4_ && param2 && !_loc6_;
         this.§_-jd§.visible = _loc3_ && !_loc4_ && !param2;
         this.§_-r27§.visible = this.§_-jd§.visible && NuttyPassManager.§_-U28§(this.passType);
      }
      
      private function §_-c18§(param1:uint) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.x = §_-n2j§;
         _loc2_.y = §_-kI§ * 0.5;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.drawRoundRect(-§_-71G§,-§_-71G§,§_-71G§ * 2,§_-71G§ * 2,8,8);
         _loc3_.graphics.endFill();
         _loc3_.rotation = 45;
         _loc2_.addChild(_loc3_);
         var _loc4_:§_-22V§ = new §_-22V§(String(this.level),0,0,§_-d1x§,36);
         _loc4_.x = -_loc4_.width * 0.5;
         _loc4_.y = -_loc4_.height * 0.5 - 2;
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
      
      private function §_-U2i§(param1:Boolean) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:uint = param1 ? uint(16238424) : uint(16049098);
         var _loc4_:uint = param1 ? uint(16508584) : uint(16777215);
         var _loc5_:Shape = new Shape();
         _loc5_.graphics.beginFill(_loc4_);
         _loc5_.graphics.lineStyle(2,_loc3_);
         _loc5_.graphics.drawRoundRect(0,0,§_-11r§,§_-h6§,18,18);
         _loc5_.graphics.endFill();
         _loc2_.addChild(_loc5_);
         var _loc6_:Shape = new Shape();
         var _loc7_:Graphics = _loc6_.graphics;
         var _loc8_:int = param1 ? -1 : 1;
         _loc7_.beginFill(_loc3_);
         _loc7_.moveTo(0,-§_-pH§);
         _loc7_.lineTo(10 * _loc8_,0);
         _loc7_.lineTo(0,§_-pH§);
         _loc7_.lineTo(0,-§_-pH§);
         _loc7_.endFill();
         _loc6_.x = param1 ? 0 : §_-11r§;
         _loc6_.y = §_-h6§ * 0.5;
         _loc2_.addChild(_loc6_);
         return _loc2_;
      }
      
      private function §_-tm§(param1:DisplayObject, param2:int, param3:int, param4:int) : DisplayObject
      {
         if(param2 > 0)
         {
            param1.scaleX = param1.scaleY = param2 / param1.width;
         }
         param1.x = param3 - param1.width * 0.5;
         param1.y = param4 - param1.height * 0.5;
         param1.filters = §_-M2X§;
         param1.visible = false;
         return param1;
      }
      
      private function §_-l1t§(param1:String, param2:Function) : §_-j18§
      {
         var _loc3_:§_-j18§ = new §_-j18§(param1,§_-11r§ + 2,13,param2);
         _loc3_.x = (§_-11r§ - _loc3_.width) * 0.5;
         _loc3_.y = §_-h6§ - _loc3_.height * 0.5;
         _loc3_.visible = false;
         return _loc3_;
      }
      
      private function §_-02K§(param1:Sprite, param2:Object) : void
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
            this.§_-W17§(_loc4_,param2);
         }
         else
         {
            this.§_-tv§(_loc4_,_loc3_);
         }
      }
      
      private function §_-W17§(param1:Sprite, param2:Object) : void
      {
         var text:String;
         var layout:Function;
         var icon:DisplayObject = null;
         var field:§_-22V§ = null;
         var container:Sprite = param1;
         var reward:Object = param2;
         icon = new §_-z1v§(reward.type,reward.id);
         container.addChild(icon);
         text = this.§_-dp§(reward.type,reward.count);
         field = null;
         if(text)
         {
            field = new §_-22V§(text,0,0,§_-lP§);
            container.addChild(field);
         }
         layout = function():void
         {
            icon.scaleX = icon.scaleY = §_-Aq§ / Math.max(icon.width,icon.height);
            if(field)
            {
               field.x = (icon.width - field.width) * 0.5;
               field.y = icon.height + 2;
            }
            §_-62F§(container);
         };
         if(this.§_-o1f§(reward.type))
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
      
      private function §_-tv§(param1:Sprite, param2:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Sprite = null;
         var _loc3_:Array = [];
         var _loc4_:Number = 0;
         for each(_loc5_ in param2)
         {
            _loc8_ = this.§_-53v§(_loc5_);
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
         _loc7_ = §_-11r§ - PAD * 2;
         if(param1.width > _loc7_ || param1.height > _loc7_)
         {
            param1.scaleX = param1.scaleY = Math.min(_loc7_ / param1.width,_loc7_ / param1.height);
         }
         this.§_-62F§(param1);
      }
      
      private function §_-53v§(param1:Object) : Sprite
      {
         var _loc5_:§_-22V§ = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-z1v§ = new §_-z1v§(param1.type,param1.id);
         _loc2_.addChild(_loc3_);
         var _loc4_:String = this.§_-dp§(param1.type,param1.count);
         if(_loc4_)
         {
            _loc5_ = new §_-22V§(_loc4_,0,0,§_-lP§);
            _loc5_.x = _loc3_.width + 2;
            _loc5_.y = (_loc3_.height - _loc5_.height) * 0.5;
            _loc2_.addChild(_loc5_);
         }
         return _loc2_;
      }
      
      private function §_-62F§(param1:Sprite) : void
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         var _loc3_:int = §_-11r§ - PAD * 2;
         param1.x = PAD + (_loc3_ - param1.width) * 0.5 - _loc2_.x * param1.scaleX;
         param1.y = PAD + (_loc3_ - param1.height) * 0.5 - _loc2_.y * param1.scaleY;
      }
      
      private function §_-dz§(param1:Event = null) : void
      {
         GameSounds.play(§_-43Z§.§_-23R§);
         §_-r2N§.§_-73z§(this.§_-M1G§,this.§_-w1A§);
         §_-A29§.§_-A3l§(this.§_-83A§);
      }
      
      private function §_-C1V§(param1:Event = null) : void
      {
         GameSounds.play(§_-43Z§.§_-23R§);
         §_-r2N§.§_-73z§(this.§_-Y1Z§,this.§_-X1W§);
         §_-A29§.§_-A3l§(this.§_-A36§);
      }
      
      private function §_-e5§(param1:Event = null) : void
      {
         NuttyPassManager.§_-Yd§(this.passType);
      }
      
      private function §_-o1f§(param1:int) : Boolean
      {
         return param1 == §_-428§.§_-m2z§ || param1 == §_-428§.§_-N1P§;
      }
      
      private function §_-dp§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
            case §_-428§.§_-wG§:
            case §_-428§.§_-61Q§:
            case §_-428§.§_-a1H§:
            case §_-428§.§_-8r§:
               return param2 > 0 ? String(param2) : "";
            case §_-428§.§_-O2P§:
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
               return param2 > 0 ? §_-ex§.§_-a1G§(param2 * 86400,true) : "";
            default:
               return param2 > 1 ? String(param2) : "";
         }
      }
   }
}

