package §_-ZL§
{
   import §_-B1G§.§_-U1c§;
   import §_-bN§.Dialog;
   import §_-l2u§.§_-53A§;
   import events.§_-F2k§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-f1b§;
   import utils.§_-72U§;
   import utils.§_-v1P§;
   
   public class §_-Ro§ extends Dialog
   {
      
      private static const §_-A3C§:int = 10;
      
      private static const §_-S9§:int = 250;
      
      private static const §_-e2q§:int = 290;
      
      private static const §_-03f§:String = gls("Поиск по имени");
      
      private static const §_-E2D§:Array = ["alpha","label"];
      
      private static const §_-pC§:Array = [Array.NUMERIC,0];
      
      private var §_-J1Y§:Array = [];
      
      private var list:§_-U1c§;
      
      private var map:§_-53A§;
      
      private var §_-s§:§_-72U§ = null;
      
      public function §_-Ro§(param1:§_-53A§)
      {
         super(gls("Инспектор объектов"));
         this.map = param1;
         this.init();
      }
      
      public function removeAll() : void
      {
         this.list.removeAll();
         this.§_-J1Y§ = [];
      }
      
      public function §_-a1r§(param1:§_-53A§) : void
      {
         this.§_-zs§();
         this.map = param1;
         if(!this.map)
         {
            return;
         }
         this.§_-5F§();
         this.removeAll();
      }
      
      private function §_-zs§() : void
      {
         if(!this.map)
         {
            return;
         }
         this.map.removeEventListener(§_-F2k§.ADD,this.§_-B3V§);
         this.map.removeEventListener(§_-F2k§.REMOVE,this.§_-41f§);
         if(this.map.§_-B3S§)
         {
            this.map.§_-B3S§.removeEventListener(§_-F2k§.SELECT,this.§_-s2X§);
         }
      }
      
      private function §_-5F§() : void
      {
         this.map.addEventListener(§_-F2k§.ADD,this.§_-B3V§);
         this.map.addEventListener(§_-F2k§.REMOVE,this.§_-41f§);
         if(this.map.§_-B3S§)
         {
            this.map.§_-B3S§.addEventListener(§_-F2k§.SELECT,this.§_-s2X§);
         }
      }
      
      private function init() : void
      {
         this.list = new §_-U1c§(§_-S9§,§_-e2q§,true);
         this.list.x = §_-A3C§;
         this.list.y = 10;
         this.list.§_-y1N§ = "iconSource";
         this.list.doubleClickEnabled = true;
         addChild(this.list);
         this.§_-s§ = new §_-72U§(§_-03f§,§_-A3C§,this.list.y + §_-e2q§ + 8,§_-S9§,18,new TextFormat(§_-i5§.§_-c10§,11,3810566));
         this.§_-s§.restrict = "а-яё А-ЯЁa-zA-Z";
         this.§_-s§.addEventListener(Event.CHANGE,this.§_-Q1e§);
         addChild(this.§_-s§);
         place();
         this.width += 15;
         this.height += 50;
         this.list.addEventListener(MouseEvent.CLICK,this.§_-23k§);
         this.list.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-xd§);
         this.list.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-A3L§);
         this.§_-5F§();
         §_-s2j§.§_-c1L§(this.§_-3d§);
      }
      
      private function §_-3d§(param1:*) : void
      {
         var _loc2_:Object = this.§_-U1L§(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_["iconSource"] = "fixed" in param1 && param1["fixed"] == true || !("fixed" in param1) ? StaticIcon : DynamicIcon;
         _loc2_["marked"] = §_-v1P§.§_-S1B§(param1["alpha"]);
         _loc2_["alpha"] = _loc2_["marked"] ? 0 : 1;
         this.§_-I13§(_loc2_);
      }
      
      private function §_-U1L§(param1:*) : Object
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-J1Y§)
         {
            if(_loc2_["value"]["name"] == param1["name"])
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function §_-xd§(param1:MouseEvent) : void
      {
         var _loc2_:String = this.list.§_-E2v§["value"]["name"];
         var _loc3_:DisplayObject = this.map.§_-br§(_loc2_) as DisplayObject;
         var _loc4_:Point = new Point(-1,-1);
         _loc4_.x *= _loc3_.x - this.stage.stageWidth + (this.stage.stageWidth >> 1);
         _loc4_.y *= _loc3_.y - this.stage.stageHeight + (this.stage.stageHeight >> 1);
         this.map.game.shift = _loc4_;
         Game.stage.focus = this.map;
      }
      
      private function §_-s2X§(param1:§_-F2k§) : void
      {
         if(param1.className == null)
         {
            this.list.§_-JZ§ = -1;
            return;
         }
         var _loc2_:Object = this.§_-U1L§(param1.className);
         if(!_loc2_)
         {
            return;
         }
         if(!this.§_-XC§(_loc2_))
         {
            this.list.§_-JZ§ = -1;
            return;
         }
         this.list.§_-E2v§ = _loc2_;
      }
      
      private function §_-A3L§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.DELETE)
         {
            return;
         }
         this.list.§_-JZ§ = -1;
         this.map.§_-B3S§.§_-xu§();
         this.map.§_-o1j§(null);
      }
      
      private function §_-23k§(param1:MouseEvent) : void
      {
         if(this.list.§_-E2v§ == null)
         {
            return;
         }
         var _loc2_:String = this.list.§_-E2v§["value"]["name"];
         this.map.§_-B3S§.clear();
         this.map.§_-B3S§.add(this.map.§_-br§(_loc2_));
      }
      
      private function §_-41f§(param1:§_-F2k§) : void
      {
         var _loc2_:Object = param1.className as Object;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-J1Y§.length)
         {
            if(this.§_-J1Y§[_loc3_]["value"]["name"] == _loc2_["name"])
            {
               if(this.§_-XC§(this.§_-J1Y§[_loc3_]))
               {
                  this.list.removeItem(this.§_-J1Y§[_loc3_]);
                  this.list.§_-JZ§ = -1;
               }
               this.§_-J1Y§.splice(_loc3_,1);
            }
            _loc3_++;
         }
      }
      
      private function §_-B3V§(param1:§_-F2k§) : void
      {
         var _loc2_:DisplayObject = param1.className as DisplayObject;
         if(_loc2_ == null || §_-f1b§.getName(_loc2_) == "")
         {
            return;
         }
         var _loc3_:Object = this.§_-Lq§(_loc2_);
         this.§_-J1Y§.push(_loc3_);
         if(!this.§_-XC§(_loc3_))
         {
            return;
         }
         this.list.addItem(_loc3_);
         this.§_-C2B§();
      }
      
      private function §_-Lq§(param1:Object) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:String = §_-f1b§.getName(param1);
         _loc2_["value"] = param1;
         _loc2_["label"] = _loc3_;
         _loc2_["alpha"] = §_-v1P§.§_-S1B§(param1["alpha"]) ? 0 : 1;
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
      
      private function §_-Q1e§(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-J1Y§)
         {
            if(this.§_-XC§(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
         }
         this.list.§_-533§(_loc2_,-1);
         this.§_-C2B§();
      }
      
      private function §_-I13§(param1:Object) : void
      {
         if(!this.§_-XC§(param1))
         {
            return;
         }
         this.list.removeItem(param1);
         this.list.addItem(param1);
         this.§_-C2B§();
      }
      
      private function §_-XC§(param1:Object) : Boolean
      {
         var _loc2_:String = this.§_-s§.text;
         return (param1["label"] as String).toLowerCase().substring(0,_loc2_.length) == _loc2_.toLowerCase() || _loc2_ == "" || _loc2_ == §_-03f§;
      }
      
      private function §_-C2B§() : void
      {
         this.list.§_-r2Z§(§_-E2D§,§_-pC§);
      }
   }
}

