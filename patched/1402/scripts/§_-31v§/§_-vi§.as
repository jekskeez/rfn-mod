package §_-31v§
{
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-C2b§;
   import §_-u1R§.§_-g1m§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   
   public class §_-vi§ extends Sprite
   {
      
      private static const §_-92a§:int = 400;
      
      private static const §_-k2B§:int = 80;
      
      private static const §_-b2k§:int = 25;
      
      private static const §_-F1H§:int = 385;
      
      private static const §_-GI§:int = 70;
      
      private static const §_-01p§:int = 8;
      
      private static const §_-X1T§:Number = 7.5;
      
      private static const §_-6J§:Number = 12.5;
      
      private static const §_-lk§:int = 30;
      
      private static const §_-6T§:int = 12;
      
      private static const §_-FU§:Array = [new GlowFilter(16777215,1,4,4,2)];
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,7487780,true,null,null,null,null,"center");
      
      private static const §_-q1K§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,7487780,true);
      
      private static const §_-JR§:Array = [ImageIconEnergy,ImageIconMana,ImageIconExp,ImageIconCoins];
      
      private var passType:int;
      
      private var version:int;
      
      private var versions:Array;
      
      private var §_-Er§:int = 0;
      
      private var §_-m1P§:§_-K2G§;
      
      private var §_-Q1x§:Array = [];
      
      public function §_-vi§(param1:int, param2:int = 0, param3:Array = null)
      {
         super();
         this.passType = param1;
         this.version = param2;
         this.versions = param3;
         this.build();
      }
      
      private function build() : void
      {
         var _loc1_:Array = §_-C2b§.§_-Ly§(this.passType);
         var _loc2_:Object = _loc1_.length > 0 ? _loc1_[0] : null;
         var _loc3_:Number = 8;
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,§_-C2b§.§_-Sz§(this.passType),true,null,null,null,null,"center");
         var _loc5_:§_-i5§ = new §_-i5§(§_-C2b§.§_-S14§(this.passType),0,0,_loc4_,§_-92a§);
         _loc5_.filters = §_-FU§;
         _loc5_.y = _loc3_;
         addChild(_loc5_);
         _loc3_ += _loc5_.height + 12;
         var _loc6_:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6965033,true,null,null,null,null,"center");
         var _loc7_:§_-i5§ = new §_-i5§(gls(_loc2_.text_top),0,0,_loc6_,§_-92a§);
         _loc7_.multiline = true;
         _loc7_.wordWrap = true;
         _loc7_.y = _loc3_;
         addChild(_loc7_);
         _loc3_ += _loc7_.height + §_-b2k§;
         _loc3_ += this.§_-c1I§(_loc3_,_loc2_);
         var _loc8_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,10053171,false,true,null,null,null,"center");
         var _loc9_:§_-i5§ = new §_-i5§(gls(_loc2_.text_bottom),0,0,_loc8_,§_-92a§);
         _loc9_.multiline = true;
         _loc9_.wordWrap = true;
         _loc9_.y = _loc3_;
         addChild(_loc9_);
         _loc3_ += _loc9_.height + 15;
         this.§_-m1P§ = new §_-K2G§(gls(_loc2_.next_btn_text),150,18,this.onStart);
         this.§_-m1P§.x = (§_-92a§ - this.§_-m1P§.width) * 0.5;
         this.§_-m1P§.y = _loc3_ + 10;
         addChild(this.§_-m1P§);
         this.§_-Y2K§();
      }
      
      private function §_-c1I§(param1:int, param2:Object) : int
      {
         var _loc8_:Object = null;
         if(this.passType == §_-C2b§.§_-pP§ && Boolean(this.versions))
         {
            return this.§_-wL§(param1);
         }
         var _loc3_:Object = this.§_-u1S§(this.version);
         var _loc4_:Array = Boolean(param2) && param2.cards is Array ? param2.cards : null;
         var _loc5_:Array = this.§_-62f§();
         var _loc6_:Array = [{
            "title":this.§_-21M§(_loc4_,0,_loc5_[0]),
            "items":_loc3_.accessories
         },{
            "title":this.§_-21M§(_loc4_,1,_loc5_[1]),
            "items":_loc3_.costumes
         },{
            "title":this.§_-21M§(_loc4_,2,_loc5_[2]),
            "items":§_-A3y§.§_-be§(_loc3_.items)
         }];
         var _loc7_:int = 0;
         for each(_loc8_ in _loc6_)
         {
            if(!(!_loc8_.items || _loc8_.items.length == 0))
            {
               this.§_-126§(this.§_-az§(_loc8_.title,_loc8_.items),param1,_loc7_);
               _loc7_ += §_-GI§ + §_-01p§;
            }
         }
         if(_loc7_ > 0)
         {
            _loc7_ -= §_-01p§;
         }
         return _loc7_ + §_-b2k§;
      }
      
      private function §_-62f§() : Array
      {
         if(this.passType == §_-C2b§.§_-wY§)
         {
            return [gls("Получай аксессуары"),gls("Получай костюмы"),null];
         }
         return [gls("Получай уникальные аксессуары"),"Получай уникальные костюмы",null];
      }
      
      private function §_-126§(param1:Sprite, param2:int, param3:int) : void
      {
         param1.x = §_-6J§;
         param1.y = param2 + param3;
         addChild(param1);
      }
      
      private function §_-21M§(param1:Array, param2:int, param3:String) : String
      {
         var _loc4_:Object = null;
         if(Boolean(param1) && param2 < param1.length)
         {
            _loc4_ = param1[param2];
            if(_loc4_ != null && _loc4_ !== "")
            {
               return gls(_loc4_ is String ? String(_loc4_) : _loc4_.text);
            }
         }
         return param3 ? gls(param3) : null;
      }
      
      private function §_-u1S§(param1:int) : Object
      {
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:String = null;
         var _loc13_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Object = {};
         var _loc5_:Array = [];
         var _loc6_:Object = {};
         for each(_loc7_ in §_-C2b§.§_-k18§(param1))
         {
            if(_loc7_.reward_ids)
            {
               for each(_loc8_ in ["free_id","paid_id"])
               {
                  _loc9_ = int(_loc7_.reward_ids[_loc8_]);
                  if(_loc9_)
                  {
                     _loc10_ = §_-A3y§.§_-B3F§(_loc9_);
                     for each(_loc11_ in _loc10_ ? _loc10_.contentItems : null)
                     {
                        _loc12_ = _loc11_.type + "_" + _loc11_.id;
                        _loc13_ = {
                           "type":_loc11_.type,
                           "id":_loc11_.id,
                           "count":_loc11_.count
                        };
                        if(_loc11_.type == §_-A3y§.§_-33h§)
                        {
                           if(!(_loc12_ in _loc6_))
                           {
                              _loc6_[_loc12_] = true;
                              _loc2_.push(_loc13_);
                           }
                        }
                        else if(_loc11_.type == §_-A3y§.§_-o2t§ || _loc11_.type == §_-A3y§.§_-t1F§)
                        {
                           if(!(_loc12_ in _loc6_))
                           {
                              _loc6_[_loc12_] = true;
                              _loc3_.push(_loc13_);
                           }
                        }
                        else
                        {
                           if(!_loc4_[_loc12_])
                           {
                              _loc4_[_loc12_] = {
                                 "type":_loc11_.type,
                                 "id":_loc11_.id,
                                 "count":0
                              };
                              _loc5_.push(_loc4_[_loc12_]);
                           }
                           _loc4_[_loc12_].count += _loc11_.count;
                        }
                     }
                  }
               }
            }
         }
         return {
            "accessories":_loc2_,
            "costumes":_loc3_,
            "items":_loc5_
         };
      }
      
      private function §_-az§(param1:String, param2:Array) : Sprite
      {
         var rowY:int = 0;
         var rowH:int = 0;
         var row:Sprite = null;
         var field:§_-i5§ = null;
         var title:String = param1;
         var items:Array = param2;
         var card:Sprite = new Sprite();
         card.graphics.beginFill(15524553);
         card.graphics.drawRoundRect(0,0,§_-F1H§,§_-GI§,§_-X1T§,§_-X1T§);
         card.graphics.endFill();
         rowY = 0;
         rowH = §_-GI§;
         if(title)
         {
            field = new §_-i5§(title,0,0,§_-W2U§,§_-F1H§ - 20);
            field.x = (§_-F1H§ - field.width) * 0.5;
            field.y = 6;
            card.addChild(field);
            rowY = field.y + field.height + 4;
            rowH = §_-GI§ - rowY - 6;
         }
         if(!items || items.length == 0)
         {
            return card;
         }
         row = this.§_-v1p§(items,function():void
         {
            layoutRow(row,rowY,rowH);
         });
         this.layoutRow(row,rowY,rowH);
         card.addChild(row);
         return card;
      }
      
      private function layoutRow(param1:Sprite, param2:int, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Sprite = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:Rectangle = null;
         var _loc9_:§_-i5§ = null;
         var _loc4_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < param1.numChildren)
         {
            _loc6_ = param1.getChildAt(_loc5_) as Sprite;
            _loc7_ = _loc6_.getChildAt(0);
            _loc4_ = Math.max(_loc4_,_loc7_.getBounds(_loc6_).height);
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < param1.numChildren)
         {
            _loc6_ = param1.getChildAt(_loc5_) as Sprite;
            _loc7_ = _loc6_.getChildAt(0);
            _loc8_ = _loc7_.getBounds(_loc6_);
            _loc7_.x = (§_-lk§ - _loc8_.width) * 0.5 - _loc8_.x;
            _loc7_.y = (_loc4_ - _loc8_.height) * 0.5 - _loc8_.y;
            if(_loc6_.numChildren > 1)
            {
               _loc9_ = _loc6_.getChildAt(1) as §_-i5§;
               _loc8_ = _loc7_.getBounds(_loc6_);
               _loc9_.x = _loc8_.x + (_loc8_.width - _loc9_.width) * 0.5;
               _loc9_.y = _loc4_;
            }
            _loc5_++;
         }
         param1.x = (§_-F1H§ - param1.width) * 0.5;
         param1.y = param2 + (param3 - param1.height) * 0.5;
      }
      
      private function §_-v1p§(param1:Array, param2:Function) : Sprite
      {
         var item:Object = null;
         var cell:Sprite = null;
         var items:Array = param1;
         var onLayout:Function = param2;
         var row:Sprite = new Sprite();
         var pending:int = int(items.length);
         var xPos:Number = 0;
         for each(item in items)
         {
            cell = this.§_-2§(item,function():void
            {
               if(--pending <= 0 && onLayout != null)
               {
                  onLayout();
               }
            });
            cell.x = xPos;
            row.addChild(cell);
            xPos += §_-lk§ + §_-6T§;
         }
         return row;
      }
      
      private function §_-2§(param1:Object, param2:Function) : Sprite
      {
         var caption:String;
         var field:§_-i5§;
         var layout:Function;
         var cell:Sprite = null;
         var icon:DisplayObject = null;
         var item:Object = param1;
         var onLayout:Function = param2;
         cell = new Sprite();
         icon = new §_-g1m§(item.type,item.id);
         cell.addChild(icon);
         caption = this.§_-lU§(item);
         field = null;
         if(caption)
         {
            field = new §_-i5§(caption,0,0,§_-q1K§);
            cell.addChild(field);
         }
         layout = function():void
         {
            var _loc1_:Rectangle = icon.getBounds(cell);
            var _loc2_:Number = Math.max(_loc1_.width,_loc1_.height,1);
            icon.scaleX = icon.scaleY = §_-lk§ / _loc2_;
         };
         icon.addEventListener(Event.COMPLETE,function onLoaded(param1:Event):void
         {
            icon.removeEventListener(Event.COMPLETE,onLoaded);
            layout();
            if(onLayout != null)
            {
               onLayout();
            }
         });
         return cell;
      }
      
      private function §_-lU§(param1:Object) : String
      {
         if(param1.count <= 0)
         {
            return "";
         }
         switch(param1.type)
         {
            case §_-A3y§.§_-M1U§:
            case §_-A3y§.§_-l2X§:
            case §_-A3y§.§_-W27§:
            case §_-A3y§.§_-fz§:
            case §_-A3y§.§_-V2n§:
            case §_-A3y§.§_-QS§:
            case §_-A3y§.§_-j1G§:
               return String(param1.count);
            case §_-A3y§.§_-y2q§:
            case §_-A3y§.§_-o2t§:
            case §_-A3y§.§_-t1F§:
               return §_-B1d§.§_-wQ§(param1.count * 86400,true);
            default:
               return param1.count > 1 ? String(param1.count) : "";
         }
      }
      
      private function §_-wL§(param1:int) : int
      {
         var _loc6_:Sprite = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:int = Math.min(this.versions.length,4);
         var _loc3_:Number = 2 * §_-k2B§ + §_-b2k§;
         var _loc4_:Number = (§_-92a§ - _loc3_) * 0.5;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = this.§_-cR§(_loc5_,this.versions[_loc5_]);
            _loc7_ = Math.floor(_loc5_ / 2);
            _loc8_ = _loc5_ % 2;
            _loc6_.x = _loc4_ + _loc8_ * (§_-k2B§ + §_-b2k§);
            _loc6_.y = param1 + _loc7_ * (§_-k2B§ + §_-b2k§);
            addChild(_loc6_);
            _loc5_++;
         }
         return Math.ceil(_loc2_ / 2) * §_-k2B§ + 65;
      }
      
      private function §_-cR§(param1:int, param2:int) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.buttonMode = true;
         _loc3_.useHandCursor = true;
         var _loc4_:Shape = new Shape();
         this.§_-V1u§(_loc4_,false);
         _loc3_.addChild(_loc4_);
         this.§_-Q1x§.push({
            "bg":_loc4_,
            "version":param2
         });
         var _loc5_:Class = §_-JR§[param1] as Class;
         var _loc6_:DisplayObject = new _loc5_();
         var _loc7_:Number = Math.min(45 / _loc6_.width,45 / _loc6_.height);
         _loc6_.scaleX = _loc6_.scaleY = _loc7_;
         _loc6_.x = (§_-k2B§ - _loc6_.width) * 0.5;
         _loc6_.y = (§_-k2B§ - _loc6_.height) * 0.5;
         _loc3_.addChild(_loc6_);
         var _loc8_:§_-K2G§ = new §_-K2G§(gls("Выбрать"),§_-k2B§ - 3,14,null);
         _loc8_.x = (§_-k2B§ - _loc8_.width) * 0.5;
         _loc8_.y = §_-k2B§ - _loc8_.height * 0.5;
         _loc3_.addChild(_loc8_);
         _loc3_.name = String(param2);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-aA§);
         return _loc3_;
      }
      
      private function §_-V1u§(param1:Shape, param2:Boolean) : void
      {
         param1.graphics.clear();
         param1.graphics.beginFill(16777215);
         if(param2)
         {
            param1.graphics.lineStyle(3,§_-C2b§.§_-Sz§(this.passType));
         }
         else
         {
            param1.graphics.lineStyle(2,16049098);
         }
         param1.graphics.drawRoundRect(0,0,§_-k2B§,§_-k2B§,18,18);
         param1.graphics.endFill();
      }
      
      private function §_-v23§() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.§_-Q1x§)
         {
            this.§_-V1u§(_loc1_.bg,_loc1_.version == this.§_-Er§);
         }
      }
      
      private function §_-Y2K§() : void
      {
         if(this.passType == §_-C2b§.§_-pP§)
         {
            this.§_-m1P§.enabled = this.§_-Er§ > 0;
         }
      }
      
      private function onStart(param1:Event = null) : void
      {
         NuttyPassManager.§_-l1i§(this.passType == §_-C2b§.§_-pP§ ? this.§_-Er§ : this.version);
      }
      
      private function §_-aA§(param1:MouseEvent) : void
      {
         this.§_-Er§ = int(param1.currentTarget.name);
         this.§_-v23§();
         this.§_-Y2K§();
      }
   }
}

