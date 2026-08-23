package §_-Q1P§
{
   import §_-Kr§.§_-12w§;
   import §_-Rj§.§_-K15§;
   import §_-k1c§.Dialog;
   import events.§_-63A§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-03s§;
   import utils.§_-qd§;
   import utils.§_-w2j§;
   
   public class §_-51h§ extends Dialog
   {
      
      private static const §_-V0§:int = 10;
      
      private static const §_-y1X§:int = 250;
      
      private static const §_-92X§:int = 290;
      
      private static const §_-F2c§:String = gls("Поиск по имени");
      
      private static const §_-V4§:Array = ["alpha","label"];
      
      private static const §_-qj§:Array = [Array.NUMERIC,0];
      
      private var §_-ou§:Array = [];
      
      private var list:§_-12w§;
      
      private var map:§_-K15§;
      
      private var §_-J1y§:§_-w2j§ = null;
      
      public function §_-51h§(param1:§_-K15§)
      {
         super(gls("Инспектор объектов"));
         this.map = param1;
         this.init();
      }
      
      public function removeAll() : void
      {
         this.list.removeAll();
         this.§_-ou§ = [];
      }
      
      public function §_-t9§(param1:§_-K15§) : void
      {
         this.§_-X1§();
         this.map = param1;
         if(!this.map)
         {
            return;
         }
         this.§_-J1B§();
         this.removeAll();
      }
      
      private function §_-X1§() : void
      {
         if(!this.map)
         {
            return;
         }
         this.map.removeEventListener(§_-63A§.ADD,this.§_-8v§);
         this.map.removeEventListener(§_-63A§.REMOVE,this.§_-J§);
         if(this.map.§_-K1n§)
         {
            this.map.§_-K1n§.removeEventListener(§_-63A§.SELECT,this.§_-S1i§);
         }
      }
      
      private function §_-J1B§() : void
      {
         this.map.addEventListener(§_-63A§.ADD,this.§_-8v§);
         this.map.addEventListener(§_-63A§.REMOVE,this.§_-J§);
         if(this.map.§_-K1n§)
         {
            this.map.§_-K1n§.addEventListener(§_-63A§.SELECT,this.§_-S1i§);
         }
      }
      
      private function init() : void
      {
         this.list = new §_-12w§(§_-y1X§,§_-92X§,true);
         this.list.x = §_-V0§;
         this.list.y = 10;
         this.list.§_-73w§ = "iconSource";
         this.list.doubleClickEnabled = true;
         addChild(this.list);
         this.§_-J1y§ = new §_-w2j§(§_-F2c§,§_-V0§,this.list.y + §_-92X§ + 8,§_-y1X§,18,new TextFormat(§_-22V§.§_-F2z§,11,3810566));
         this.§_-J1y§.restrict = "а-яё А-ЯЁa-zA-Z";
         this.§_-J1y§.addEventListener(Event.CHANGE,this.§_-m1V§);
         addChild(this.§_-J1y§);
         place();
         this.width += 15;
         this.height += 50;
         this.list.addEventListener(MouseEvent.CLICK,this.§_-f2C§);
         this.list.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-l28§);
         this.list.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-V22§);
         this.§_-J1B§();
         §_-h3§.§_-T1C§(this.§_-r1f§);
      }
      
      private function §_-r1f§(param1:*) : void
      {
         var _loc2_:Object = this.§_-x2U§(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_["iconSource"] = "fixed" in param1 && param1["fixed"] == true || !("fixed" in param1) ? StaticIcon : DynamicIcon;
         _loc2_["marked"] = §_-qd§.§_-Y2q§(param1["alpha"]);
         _loc2_["alpha"] = _loc2_["marked"] ? 0 : 1;
         this.§_-a13§(_loc2_);
      }
      
      private function §_-x2U§(param1:*) : Object
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-ou§)
         {
            if(_loc2_["value"]["name"] == param1["name"])
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function §_-l28§(param1:MouseEvent) : void
      {
         var _loc2_:String = this.list.§_-l1§["value"]["name"];
         var _loc3_:DisplayObject = this.map.§_-xL§(_loc2_) as DisplayObject;
         var _loc4_:Point = new Point(-1,-1);
         _loc4_.x *= _loc3_.x - this.stage.stageWidth + (this.stage.stageWidth >> 1);
         _loc4_.y *= _loc3_.y - this.stage.stageHeight + (this.stage.stageHeight >> 1);
         this.map.game.shift = _loc4_;
         Game.stage.focus = this.map;
      }
      
      private function §_-S1i§(param1:§_-63A§) : void
      {
         if(param1.className == null)
         {
            this.list.§_-Uf§ = -1;
            return;
         }
         var _loc2_:Object = this.§_-x2U§(param1.className);
         if(!_loc2_)
         {
            return;
         }
         if(!this.§_-F2P§(_loc2_))
         {
            this.list.§_-Uf§ = -1;
            return;
         }
         this.list.§_-l1§ = _loc2_;
      }
      
      private function §_-V22§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.DELETE)
         {
            return;
         }
         this.list.§_-Uf§ = -1;
         this.map.§_-K1n§.§_-y2C§();
         this.map.§_-x25§(null);
      }
      
      private function §_-f2C§(param1:MouseEvent) : void
      {
         if(this.list.§_-l1§ == null)
         {
            return;
         }
         var _loc2_:String = this.list.§_-l1§["value"]["name"];
         this.map.§_-K1n§.clear();
         this.map.§_-K1n§.add(this.map.§_-xL§(_loc2_));
      }
      
      private function §_-J§(param1:§_-63A§) : void
      {
         var _loc2_:Object = param1.className as Object;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-ou§.length)
         {
            if(this.§_-ou§[_loc3_]["value"]["name"] == _loc2_["name"])
            {
               if(this.§_-F2P§(this.§_-ou§[_loc3_]))
               {
                  this.list.removeItem(this.§_-ou§[_loc3_]);
                  this.list.§_-Uf§ = -1;
               }
               this.§_-ou§.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      private function §_-8v§(param1:§_-63A§) : void
      {
         var _loc2_:DisplayObject = param1.className as DisplayObject;
         if(_loc2_ == null || §_-03s§.getName(_loc2_) == "")
         {
            return;
         }
         var _loc3_:Object = this.§_-OH§(_loc2_);
         this.§_-ou§.push(_loc3_);
         if(!this.§_-F2P§(_loc3_))
         {
            return;
         }
         this.list.addItem(_loc3_);
         this.§_-Kz§();
      }
      
      private function §_-OH§(param1:Object) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:String = §_-03s§.getName(param1);
         _loc2_["value"] = param1;
         _loc2_["label"] = _loc3_;
         _loc2_["alpha"] = §_-qd§.§_-Y2q§(param1["alpha"]) ? 0 : 1;
         _loc2_["marked"] = !Boolean(_loc2_["alpha"]);
         if("fixed" in param1)
         {
            _loc2_["iconSource"] = param1["fixed"] == true ? StaticIcon : DynamicIcon;
         }
         else
         {
            _loc2_["iconSource"] = StaticIcon;
         }
         return _loc2_;
      }
      
      private function §_-m1V§(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-ou§)
         {
            if(this.§_-F2P§(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         this.list.§_-K26§(_loc2_,-1);
         this.§_-Kz§();
      }
      
      private function §_-a13§(param1:Object) : void
      {
         if(!this.§_-F2P§(param1))
         {
            return;
         }
         this.list.removeItem(param1);
         this.list.addItem(param1);
         this.§_-Kz§();
      }
      
      private function §_-F2P§(param1:Object) : Boolean
      {
         var _loc2_:String = this.§_-J1y§.text;
         return (param1["label"] as String).toLowerCase().substring(0,_loc2_.length) == _loc2_.toLowerCase() || _loc2_ == "" || _loc2_ == §_-F2c§;
      }
      
      private function §_-Kz§() : void
      {
         this.list.§_-yy§(§_-V4§,§_-qj§);
      }
   }
}

