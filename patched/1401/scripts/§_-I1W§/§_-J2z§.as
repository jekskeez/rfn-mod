package §_-I1W§
{
   import §_-H7§.§_-z1v§;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-a1D§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   
   public class §_-J2z§ extends Sprite
   {
      
      private static const §_-m29§:int = 400;
      
      private static const §_-F2L§:int = 80;
      
      private static const §_-b13§:int = 25;
      
      private static const §_-N5§:int = 385;
      
      private static const §_-57§:int = 70;
      
      private static const §_-53Y§:int = 8;
      
      private static const §_-uN§:Number = 7.5;
      
      private static const §_-3q§:Number = 12.5;
      
      private static const §_-Aq§:int = 30;
      
      private static const §_-R21§:int = 12;
      
      private static const §_-u18§:Array = [new GlowFilter(16777215,1,4,4,2)];
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,7487780,true,null,null,null,null,"center");
      
      private static const §_-lP§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,7487780,true);
      
      private static const §_-f1O§:Array = [ImageIconEnergy,ImageIconMana,ImageIconExp,ImageIconCoins];
      
      private var passType:int;
      
      private var version:int;
      
      private var versions:Array;
      
      private var §_-gn§:int = 0;
      
      private var §_-Vd§:§_-j18§;
      
      private var §_-Ew§:Array = [];
      
      public function §_-J2z§(param1:int, param2:int = 0, param3:Array = null)
      {
         super();
         this.passType = param1;
         this.version = param2;
         this.versions = param3;
         this.build();
      }
      
      private function build() : void
      {
         var _loc1_:Array = §_-a1D§.§_-1X§(this.passType);
         var _loc2_:Object = _loc1_.length > 0 ? _loc1_[0] : null;
         var _loc3_:Number = 8;
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,§_-a1D§.§_-DG§(this.passType),true,null,null,null,null,"center");
         var _loc5_:§_-22V§ = new §_-22V§(§_-a1D§.§_-hY§(this.passType),0,0,_loc4_,§_-m29§);
         _loc5_.filters = §_-u18§;
         _loc5_.y = _loc3_;
         addChild(_loc5_);
         _loc3_ += _loc5_.height + 12;
         var _loc6_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6965033,true,null,null,null,null,"center");
         var _loc7_:§_-22V§ = new §_-22V§(gls(_loc2_.text_top),0,0,_loc6_,§_-m29§);
         _loc7_.multiline = true;
         _loc7_.wordWrap = true;
         _loc7_.y = _loc3_;
         addChild(_loc7_);
         _loc3_ += _loc7_.height + §_-b13§;
         _loc3_ += this.§_-Y1p§(_loc3_,_loc2_);
         var _loc8_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,10053171,false,true,null,null,null,"center");
         var _loc9_:§_-22V§ = new §_-22V§(gls(_loc2_.text_bottom),0,0,_loc8_,§_-m29§);
         _loc9_.multiline = true;
         _loc9_.wordWrap = true;
         _loc9_.y = _loc3_;
         addChild(_loc9_);
         _loc3_ += _loc9_.height + 15;
         this.§_-Vd§ = new §_-j18§(gls(_loc2_.next_btn_text),150,18,this.onStart);
         this.§_-Vd§.x = (§_-m29§ - this.§_-Vd§.width) * 0.5;
         this.§_-Vd§.y = _loc3_ + 10;
         addChild(this.§_-Vd§);
         this.§_-X1l§();
      }
      
      private function §_-Y1p§(param1:int, param2:Object) : int
      {
         var _loc8_:Object = null;
         if(this.passType == §_-a1D§.§_-81j§ && Boolean(this.versions))
         {
            return this.§_-31D§(param1);
         }
         var _loc3_:Object = this.§_-Z4§(this.version);
         var _loc4_:Array = Boolean(param2) && param2.cards is Array ? param2.cards : null;
         var _loc5_:Array = this.§_-G25§();
         var _loc6_:Array = [{
            "title":this.§_-o1c§(_loc4_,0,_loc5_[0]),
            "items":_loc3_.accessories
         },{
            "title":this.§_-o1c§(_loc4_,1,_loc5_[1]),
            "items":_loc3_.costumes
         },{
            "title":this.§_-o1c§(_loc4_,2,_loc5_[2]),
            "items":§_-428§.§_-p1k§(_loc3_.items)
         }];
         var _loc7_:int = 0;
         for each(_loc8_ in _loc6_)
         {
            if(!(!_loc8_.items || _loc8_.items.length == 0))
            {
               this.§_-B23§(this.§_-423§(_loc8_.title,_loc8_.items),param1,_loc7_);
               _loc7_ += §_-57§ + §_-53Y§;
            }
         }
         if(_loc7_ > 0)
         {
            _loc7_ -= §_-53Y§;
         }
         return _loc7_ + §_-b13§;
      }
      
      private function §_-G25§() : Array
      {
         if(this.passType == §_-a1D§.§_-fs§)
         {
            return [gls("Получай аксессуары"),gls("Получай костюмы"),null];
         }
         return [gls("Получай уникальные аксессуары"),"Получай уникальные костюмы",null];
      }
      
      private function §_-B23§(param1:Sprite, param2:int, param3:int) : void
      {
         param1.x = §_-3q§;
         param1.y = param2 + param3;
         addChild(param1);
      }
      
      private function §_-o1c§(param1:Array, param2:int, param3:String) : String
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
      
      private function §_-Z4§(param1:int) : Object
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
         for each(_loc7_ in §_-a1D§.§_-h2J§(param1))
         {
            if(_loc7_.reward_ids)
            {
               for each(_loc8_ in ["free_id","paid_id"])
               {
                  _loc9_ = int(_loc7_.reward_ids[_loc8_]);
                  if(_loc9_)
                  {
                     _loc10_ = §_-428§.§_-d1u§(_loc9_);
                     for each(_loc11_ in _loc10_ ? _loc10_.contentItems : null)
                     {
                        _loc12_ = _loc11_.type + "_" + _loc11_.id;
                        _loc13_ = {
                           "type":_loc11_.type,
                           "id":_loc11_.id,
                           "count":_loc11_.count
                        };
                        if(_loc11_.type == §_-428§.§_-m2z§)
                        {
                           if(!(_loc12_ in _loc6_))
                           {
                              _loc6_[_loc12_] = true;
                              _loc2_.push(_loc13_);
                           }
                        }
                        else if(_loc11_.type == §_-428§.§_-N1P§ || _loc11_.type == §_-428§.§_-dU§)
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
      
      private function §_-423§(param1:String, param2:Array) : Sprite
      {
         var rowY:int = 0;
         var rowH:int = 0;
         var row:Sprite = null;
         var field:§_-22V§ = null;
         var title:String = param1;
         var items:Array = param2;
         var card:Sprite = new Sprite();
         card.graphics.beginFill(15524553);
         card.graphics.drawRoundRect(0,0,§_-N5§,§_-57§,§_-uN§,§_-uN§);
         card.graphics.endFill();
         rowY = 0;
         rowH = §_-57§;
         if(title)
         {
            field = new §_-22V§(title,0,0,§_-a1Y§,§_-N5§ - 20);
            field.x = (§_-N5§ - field.width) * 0.5;
            field.y = 6;
            card.addChild(field);
            rowY = field.y + field.height + 4;
            rowH = §_-57§ - rowY - 6;
         }
         if(!items || items.length == 0)
         {
            return card;
         }
         row = this.§_-53v§(items,function():void
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
         var _loc9_:§_-22V§ = null;
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
            _loc7_.x = (§_-Aq§ - _loc8_.width) * 0.5 - _loc8_.x;
            _loc7_.y = (_loc4_ - _loc8_.height) * 0.5 - _loc8_.y;
            if(_loc6_.numChildren > 1)
            {
               _loc9_ = _loc6_.getChildAt(1) as §_-22V§;
               _loc8_ = _loc7_.getBounds(_loc6_);
               _loc9_.x = _loc8_.x + (_loc8_.width - _loc9_.width) * 0.5;
               _loc9_.y = _loc4_;
            }
            _loc5_++;
         }
         param1.x = (§_-N5§ - param1.width) * 0.5;
         param1.y = param2 + (param3 - param1.height) * 0.5;
      }
      
      private function §_-53v§(param1:Array, param2:Function) : Sprite
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
            cell = this.§_-k1E§(item,function():void
            {
               if(--pending <= 0 && onLayout != null)
               {
                  onLayout();
               }
            });
            cell.x = xPos;
            row.addChild(cell);
            xPos += §_-Aq§ + §_-R21§;
         }
         return row;
      }
      
      private function §_-k1E§(param1:Object, param2:Function) : Sprite
      {
         var caption:String;
         var field:§_-22V§;
         var layout:Function;
         var cell:Sprite = null;
         var icon:DisplayObject = null;
         var item:Object = param1;
         var onLayout:Function = param2;
         cell = new Sprite();
         icon = new §_-z1v§(item.type,item.id);
         cell.addChild(icon);
         caption = this.§_-E1l§(item);
         field = null;
         if(caption)
         {
            field = new §_-22V§(caption,0,0,§_-lP§);
            cell.addChild(field);
         }
         layout = function():void
         {
            var _loc1_:Rectangle = icon.getBounds(cell);
            var _loc2_:Number = Math.max(_loc1_.width,_loc1_.height,1);
            icon.scaleX = icon.scaleY = §_-Aq§ / _loc2_;
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
      
      private function §_-E1l§(param1:Object) : String
      {
         if(param1.count <= 0)
         {
            return "";
         }
         switch(param1.type)
         {
            case §_-428§.§_-113§:
            case §_-428§.§_-wG§:
            case §_-428§.§_-61Q§:
            case §_-428§.§_-a1H§:
            case §_-428§.§_-P13§:
            case §_-428§.§_-cb§:
            case §_-428§.§_-8r§:
               return String(param1.count);
            case §_-428§.§_-O2P§:
            case §_-428§.§_-N1P§:
            case §_-428§.§_-dU§:
               return §_-ex§.§_-a1G§(param1.count * 86400,true);
            default:
               return param1.count > 1 ? String(param1.count) : "";
         }
      }
      
      private function §_-31D§(param1:int) : int
      {
         var _loc6_:Sprite = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:int = Math.min(this.versions.length,4);
         var _loc3_:Number = 2 * §_-F2L§ + §_-b13§;
         var _loc4_:Number = (§_-m29§ - _loc3_) * 0.5;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = this.§_-8x§(_loc5_,this.versions[_loc5_]);
            _loc7_ = Math.floor(_loc5_ / 2);
            _loc8_ = _loc5_ % 2;
            _loc6_.x = _loc4_ + _loc8_ * (§_-F2L§ + §_-b13§);
            _loc6_.y = param1 + _loc7_ * (§_-F2L§ + §_-b13§);
            addChild(_loc6_);
            _loc5_++;
         }
         return Math.ceil(_loc2_ / 2) * §_-F2L§ + 65;
      }
      
      private function §_-8x§(param1:int, param2:int) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.buttonMode = true;
         _loc3_.useHandCursor = true;
         var _loc4_:Shape = new Shape();
         this.§_-Q25§(_loc4_,false);
         _loc3_.addChild(_loc4_);
         this.§_-Ew§.push({
            "bg":_loc4_,
            "version":param2
         });
         var _loc5_:Class = §_-f1O§[param1] as Class;
         var _loc6_:DisplayObject = new _loc5_();
         var _loc7_:Number = Math.min(45 / _loc6_.width,45 / _loc6_.height);
         _loc6_.scaleX = _loc6_.scaleY = _loc7_;
         _loc6_.x = (§_-F2L§ - _loc6_.width) * 0.5;
         _loc6_.y = (§_-F2L§ - _loc6_.height) * 0.5;
         _loc3_.addChild(_loc6_);
         var _loc8_:§_-j18§ = new §_-j18§(gls("Выбрать"),§_-F2L§ - 3,14,null);
         _loc8_.x = (§_-F2L§ - _loc8_.width) * 0.5;
         _loc8_.y = §_-F2L§ - _loc8_.height * 0.5;
         _loc3_.addChild(_loc8_);
         _loc3_.name = String(param2);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-p26§);
         return _loc3_;
      }
      
      private function §_-Q25§(param1:Shape, param2:Boolean) : void
      {
         param1.graphics.clear();
         param1.graphics.beginFill(16777215);
         if(param2)
         {
            param1.graphics.lineStyle(3,§_-a1D§.§_-DG§(this.passType));
         }
         else
         {
            param1.graphics.lineStyle(2,16049098);
         }
         param1.graphics.drawRoundRect(0,0,§_-F2L§,§_-F2L§,18,18);
         param1.graphics.endFill();
      }
      
      private function §_-uv§() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.§_-Ew§)
         {
            this.§_-Q25§(_loc1_.bg,_loc1_.version == this.§_-gn§);
         }
      }
      
      private function §_-X1l§() : void
      {
         if(this.passType == §_-a1D§.§_-81j§)
         {
            this.§_-Vd§.enabled = this.§_-gn§ > 0;
         }
      }
      
      private function onStart(param1:Event = null) : void
      {
         NuttyPassManager.§_-12u§(this.passType == §_-a1D§.§_-81j§ ? this.§_-gn§ : this.version);
      }
      
      private function §_-p26§(param1:MouseEvent) : void
      {
         this.§_-gn§ = int(param1.currentTarget.name);
         this.§_-uv§();
         this.§_-X1l§();
      }
   }
}

