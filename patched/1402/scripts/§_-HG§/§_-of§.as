package §_-HG§
{
   import §_-5P§.§_-A1n§;
   import §_-5P§.§_-H2l§;
   import §_-5P§.§_-Z1f§;
   import §_-P2Y§.§_-hZ§;
   import §_-X1k§.§_-HZ§;
   import §_-X1k§.§_-u2n§;
   import §_-g2C§.§_-P1O§;
   import §_-j1y§.§_-13p§;
   import §_-j2E§.§_-A11§;
   import §_-o10§.§_-pl§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class §_-of§ extends §_-i1N§
   {
      
      private static const §_-913§:int = 0;
      
      private static const §_-y2O§:int = 1;
      
      private static const §_-N1X§:int = 2;
      
      public static const §_-3g§:int = 3;
      
      private static const §_-l2V§:Number = 43;
      
      private static const §_-Fz§:Number = 8;
      
      private static var _instance:§_-of§;
      
      private var background:Sprite = new Sprite();
      
      private var §_-U2j§:Sprite = new Sprite();
      
      private var button:§_-w2L§;
      
      private var §_-cv§:Object = null;
      
      private var §_-l27§:Boolean = false;
      
      private var §_-65§:Boolean = false;
      
      private var §_-5n§:Boolean;
      
      private var §_-N1T§:Boolean;
      
      private var §_-21U§:Boolean;
      
      public function §_-of§()
      {
         super();
         _instance = this;
         var _loc1_:FastBarBackground = new FastBarBackground();
         _loc1_.x = -55;
         _loc1_.y = -100;
         this.background.addChild(_loc1_);
         addChildAt(this.background,0);
         addChild(this.§_-U2j§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-22v§);
         this.§_-22v§();
      }
      
      public static function startDragging(param1:§_-w2L§, param2:Point) : void
      {
         _instance.startDragging(param1,param2);
      }
      
      public static function load() : void
      {
         _instance.load();
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-w2L§ = null;
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
            if(_loc2_ is §_-13p§)
            {
               (_loc2_ as §_-13p§).§_-J1y§();
            }
         }
      }
      
      override public function addButton(param1:§_-w2L§) : void
      {
         var _loc2_:String = this.buttons.length.toString();
         var _loc3_:int = int(§_-HZ§.skills.list[§_-Z1f§.§_-q1E§].mana_cost);
         param1.y = -this.buttons.length * §_-l2V§ - §_-Fz§ + (param1 is §_-P1O§ ? 2 : 0);
         if(param1 is §_-P1O§)
         {
            (param1 as §_-P1O§).§_-5n§ = this.§_-5n§;
         }
         if(param1 is §_-hZ§ && (param1 as §_-hZ§).perk == §_-A1n§)
         {
            param1.cost = this.§_-N1T§ ? 0 : _loc3_;
         }
         if(param1 is §_-hZ§ && (param1 as §_-hZ§).perk is §_-H2l§)
         {
            param1.cost = this.§_-21U§ ? 0 : _loc3_;
         }
         super.addButton(param1);
         this.§_-E1l§.x = -47;
         this.save(_loc2_,param1);
         §_-33H§();
         this.§_-02n§(param1);
      }
      
      public function §_-J1b§(param1:Boolean) : void
      {
         var _loc2_:§_-w2L§ = null;
         this.§_-5n§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-P1O§)
            {
               (_loc2_ as §_-P1O§).§_-5n§ = param1;
            }
         }
      }
      
      public function §_-bG§(param1:Boolean) : void
      {
         var _loc2_:§_-w2L§ = null;
         this.§_-N1T§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-hZ§)
            {
               if((_loc2_ as §_-hZ§).perk == §_-A1n§)
               {
                  _loc2_.cost = param1 ? 0 : _loc2_.§_-bD§;
               }
            }
         }
      }
      
      public function §_-61R§(param1:Boolean) : void
      {
         var _loc2_:§_-w2L§ = null;
         this.§_-21U§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-hZ§)
            {
               if((_loc2_ as §_-hZ§).perk is §_-H2l§)
               {
                  _loc2_.cost = param1 ? 0 : _loc2_.§_-bD§;
               }
            }
         }
      }
      
      public function startDragging(param1:§_-w2L§, param2:Point) : void
      {
         var _loc4_:int = 0;
         if(this.§_-E1l§.contains(param1))
         {
            this.§_-65§ = true;
         }
         else
         {
            if(this.buttons.length == §_-3g§)
            {
               return;
            }
            _loc4_ = 0;
            while(_loc4_ < this.buttons.length)
            {
               if(param1.id == this.buttons[_loc4_].id)
               {
                  return;
               }
               _loc4_++;
            }
         }
         this.button = param1;
         var _loc3_:DisplayObject = new this.button.iconClass();
         _loc3_.width = _loc3_.height = 36;
         _loc3_.x = this.button.iconOffset.x * _loc3_.scaleX;
         _loc3_.y = this.button.iconOffset.y * _loc3_.scaleY;
         this.§_-U2j§.addChild(_loc3_);
         this.§_-U2j§.x = this.globalToLocal(param2).x;
         this.§_-U2j§.y = this.globalToLocal(param2).y;
         this.§_-U2j§.visible = false;
         this.§_-U2j§.startDrag();
         this.§_-l27§ = this.visible;
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         Game.stage.addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
      }
      
      override protected function get hotKeys() : Array
      {
         return [Keyboard.R,Keyboard.F,Keyboard.G];
      }
      
      override protected function get needVisible() : Boolean
      {
         return false;
      }
      
      private function §_-CV§() : void
      {
         var _loc1_:int = this.buttons.indexOf(this.button);
         this.buttons.splice(_loc1_,1);
         this.§_-E1l§.removeChild(this.button);
         var _loc2_:int = Math.min(§_-3g§,this.buttons.length);
         this.§_-cv§ = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-cv§[_loc3_] = this.§_-Z1T§(this.buttons[_loc3_]);
            this.buttons[_loc3_].y = -_loc3_ * §_-l2V§ - §_-Fz§ + (this.buttons[_loc3_] is §_-P1O§ ? 2 : 0);
            _loc3_++;
         }
         this.save();
         §_-33H§();
      }
      
      private function save(param1:String = null, param2:§_-w2L§ = null) : void
      {
         if(!this.§_-cv§)
         {
            return;
         }
         if(param1 in this.§_-cv§)
         {
            return;
         }
         if(param2 != null)
         {
            this.§_-cv§[param1] = this.§_-Z1T§(param2);
         }
         §_-u2n§.save(§_-u2n§.§_-r2t§,this.§_-cv§);
      }
      
      private function load() : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-w2L§ = null;
         if(this.§_-cv§ != null)
         {
            return;
         }
         this.§_-cv§ = §_-u2n§.load(§_-u2n§.§_-r2t§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-3g§)
         {
            _loc2_ = _loc1_.toString();
            if(_loc2_ in this.§_-cv§)
            {
               _loc3_ = this.§_-328§(this.§_-cv§[_loc2_]);
               if(_loc3_ == null)
               {
                  delete this.§_-cv§[_loc2_];
                  §_-u2n§.save(§_-u2n§.§_-r2t§,this.§_-cv§);
               }
               else
               {
                  this.addButton(_loc3_);
               }
            }
            _loc1_++;
         }
      }
      
      private function §_-Cv§(param1:MouseEvent) : void
      {
         if(this.§_-U2j§.visible)
         {
            return;
         }
         this.visible = true;
         this.§_-U2j§.visible = true;
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
      }
      
      private function stopDragging(param1:MouseEvent) : void
      {
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
         if(this.§_-65§)
         {
            if(!this.§_-U2j§.hitTestObject(this.background))
            {
               this.§_-CV§();
            }
            this.§_-65§ = false;
         }
         else if(this.§_-U2j§.hitTestObject(this.background))
         {
            this.addButton(this.button.clone());
         }
         else
         {
            this.visible = this.§_-l27§;
         }
         this.§_-U2j§.stopDrag();
         while(this.§_-U2j§.numChildren > 0)
         {
            this.§_-U2j§.removeChildAt(0);
         }
      }
      
      private function §_-328§(param1:Object) : §_-w2L§
      {
         if(!("perk" in param1) || !("class" in param1))
         {
            return null;
         }
         var _loc2_:int = int(param1["perk"]);
         switch(param1["class"])
         {
            case §_-913§:
               if(_loc2_ >= §_-A11§.§_-x2G§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-P1O§(_loc2_);
               break;
            case §_-y2O§:
               if(_loc2_ >= §_-Z1f§.§_-x2G§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-hZ§(_loc2_);
               break;
            case §_-N1X§:
               if(_loc2_ >= §_-pl§.§_-x2G§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-13p§(_loc2_);
               break;
            default:
               return null;
         }
      }
      
      private function §_-Z1T§(param1:§_-w2L§) : Object
      {
         var _loc2_:Object = {};
         switch((param1 as Object).constructor as Class)
         {
            case §_-P1O§:
               _loc2_["class"] = §_-913§;
               _loc2_["perk"] = param1.id;
               break;
            case §_-hZ§:
               _loc2_["class"] = §_-y2O§;
               _loc2_["perk"] = param1.id;
               break;
            case §_-13p§:
               _loc2_["class"] = §_-N1X§;
               _loc2_["perk"] = param1.id;
         }
         return _loc2_;
      }
      
      private function §_-22v§(param1:Event = null) : void
      {
         var _loc2_:§_-w2L§ = null;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_.§_-R2x§() != null)
            {
               this.§_-02n§(_loc2_);
            }
         }
      }
      
      private function §_-02n§(param1:§_-w2L§) : void
      {
         var _loc2_:Point = param1.parent ? param1.parent.localToGlobal(new Point(param1.x,param1.y)) : new Point(0,0);
         param1.§_-R2x§().setPosition(_loc2_.x - param1.§_-R2x§().width - 10,_loc2_.y);
      }
   }
}

