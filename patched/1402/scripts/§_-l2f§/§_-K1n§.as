package §_-l2f§
{
   import §_-X1k§.EventsManager;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-C3E§;
   import §_-bN§.§_-Sg§;
   import §_-i2r§.§_-e2O§;
   import §_-u1R§.§_-g1m§;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   
   public class §_-K1n§ extends §_-e2O§
   {
      
      private static const §_-F1H§:int = 320;
      
      private static const §_-VC§:int = 100;
      
      private static const §_-K1p§:int = 70;
      
      private static const §_-X1T§:int = 7;
      
      private static const §_-mx§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,8280118,false,null,null,null,null,"center");
      
      private static const §_-63D§:TextFormat = new TextFormat(§_-i5§.§_-c10§,15,7487780,true,null,null,null,null,"center");
      
      private var passType:int;
      
      private var §_-J2a§:int;
      
      public function §_-K1n§(param1:int)
      {
         this.passType = param1;
         this.§_-J2a§ = §_-C2b§.§_-W15§(param1);
         var _loc2_:Array = §_-C2b§.§_-MZ§(param1);
         super(§_-C2b§.§_-U1g§(param1),gls("Ореховый Пропуск"),§_-C2b§.§_-S14§(param1),true,true,null,false,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
         this.init();
      }
      
      private function init() : void
      {
         var _loc7_:Sprite = null;
         var _loc1_:Object = NuttyPassManager.§_-L11§(this.passType);
         var _loc2_:Sprite = new Sprite();
         if(Boolean(_loc1_.cosmetic) && _loc1_.cosmetic.length > 0)
         {
            _loc2_.addChild(this.§_-31b§(_loc1_.cosmetic,§_-VC§,false));
            _loc7_ = this.§_-31b§(_loc1_.items,§_-K1p§,true);
            _loc7_.y = §_-VC§ + 8;
            _loc2_.addChild(_loc7_);
         }
         else
         {
            _loc2_.addChild(this.§_-31b§(_loc1_.items,§_-K1p§,true));
         }
         _loc2_.x = 5;
         _loc2_.y = -10;
         addChild(_loc2_);
         var _loc3_:int = this.width - this.§_-01q§ - this.§_-7N§;
         var _loc4_:§_-i5§ = new §_-i5§(gls("Получи пропуск сейчас, чтобы открыть больше наград за уровни!"),0,0,§_-mx§,§_-F1H§);
         _loc4_.x = (_loc3_ - _loc4_.width) * 0.5;
         _loc4_.y = _loc2_.y + _loc2_.height + 10;
         addChild(_loc4_);
         var _loc5_:String = §_-Sg§.instance.getPriceString(§_-C3E§.§_-L2Q§(this.§_-J2a§).price);
         var _loc6_:§_-K2G§ = new §_-K2G§(_loc5_);
         _loc6_.x = (_loc3_ - _loc6_.width) * 0.5;
         _loc6_.y = _loc4_.y + _loc4_.height + 10;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-to§);
         addChild(_loc6_);
         EventsManager.addEventListener(EventsManager.CHANGE,this.§_-62z§);
         this.height = this.topOffset + this.§_-f2d§ + _loc6_.y + _loc6_.height + 15;
         this.§_-x2T§.x = _loc3_ - this.§_-x2T§.width;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         EventsManager.removeEventListener(EventsManager.CHANGE,this.§_-62z§);
         super.hide(param1);
      }
      
      private function §_-31b§(param1:Array, param2:int, param3:Boolean) : Sprite
      {
         var _loc9_:Object = null;
         var _loc10_:Sprite = null;
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(15524553);
         _loc4_.graphics.drawRoundRect(0,0,§_-F1H§,param2,§_-X1T§,§_-X1T§);
         _loc4_.graphics.endFill();
         if(!param1 || param1.length == 0)
         {
            return _loc4_;
         }
         var _loc5_:int = param3 ? 30 : 60;
         var _loc6_:int = param3 ? 12 : 17;
         var _loc7_:int = _loc5_ * param1.length + _loc6_ * (param1.length - 1);
         var _loc8_:Number = (§_-F1H§ - _loc7_) * 0.5;
         for each(_loc9_ in param1)
         {
            _loc10_ = this.§_-v1W§(_loc9_,_loc5_,param2);
            _loc10_.x = _loc8_;
            _loc4_.addChild(_loc10_);
            _loc8_ += _loc5_ + _loc6_;
         }
         return _loc4_;
      }
      
      private function §_-v1W§(param1:Object, param2:int, param3:int) : Sprite
      {
         var caption:String;
         var layout:Function;
         var content:Sprite = null;
         var icon:DisplayObject = null;
         var valueField:§_-i5§ = null;
         var item:Object = param1;
         var iconSize:int = param2;
         var cardHeight:int = param3;
         var cell:Sprite = new Sprite();
         content = new Sprite();
         cell.addChild(content);
         icon = new §_-g1m§(item.type,item.id);
         content.addChild(icon);
         caption = this.§_-o2D§(item);
         valueField = null;
         if(caption)
         {
            valueField = new §_-i5§(caption,0,0,§_-63D§);
            content.addChild(valueField);
         }
         layout = function():void
         {
            icon.scaleX = icon.scaleY = iconSize / Math.max(icon.width,icon.height);
            if(valueField)
            {
               valueField.x = (icon.width - valueField.width) * 0.5;
               valueField.y = icon.height;
            }
            §_-w2q§(content);
            content.x = (iconSize - content.width) * 0.5;
            content.y = (cardHeight - content.height) * 0.5;
         };
         if(this.§_-i2f§(item.type))
         {
            icon.addEventListener(Event.COMPLETE,function(param1:Event):void
            {
               layout();
            });
         }
         else
         {
            layout();
         }
         return cell;
      }
      
      private function §_-w2q§(param1:Sprite) : void
      {
         var _loc2_:Rectangle = param1.getBounds(param1);
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            param1.getChildAt(_loc3_).x = param1.getChildAt(_loc3_).x - _loc2_.x;
            param1.getChildAt(_loc3_).y = param1.getChildAt(_loc3_).y - _loc2_.y;
            _loc3_++;
         }
      }
      
      private function §_-i2f§(param1:int) : Boolean
      {
         return param1 == §_-A3y§.§_-33h§ || param1 == §_-A3y§.§_-o2t§;
      }
      
      private function §_-o2D§(param1:Object) : String
      {
         if(int(param1.count) <= 0)
         {
            return "";
         }
         switch(param1.type)
         {
            case §_-A3y§.§_-y2q§:
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-o2t§:
            case §_-A3y§.§_-33h§:
               return §_-B1d§.§_-wQ§(param1.count * 86400,true);
            default:
               return param1.count;
         }
      }
      
      private function §_-to§(param1:MouseEvent) : void
      {
         this.hide();
         Services.bank.buy(this.§_-J2a§);
      }
      
      private function §_-62z§(param1:Event = null) : void
      {
         if(!NuttyPassManager.§_-13X§(this.passType))
         {
            this.hide();
         }
      }
   }
}

