package §_-em§
{
   import §_-H7§.§_-z1v§;
   import §_-I10§.EventsManager;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-S9§;
   import §_-I10§.§_-a1D§;
   import §_-I1s§.§_-rt§;
   import §_-k1c§.§_-7O§;
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   
   public class §_-j1y§ extends §_-rt§
   {
      
      private static const §_-N5§:int = 320;
      
      private static const §_-N1§:int = 100;
      
      private static const §_-D2g§:int = 70;
      
      private static const §_-uN§:int = 7;
      
      private static const §_-H1y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,8280118,false,null,null,null,null,"center");
      
      private static const §_-o1N§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,15,7487780,true,null,null,null,null,"center");
      
      private var passType:int;
      
      private var §_-G2A§:int;
      
      public function §_-j1y§(param1:int)
      {
         this.passType = param1;
         this.§_-G2A§ = §_-a1D§.§_-w§(param1);
         var _loc2_:Array = §_-a1D§.§_-83R§(param1);
         super(§_-a1D§.§_-pp§(param1),gls("Ореховый Пропуск"),§_-a1D§.§_-hY§(param1),true,true,null,false,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
         this.init();
      }
      
      private function init() : void
      {
         var _loc7_:Sprite = null;
         var _loc1_:Object = NuttyPassManager.§_-UZ§(this.passType);
         var _loc2_:Sprite = new Sprite();
         if(Boolean(_loc1_.cosmetic) && _loc1_.cosmetic.length > 0)
         {
            _loc2_.addChild(this.§_-B2y§(_loc1_.cosmetic,§_-N1§,false));
            _loc7_ = this.§_-B2y§(_loc1_.items,§_-D2g§,true);
            _loc7_.y = §_-N1§ + 8;
            _loc2_.addChild(_loc7_);
         }
         else
         {
            _loc2_.addChild(this.§_-B2y§(_loc1_.items,§_-D2g§,true));
         }
         _loc2_.x = 5;
         _loc2_.y = -10;
         addChild(_loc2_);
         var _loc3_:int = this.width - this.§_-R1Y§ - this.§_-4n§;
         var _loc4_:§_-22V§ = new §_-22V§(gls("Получи пропуск сейчас, чтобы открыть больше наград за уровни!"),0,0,§_-H1y§,§_-N5§);
         _loc4_.x = (_loc3_ - _loc4_.width) * 0.5;
         _loc4_.y = _loc2_.y + _loc2_.height + 10;
         addChild(_loc4_);
         var _loc5_:String = §_-7O§.instance.getPriceString(§_-S9§.§_-b28§(this.§_-G2A§).price);
         var _loc6_:§_-j18§ = new §_-j18§(_loc5_);
         _loc6_.x = (_loc3_ - _loc6_.width) * 0.5;
         _loc6_.y = _loc4_.y + _loc4_.height + 10;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-k1o§);
         addChild(_loc6_);
         EventsManager.addEventListener(EventsManager.CHANGE,this.§_-A1b§);
         this.height = this.topOffset + this.§_-JZ§ + _loc6_.y + _loc6_.height + 15;
         this.§_-O2e§.x = _loc3_ - this.§_-O2e§.width;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         EventsManager.removeEventListener(EventsManager.CHANGE,this.§_-A1b§);
         super.hide(param1);
      }
      
      private function §_-B2y§(param1:Array, param2:int, param3:Boolean) : Sprite
      {
         var _loc9_:Object = null;
         var _loc10_:Sprite = null;
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(15524553);
         _loc4_.graphics.drawRoundRect(0,0,§_-N5§,param2,§_-uN§,§_-uN§);
         _loc4_.graphics.endFill();
         if(!param1 || param1.length == 0)
         {
            return _loc4_;
         }
         var _loc5_:int = param3 ? 30 : 60;
         var _loc6_:int = param3 ? 12 : 17;
         var _loc7_:int = _loc5_ * param1.length + _loc6_ * (param1.length - 1);
         var _loc8_:Number = (§_-N5§ - _loc7_) * 0.5;
         for each(_loc9_ in param1)
         {
            _loc10_ = this.§_-UY§(_loc9_,_loc5_,param2);
            _loc10_.x = _loc8_;
            _loc4_.addChild(_loc10_);
            _loc8_ += _loc5_ + _loc6_;
         }
         return _loc4_;
      }
      
      private function §_-UY§(param1:Object, param2:int, param3:int) : Sprite
      {
         var caption:String;
         var layout:Function;
         var content:Sprite = null;
         var icon:DisplayObject = null;
         var valueField:§_-22V§ = null;
         var item:Object = param1;
         var iconSize:int = param2;
         var cardHeight:int = param3;
         var cell:Sprite = new Sprite();
         content = new Sprite();
         cell.addChild(content);
         icon = new §_-z1v§(item.type,item.id);
         content.addChild(icon);
         caption = this.§_-l1C§(item);
         valueField = null;
         if(caption)
         {
            valueField = new §_-22V§(caption,0,0,§_-o1N§);
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
            §_-7n§(content);
            content.x = (iconSize - content.width) * 0.5;
            content.y = (cardHeight - content.height) * 0.5;
         };
         if(this.§_-o1f§(item.type))
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
      
      private function §_-7n§(param1:Sprite) : void
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
      
      private function §_-o1f§(param1:int) : Boolean
      {
         return param1 == §_-428§.§_-m2z§ || param1 == §_-428§.§_-N1P§;
      }
      
      private function §_-l1C§(param1:Object) : String
      {
         if(int(param1.count) <= 0)
         {
            return "";
         }
         switch(param1.type)
         {
            case §_-428§.§_-O2P§:
            case §_-428§.§_-dU§:
            case §_-428§.§_-N1P§:
            case §_-428§.§_-m2z§:
               return §_-ex§.§_-a1G§(param1.count * 86400,true);
            default:
               return param1.count;
         }
      }
      
      private function §_-k1o§(param1:MouseEvent) : void
      {
         this.hide();
         Services.bank.buy(this.§_-G2A§);
      }
      
      private function §_-A1b§(param1:Event = null) : void
      {
         if(!NuttyPassManager.§_-U28§(this.passType))
         {
            this.hide();
         }
      }
   }
}

