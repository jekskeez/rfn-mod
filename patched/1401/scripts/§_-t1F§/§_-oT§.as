package §_-t1F§
{
   import §_-H7§.§_-Zh§;
   import §_-H7§.§_-z1v§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-A29§;
   import §_-I10§.§_-X2T§;
   import §_-I10§.§_-e1z§;
   import §_-I10§.§_-g2W§;
   import §_-I1s§.§_-rt§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import sounds.§_-43Z§;
   import utils.StringUtil;
   import utils.§_-ex§;
   
   public class §_-oT§ extends §_-rt§
   {
      
      private static const §_-j2Q§:int = 15;
      
      private static const §_-Z1K§:int = 10;
      
      private static const §_-Mu§:int = 270;
      
      private static const §_-L1D§:int = 25;
      
      private static const §_-qm§:Array = [gls("Поздравляем!"),gls("Ты получил:"),gls("Оставайся с нами и получай больше бонусов!"),gls("Забрать")];
      
      private static const §_-91y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,18,7487780,true,null,null,null,null,"center");
      
      private static const §_-v20§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,7487780,true,null,null,null,null,"center");
      
      private static const §_-H1y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,8280118,false,null,null,null,null,"center");
      
      private var §_-P1z§:§_-22V§ = null;
      
      private var §_-92Q§:§_-j18§ = null;
      
      private var reward:Object = null;
      
      public function §_-oT§(param1:Object)
      {
         super(param1.headerIcon || DialogPromoHeader,param1.caption || §_-qm§[0],param1.title || §_-qm§[1],true,true,null,true,param1.frame_filter,param1.backdrop_filter,param1.ribbon_filter,param1.background_filter);
         this.reward = param1;
         var _loc2_:Array = param1.contentItems || [];
         var _loc3_:Array = _loc2_.length == 1 ? this.§_-a2U§(_loc2_[0],param1.single_background || DialogPromoView) : this.§_-cY§(_loc2_);
         var _loc4_:Sprite = _loc3_[0];
         _loc4_.x = 5;
         addChild(_loc4_);
         var _loc5_:int = this.width - this.§_-R1Y§ - this.§_-4n§;
         var _loc6_:int = int(_loc3_[1]);
         this.§_-P1z§ = new §_-22V§(param1.description || §_-qm§[2],0,0,§_-H1y§,§_-Mu§ + 50);
         this.§_-P1z§.x = (_loc5_ - this.§_-P1z§.width) * 0.5;
         this.§_-P1z§.y = _loc4_.y + _loc6_ + 10;
         addChild(this.§_-P1z§);
         this.§_-92Q§ = new §_-j18§(param1.button || §_-qm§[3]);
         this.§_-92Q§.addEventListener(MouseEvent.CLICK,this.hide);
         this.§_-92Q§.x = (_loc5_ - this.§_-92Q§.width) * 0.5;
         this.§_-92Q§.y = this.§_-P1z§.y + this.§_-P1z§.height + 5;
         addChild(this.§_-92Q§);
         this.height = this.topOffset + this.§_-JZ§ + _loc6_ + this.§_-P1z§.height + this.§_-92Q§.height + 30;
         this.§_-O2e§.x = _loc5_ - this.§_-O2e§.width;
         setChildIndex(_loc4_,getChildIndex(this.§_-hd§) - 1);
         this.sound = §_-43Z§.§_-23R§;
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(Boolean(this.reward) && Boolean(this.reward.id))
         {
            §_-A29§.§_-A3l§(this.reward.id);
         }
         super.hide(param1);
      }
      
      private function §_-cY§(param1:Array) : Array
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
            _loc3_.push(this.§_-Ad§(_loc4_.type,int(_loc4_.id) || 0,int(_loc4_.count) || 1));
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
               _loc13_ = §_-j2Q§ + _loc12_.width;
               if(_loc7_ + _loc13_ > §_-Mu§)
               {
                  break;
               }
               _loc7_ += _loc13_;
               _loc9_ = Math.max(_loc9_,_loc12_.height);
               _loc8_++;
            }
            _loc10_ = int((§_-Mu§ - _loc7_) * 0.5) - 10;
            _loc11_ = _loc5_;
            while(_loc11_ < _loc8_)
            {
               _loc14_ = _loc3_[_loc11_];
               _loc14_.x = _loc10_;
               _loc14_.y = _loc6_;
               _loc10_ += _loc14_.width + §_-j2Q§;
               _loc2_.addChild(_loc14_);
               _loc11_++;
            }
            _loc6_ += Math.max(_loc9_,§_-L1D§) + §_-Z1K§;
            _loc5_ = _loc8_;
         }
         _loc2_.scaleX = _loc2_.scaleY = 1.35;
         return [_loc2_,_loc2_.height];
      }
      
      private function §_-Ad§(param1:int, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:§_-22V§ = new §_-22V§(this.§_-B2V§(param1,param3),0,0,§_-91y§);
         _loc5_.y = (§_-L1D§ - _loc5_.height - 6) * 0.5;
         _loc4_.addChild(_loc5_);
         var _loc6_:DisplayObject = new §_-z1v§(param1,param2);
         _loc6_.x = _loc5_.width + 2;
         _loc6_.y = (§_-L1D§ - _loc6_.height) * 0.5;
         _loc6_.scaleX = _loc6_.scaleY = 0.72;
         _loc4_.addChild(_loc6_);
         return _loc4_;
      }
      
      private function §_-B2V§(param1:int, param2:int) : String
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
            case §_-428§.§_-wG§:
            case §_-428§.§_-61Q§:
            case §_-428§.§_-a1H§:
            case §_-428§.§_-8r§:
               return param2.toString();
            case §_-428§.§_-O2P§:
               return §_-ex§.§_-a1G§(param2 * (24 * 60 * 60),true);
            case §_-428§.§_-N1P§:
            case §_-428§.§_-dU§:
               return param2 > 0 ? §_-ex§.§_-a1G§(param2 * (24 * 60 * 60),true) : "";
            case §_-428§.§_-Q1C§:
            case §_-428§.§_-Z2n§:
            case §_-428§.§_-m2z§:
         }
         return param2 > 1 ? param2.toString() : "";
      }
      
      private function §_-a2U§(param1:Object, param2:Class) : Array
      {
         var _loc3_:Sprite = new Sprite();
         if(param2 is String)
         {
            param2 = getDefinitionByName(param2 as String) as Class;
         }
         var _loc4_:Sprite = new param2();
         _loc4_.x = _loc4_.width * 0.5 - this.§_-R1Y§;
         _loc4_.y = 50;
         _loc3_.addChild(_loc4_);
         var _loc5_:Sprite = this.§_-G2Z§(param1.type,int(param1.id) || 0,int(param1.count) || 1);
         var _loc6_:Rectangle = _loc5_.getBounds(_loc5_);
         var _loc7_:Rectangle = _loc4_.getBounds(_loc4_);
         _loc5_.x = _loc7_.x + (_loc7_.width - _loc6_.width) * 0.5 - _loc6_.x;
         _loc5_.y = _loc7_.y + (_loc7_.height - _loc6_.height) * 0.5 - _loc6_.y + 15;
         _loc4_.addChild(_loc5_);
         return [_loc3_,_loc4_.y + _loc7_.y + _loc7_.height - 30];
      }
      
      private function §_-G2Z§(param1:int, param2:int, param3:int) : Sprite
      {
         var _loc4_:Sprite = new Sprite();
         var _loc5_:DisplayObject = new §_-Zh§(param1,param2);
         _loc4_.addChild(_loc5_);
         var _loc6_:§_-22V§ = new §_-22V§(this.§_-Q2x§(param1,param2,param3),0,0,§_-v20§);
         var _loc7_:Rectangle = _loc5_.getBounds(_loc5_);
         _loc6_.x = (param1 == §_-428§.§_-N1P§ ? -15 : 0) + (_loc7_.width - _loc6_.width) * 0.5;
         _loc6_.y = _loc7_.bottom + 5;
         _loc4_.addChild(_loc6_);
         return _loc4_;
      }
      
      private function §_-Q2x§(param1:int, param2:int, param3:int) : String
      {
         switch(param1)
         {
            case §_-428§.§_-113§:
               return param3 + " " + StringUtil.word("монет",param3);
            case §_-428§.§_-wG§:
               return param3 + " " + StringUtil.word("орехов",param3);
            case §_-428§.§_-61Q§:
               return param3 + " " + StringUtil.word("энергии",param3);
            case §_-428§.§_-a1H§:
               return param3 + " " + StringUtil.word("маны",param3);
            case §_-428§.§_-O2P§:
               if(param2 in §_-e1z§.DATA)
               {
                  return §_-e1z§.DATA[param2]["name"] + gls(" на {0}",§_-ex§.§_-a1G§(param3 * (24 * 60 * 60)));
               }
               return §_-ex§.§_-a1G§(param3,true);
               break;
            case §_-428§.§_-Z2n§:
               return gls("{0} Случайных коллекций",param3);
            case §_-428§.§_-dU§:
               return gls("Случайный костюм") + (param3 > 0 ? gls(" на {0}",§_-ex§.§_-a1G§(param3 * (24 * 60 * 60))) : "");
            case §_-428§.§_-N1P§:
               return §_-g2W§.§_-G1Y§(param2) + (param3 > 0 ? gls(" на {0}",§_-ex§.§_-a1G§(param3 * (24 * 60 * 60))) : "");
            case §_-428§.§_-m2z§:
               return §_-g2W§.§_-224§(param2);
            case §_-428§.§_-Q1C§:
               return §_-X2T§.§_-bh§(param2) + (param3 > 1 ? gls(" {0} шт.",param3) : "");
            case §_-428§.§_-8r§:
               return param3 + " " + StringUtil.word("очко",param3);
            default:
               return param3 > 1 ? param3.toString() : "";
         }
      }
   }
}

