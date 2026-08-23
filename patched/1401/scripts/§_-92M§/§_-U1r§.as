package §_-92M§
{
   import §_-1§.§_-K19§;
   import §_-1§.§_-tY§;
   import §_-1§.§_-vk§;
   import §_-EH§.§_-M2t§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-t2V§;
   import §_-P2b§.§_-6L§;
   import §_-X1Q§.§_-zr§;
   import §_-jC§.§_-a11§;
   import §_-vK§.§_-QC§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class §_-U1r§ extends §_-Qm§
   {
      
      private static const §_-O2x§:int = 0;
      
      private static const §_-V2R§:int = 1;
      
      private static const §_-ay§:int = 2;
      
      public static const §_-N1p§:int = 3;
      
      private static const §_-A2s§:Number = 43;
      
      private static const §_-A1m§:Number = 8;
      
      private static var _instance:§_-U1r§;
      
      private var background:Sprite = new Sprite();
      
      private var §_-V2m§:Sprite = new Sprite();
      
      private var button:§_-X2z§;
      
      private var §_-b4§:Object = null;
      
      private var §_-uQ§:Boolean = false;
      
      private var §_-J1G§:Boolean = false;
      
      private var §_-IR§:Boolean;
      
      private var §_-C3C§:Boolean;
      
      private var §_-U1p§:Boolean;
      
      public function §_-U1r§()
      {
         super();
         _instance = this;
         var _loc1_:FastBarBackground = new FastBarBackground();
         _loc1_.x = -55;
         _loc1_.y = -100;
         this.background.addChild(_loc1_);
         addChildAt(this.background,0);
         addChild(this.§_-V2m§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-V1Q§);
         this.§_-V1Q§();
      }
      
      public static function startDragging(param1:§_-X2z§, param2:Point) : void
      {
         _instance.startDragging(param1,param2);
      }
      
      public static function load() : void
      {
         _instance.load();
      }
      
      public static function set hero(param1:Hero) : void
      {
         var _loc2_:§_-X2z§ = null;
         for each(_loc2_ in _instance.buttons)
         {
            _loc2_.hero = param1;
            if(_loc2_ is §_-M2t§)
            {
               (_loc2_ as §_-M2t§).§_-011§();
            }
         }
      }
      
      override public function addButton(param1:§_-X2z§) : void
      {
         var _loc2_:String = this.buttons.length.toString();
         var _loc3_:int = int(§_-t2V§.skills.list[§_-tY§.§_-Yi§].mana_cost);
         param1.y = -this.buttons.length * §_-A2s§ - §_-A1m§ + (param1 is §_-a11§ ? 2 : 0);
         if(param1 is §_-a11§)
         {
            (param1 as §_-a11§).§_-IR§ = this.§_-IR§;
         }
         if(param1 is §_-zr§ && (param1 as §_-zr§).perk == §_-vk§)
         {
            param1.cost = this.§_-C3C§ ? 0 : _loc3_;
         }
         if(param1 is §_-zr§ && (param1 as §_-zr§).perk is §_-K19§)
         {
            param1.cost = this.§_-U1p§ ? 0 : _loc3_;
         }
         super.addButton(param1);
         this.§_-kH§.x = -47;
         this.save(_loc2_,param1);
         §_-q2S§();
         this.§_-E2T§(param1);
      }
      
      public function §_-m20§(param1:Boolean) : void
      {
         var _loc2_:§_-X2z§ = null;
         this.§_-IR§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-a11§)
            {
               (_loc2_ as §_-a11§).§_-IR§ = param1;
            }
         }
      }
      
      public function §_-W2q§(param1:Boolean) : void
      {
         var _loc2_:§_-X2z§ = null;
         this.§_-C3C§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-zr§)
            {
               if((_loc2_ as §_-zr§).perk == §_-vk§)
               {
                  _loc2_.cost = param1 ? 0 : _loc2_.§_-Ll§;
               }
            }
         }
      }
      
      public function §_-f2q§(param1:Boolean) : void
      {
         var _loc2_:§_-X2z§ = null;
         this.§_-U1p§ = param1;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_ is §_-zr§)
            {
               if((_loc2_ as §_-zr§).perk is §_-K19§)
               {
                  _loc2_.cost = param1 ? 0 : _loc2_.§_-Ll§;
               }
            }
         }
      }
      
      public function startDragging(param1:§_-X2z§, param2:Point) : void
      {
         var _loc4_:int = 0;
         if(this.§_-kH§.contains(param1))
         {
            this.§_-J1G§ = true;
         }
         else
         {
            if(this.buttons.length == §_-N1p§)
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
         this.§_-V2m§.addChild(_loc3_);
         this.§_-V2m§.x = this.globalToLocal(param2).x;
         this.§_-V2m§.y = this.globalToLocal(param2).y;
         this.§_-V2m§.visible = false;
         this.§_-V2m§.startDrag();
         this.§_-uQ§ = this.visible;
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
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
      
      private function §_-vJ§() : void
      {
         var _loc1_:int = this.buttons.indexOf(this.button);
         this.buttons.splice(_loc1_,1);
         this.§_-kH§.removeChild(this.button);
         var _loc2_:int = Math.min(§_-N1p§,this.buttons.length);
         this.§_-b4§ = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-b4§[_loc3_] = this.§_-JT§(this.buttons[_loc3_]);
            this.buttons[_loc3_].y = -_loc3_ * §_-A2s§ - §_-A1m§ + (this.buttons[_loc3_] is §_-a11§ ? 2 : 0);
            _loc3_++;
         }
         this.save();
         §_-q2S§();
      }
      
      private function save(param1:String = null, param2:§_-X2z§ = null) : void
      {
         if(!this.§_-b4§)
         {
            return;
         }
         if(param1 in this.§_-b4§)
         {
            return;
         }
         if(param2 != null)
         {
            this.§_-b4§[param1] = this.§_-JT§(param2);
         }
         §_-82N§.save(§_-82N§.§_-NF§,this.§_-b4§);
      }
      
      private function load() : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-X2z§ = null;
         if(this.§_-b4§ != null)
         {
            return;
         }
         this.§_-b4§ = §_-82N§.load(§_-82N§.§_-NF§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-N1p§)
         {
            _loc2_ = _loc1_.toString();
            if(_loc2_ in this.§_-b4§)
            {
               _loc3_ = this.§_-26§(this.§_-b4§[_loc2_]);
               if(_loc3_ == null)
               {
                  delete this.§_-b4§[_loc2_];
                  §_-82N§.save(§_-82N§.§_-NF§,this.§_-b4§);
               }
               else
               {
                  this.addButton(_loc3_);
               }
            }
            _loc1_++;
         }
      }
      
      private function §_-D23§(param1:MouseEvent) : void
      {
         if(this.§_-V2m§.visible)
         {
            return;
         }
         this.visible = true;
         this.§_-V2m§.visible = true;
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
      }
      
      private function stopDragging(param1:MouseEvent) : void
      {
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
         if(this.§_-J1G§)
         {
            if(!this.§_-V2m§.hitTestObject(this.background))
            {
               this.§_-vJ§();
            }
            this.§_-J1G§ = false;
         }
         else if(this.§_-V2m§.hitTestObject(this.background))
         {
            this.addButton(this.button.clone());
         }
         else
         {
            this.visible = this.§_-uQ§;
         }
         this.§_-V2m§.stopDrag();
         while(this.§_-V2m§.numChildren > 0)
         {
            this.§_-V2m§.removeChildAt(0);
         }
      }
      
      private function §_-26§(param1:Object) : §_-X2z§
      {
         if(!("perk" in param1) || !("class" in param1))
         {
            return null;
         }
         var _loc2_:int = int(param1["perk"]);
         switch(param1["class"])
         {
            case §_-O2x§:
               if(_loc2_ >= §_-6L§.§_-6n§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-a11§(_loc2_);
               break;
            case §_-V2R§:
               if(_loc2_ >= §_-tY§.§_-6n§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-zr§(_loc2_);
               break;
            case §_-ay§:
               if(_loc2_ >= §_-QC§.§_-6n§ || _loc2_ <= 0)
               {
                  return null;
               }
               return new §_-M2t§(_loc2_);
               break;
            default:
               return null;
         }
      }
      
      private function §_-JT§(param1:§_-X2z§) : Object
      {
         var _loc2_:Object = {};
         switch((param1 as Object).constructor as Class)
         {
            case §_-a11§:
               _loc2_["class"] = §_-O2x§;
               _loc2_["perk"] = param1.id;
               break;
            case §_-zr§:
               _loc2_["class"] = §_-V2R§;
               _loc2_["perk"] = param1.id;
               break;
            case §_-M2t§:
               _loc2_["class"] = §_-ay§;
               _loc2_["perk"] = param1.id;
         }
         return _loc2_;
      }
      
      private function §_-V1Q§(param1:Event = null) : void
      {
         var _loc2_:§_-X2z§ = null;
         for each(_loc2_ in this.buttons)
         {
            if(_loc2_.§_-Z15§() != null)
            {
               this.§_-E2T§(_loc2_);
            }
         }
      }
      
      private function §_-E2T§(param1:§_-X2z§) : void
      {
         var _loc2_:Point = param1.parent ? param1.parent.localToGlobal(new Point(param1.x,param1.y)) : new Point(0,0);
         param1.§_-Z15§().setPosition(_loc2_.x - param1.§_-Z15§().width - 10,_loc2_.y);
      }
   }
}

