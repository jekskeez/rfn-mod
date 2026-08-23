package §_-6f§
{
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-f4§;
   import §_-X1k§.§_-ku§;
   import §_-X1k§.§_-n1C§;
   import §_-i2r§.§_-e2O§;
   import §_-u1R§.§_-g1m§;
   import §_-u1R§.§_-u1F§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import sounds.§_-RH§;
   import utils.StringUtil;
   import utils.§_-B1d§;
   
   public class §_-y1G§ extends §_-e2O§
   {
      
      private static const §_-nF§:int = 15;
      
      private static const §_-y2k§:int = 10;
      
      private static const §_-X1J§:int = 270;
      
      private static const §_-92s§:int = 25;
      
      private static const §_-w28§:Array = [gls("Поздравляем!"),gls("Ты получил:"),gls("Оставайся с нами и получай больше бонусов!"),gls("Забрать")];
      
      private static const §_-W1M§:TextFormat = new TextFormat(§_-i5§.§_-c10§,18,7487780,true,null,null,null,null,"center");
      
      private static const §_-72m§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,7487780,true,null,null,null,null,"center");
      
      private static const §_-mx§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,8280118,false,null,null,null,null,"center");
      
      private var §_-73F§:§_-i5§ = null;
      
      private var §_-H2e§:§_-K2G§ = null;
      
      private var reward:Object = null;
      
      public function §_-y1G§(param1:Object)
      {
         super(param1.headerIcon || DialogPromoHeader,param1.caption || §_-w28§[0],param1.title || §_-w28§[1],true,true,null,true,param1.frame_filter,param1.backdrop_filter,param1.ribbon_filter,param1.background_filter);
         this.reward = param1;
         var _loc2_:Array = param1.contentItems || [];
         var _loc3_:Array = _loc2_.length == 1 ? this.§_-u23§(_loc2_[0],param1.single_background || DialogPromoView) : this.§_-fr§(_loc2_);
         var _loc4_:Sprite = _loc3_[0];
         _loc4_.x = 5;
         addChild(_loc4_);
         var _loc5_:int = this.width - this.§_-01q§ - this.§_-7N§;
         var _loc6_:int = int(_loc3_[1]);
         this.§_-73F§ = new §_-i5§(param1.description || §_-w28§[2],0,0,§_-mx§,§_-X1J§ + 50);
         this.§_-73F§.x = (_loc5_ - this.§_-73F§.width) * 0.5;
         this.§_-73F§.y = _loc4_.y + _loc6_ + 10;
         addChild(this.§_-73F§);
         this.§_-H2e§ = new §_-K2G§(param1.button || §_-w28§[3]);
         this.§_-H2e§.addEventListener(MouseEvent.CLICK,this.hide);
         this.§_-H2e§.x = (_loc5_ - this.§_-H2e§.width) * 0.5;
         this.§_-H2e§.y = this.§_-73F§.y + this.§_-73F§.height + 5;
         addChild(this.§_-H2e§);
         this.height = this.topOffset + this.§_-f2d§ + _loc6_ + this.§_-73F§.height + this.§_-H2e§.height + 30;
         this.§_-x2T§.x = _loc5_ - this.§_-x2T§.width;
         setChildIndex(_loc4_,getChildIndex(this.§_-n2m§) - 1);
         this.sound = §_-RH§.§_-T1§;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(Boolean(this.reward) && Boolean(this.reward.id))
         {
            §_-f4§.§_-6M§(this.reward.id);
         }
         super.hide(param1);
      }
      
      private function §_-fr§(param1:Array) : Array
      {
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:DisplayObject = null;
         var _loc13_:int = 0;
         var _loc14_:DisplayObject = null;
         var _loc2_:Sprite = new Sprite();
         if(!param1 || param1.length == 0)
         {
            return [_loc2_,_loc2_.height];
         }
         var _loc3_:Vector.<Sprite> = new Vector.<Sprite>(0);
         for each(_loc4_ in param1)
         {
            _loc3_.push(this.§_-f2T§(_loc4_.type,int(_loc4_.id) || 0,int(_loc4_.count) || 1));
         }
         _loc5_ = 0;
         _loc6_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc7_ = 0;
            _loc8_ = _loc5_;
            _loc9_ = 0;
            while(_loc8_ < _loc3_.length)
            {
               _loc12_ = _loc3_[_loc8_];
               _loc13_ = §_-nF§ + _loc12_.width;
               if(_loc7_ + _loc13_ > §_-X1J§)
               {
                  break;
               }
               _loc7_ += _loc13_;
               _loc9_ = Math.max(_loc9_,_loc12_.height);
               _loc8_++;
            }
            _loc10_ = int((§_-X1J§ - _loc7_) * 0.5) - 10;
            _loc11_ = _loc5_;
            while(_loc11_ < _loc8_)
            {
               _loc14_ = _loc3_[_loc11_];
               _loc14_.x = _loc10_;
               _loc14_.y = _loc6_;
               _loc10_ += _loc14_.width + §_-nF§;
               _loc2_.addChild(_loc14_);
               _loc11_++;
            }
            _loc6_ += Math.max(_loc9_,§_-92s§) + §_-y2k§;
            _loc5_ = _loc8_;
         }
         _loc2_.scaleX = _loc2_.scaleY = 1.35;
         return [_loc2_,_loc2_.height];
      }
      
      private function §_-f2T§(param1:int, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:§_-i5§ = new §_-i5§(this.§_-O1S§(param1,param3),0,0,§_-W1M§);
         _loc5_.y = (§_-92s§ - _loc5_.height - 6) * 0.5;
         _loc4_.addChild(_loc5_);
         var _loc6_:DisplayObject = new §_-g1m§(param1,param2);
         _loc6_.x = _loc5_.width + 2;
         _loc6_.y = (§_-92s§ - _loc6_.height) * 0.5;
         _loc6_.scaleX = _loc6_.scaleY = 0.72;
         _loc4_.addChild(_loc6_);
         return _loc4_;
      }
      
      private function §_-O1S§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
            case §_-A3y§.§_-l2X§:
            case §_-A3y§.§_-W27§:
            case §_-A3y§.§_-fz§:
            case §_-A3y§.§_-j1G§:
               return param2.toString();
            case §_-A3y§.§_-y2q§:
               return §_-B1d§.§_-wQ§(param2 * (24 * 60 * 60),true);
            case §_-A3y§.§_-o2t§:
            case §_-A3y§.§_-t1F§:
               return param2 > 0 ? §_-B1d§.§_-wQ§(param2 * (24 * 60 * 60),true) : "";
            case §_-A3y§.§_-736§:
            case §_-A3y§.§_-Z2h§:
            case §_-A3y§.§_-33h§:
         }
         return param2 > 1 ? param2.toString() : "";
      }
      
      private function §_-u23§(param1:Object, param2:Class) : Array
      {
         var _loc3_:Sprite = new Sprite();
         if(param2 is String)
         {
            param2 = getDefinitionByName(param2 as String) as Class;
         }
         var _loc4_:Sprite = new param2();
         _loc4_.x = _loc4_.width * 0.5 - this.§_-01q§;
         _loc4_.y = 50;
         _loc3_.addChild(_loc4_);
         var _loc5_:Sprite = this.§_-W2J§(param1.type,int(param1.id) || 0,int(param1.count) || 1);
         var _loc6_:Rectangle = _loc5_.getBounds(_loc5_);
         var _loc7_:Rectangle = _loc4_.getBounds(_loc4_);
         _loc5_.x = _loc7_.x + (_loc7_.width - _loc6_.width) * 0.5 - _loc6_.x;
         _loc5_.y = _loc7_.y + (_loc7_.height - _loc6_.height) * 0.5 - _loc6_.y + 15;
         _loc4_.addChild(_loc5_);
         return [_loc3_,_loc4_.y + _loc7_.y + _loc7_.height - 30];
      }
      
      private function §_-W2J§(param1:int, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:DisplayObject = new §_-u1F§(param1,param2);
         _loc4_.addChild(_loc5_);
         var _loc6_:§_-i5§ = new §_-i5§(this.§_-92n§(param1,param2,param3),0,0,§_-72m§);
         var _loc7_:Rectangle = _loc5_.getBounds(_loc5_);
         _loc6_.x = (param1 == §_-A3y§.§_-o2t§ ? -15 : 0) + (_loc7_.width - _loc6_.width) * 0.5;
         _loc6_.y = _loc7_.bottom + 5;
         _loc4_.addChild(_loc6_);
         return _loc4_;
      }
      
      private function §_-92n§(param1:int, param2:int, param3:int) : String
      {
         switch(param1)
         {
            case §_-A3y§.§_-M1U§:
               return param3 + " " + StringUtil.word("монет",param3);
            case §_-A3y§.§_-l2X§:
               return param3 + " " + StringUtil.word("орехов",param3);
            case §_-A3y§.§_-W27§:
               return param3 + " " + StringUtil.word("энергии",param3);
            case §_-A3y§.§_-fz§:
               return param3 + " " + StringUtil.word("маны",param3);
            case §_-A3y§.§_-y2q§:
               if(param2 in §_-ku§.DATA)
               {
                  return §_-ku§.DATA[param2]["name"] + gls(" на {0}",§_-B1d§.§_-wQ§(param3 * (24 * 60 * 60)));
               }
               return §_-B1d§.§_-wQ§(param3,true);
               break;
            case §_-A3y§.§_-Z2h§:
               return gls("{0} Случайных коллекций",param3);
            case §_-A3y§.§_-t1F§:
               return gls("Случайный костюм") + (param3 > 0 ? gls(" на {0}",§_-B1d§.§_-wQ§(param3 * (24 * 60 * 60))) : "");
            case §_-A3y§.§_-o2t§:
               return §_-P2x§.§_-01H§(param2) + (param3 > 0 ? gls(" на {0}",§_-B1d§.§_-wQ§(param3 * (24 * 60 * 60))) : "");
            case §_-A3y§.§_-33h§:
               return §_-P2x§.§_-d1E§(param2);
            case §_-A3y§.§_-736§:
               return §_-n1C§.§_-3f§(param2) + (param3 > 1 ? gls(" {0} шт.",param3) : "");
            case §_-A3y§.§_-j1G§:
               return param3 + " " + StringUtil.word("очко",param3);
            default:
               return param3 > 1 ? param3.toString() : "";
         }
      }
   }
}

