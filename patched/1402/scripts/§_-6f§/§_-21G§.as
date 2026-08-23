package §_-6f§
{
   import §_-01t§.§_-p1O§;
   import §_-Qy§.§_-x2d§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-73B§;
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-VZ§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-t2c§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-21G§ extends Dialog
   {
      
      public static const §_-zx§:Array = [new BevelFilter(1,58,16724736,1,16763904,1,2,2),new GlowFilter(16777215,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private static var §_-p2j§:Object = {};
      
      private var type:int = -1;
      
      public function §_-21G§(param1:int)
      {
         var _loc10_:Sprite = null;
         this.type = param1;
         var _loc2_:§_-VZ§ = §_-C3E§.§_-L2Q§(param1);
         super(_loc2_.name,true);
         var _loc3_:DisplayObject = new DialogBundleBack();
         addChild(_loc3_);
         var _loc4_:§_-i5§ = new §_-i5§(this.text,0,0,new TextFormat(null,14,7027231,true));
         _loc4_.x = int((_loc3_.width - _loc4_.textWidth) * 0.5);
         addChild(_loc4_);
         _loc3_ = this.§_-c2z§;
         _loc3_.scaleX = _loc3_.scaleY = 1.2;
         _loc3_.x = 210 - int(_loc3_.width * 0.5);
         _loc3_.y = 80;
         addChild(_loc3_);
         _loc4_ = new §_-i5§(this.§_-l1D§,0,275,new TextFormat(§_-i5§.§_-p1s§,15,16733461));
         _loc4_.x = 210 - int(_loc4_.textWidth * 0.5);
         _loc4_.filters = §_-zx§;
         addChild(_loc4_);
         var _loc5_:§_-x2d§ = new §_-x2d§();
         _loc5_.y = 20;
         _loc5_.§_-52M§ = _loc2_.§_-52M§;
         addChild(_loc5_);
         var _loc6_:Vector.<§_-73B§> = _loc2_.§_-71h§;
         var _loc7_:Sprite = new Sprite();
         addChild(_loc7_);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc10_ = new Sprite();
            _loc10_.x = _loc8_ < 3 ? 5 + _loc8_ % 3 * 140 : 35 + _loc8_ % 3 * 185;
            _loc10_.y = 320 + int(_loc8_ / 3) * 60;
            _loc7_.addChild(_loc10_);
            _loc3_ = new _loc6_[_loc8_].imageClass();
            _loc10_.addChild(_loc3_);
            new §_-kr§(_loc3_,§_-p1O§.§_-R2x§(_loc6_[_loc8_].imageClass));
            _loc4_ = new §_-i5§(_loc6_[_loc8_].description,_loc3_.width + 5,0,§_-p1O§.§_-C1Q§);
            _loc4_.wordWrap = true;
            _loc4_.width = 145;
            _loc4_.y = (_loc3_.height - _loc4_.textHeight) * 0.5 - 2;
            _loc10_.addChild(_loc4_);
            _loc8_++;
         }
         var _loc9_:§_-K2G§ = new §_-K2G§(gls("В банк"));
         _loc9_.x = 210 - int(_loc9_.width * 0.5);
         _loc9_.y = 440;
         _loc9_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(_loc9_);
         place();
         switch(this.type)
         {
            case §_-C3E§.§_-ev§:
            case §_-C3E§.§_-l1w§:
               this.width -= 70;
               this.height += 40;
         }
         this.§_-x2T§.x = this.width - 35;
      }
      
      public static function show(param1:int) : void
      {
         var type:int = param1;
         if(type in §_-p2j§)
         {
            return;
         }
         §_-p2j§[type] = true;
         §_-t2c§.addCallback(function():void
         {
            §_-U2d§.load(function():void
            {
               new §_-21G§(type).show();
            },true);
         });
      }
      
      private function get §_-c2z§() : DisplayObject
      {
         switch(this.type)
         {
            case §_-C3E§.§_-ev§:
               return new ImageBundleNewbieRich();
            case §_-C3E§.§_-l1w§:
               return new ImageBundleNewbiePoor();
            default:
               return null;
         }
      }
      
      private function get text() : String
      {
         switch(this.type)
         {
            case §_-C3E§.§_-ev§:
               return gls("Незаменимая помощь на первых порах!");
            case §_-C3E§.§_-l1w§:
               return gls("Помощь юным белкам по невероятно выгодной цене!");
            default:
               return "";
         }
      }
      
      private function get §_-l1D§() : String
      {
         switch(this.type)
         {
            case §_-C3E§.§_-ev§:
            case §_-C3E§.§_-l1w§:
               return gls("Ограниченное предложение!");
            default:
               return "";
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         hide();
         Services.bank.open();
         §_-p1O§.§_-V1C§(this.type);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 5;
         this.§_-7N§ = 5;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
   }
}

