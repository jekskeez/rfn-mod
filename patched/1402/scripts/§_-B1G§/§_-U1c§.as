package §_-B1G§
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class §_-U1c§ extends Sprite
   {
      
      public static const §_-H2K§:int = 22;
      
      public static const §_-02C§:int = 1;
      
      public static const §_-34§:int = 6;
      
      private static const §_-a1G§:int = 23;
      
      private static const §_-q18§:uint = 16777215;
      
      private static const §_-01o§:uint = 16775395;
      
      private static const §_-Mu§:uint = 14996402;
      
      private static const §_-z2o§:int = 0;
      
      private static const §_-C19§:int = 1;
      
      private static const §_-93G§:int = 2;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017);
      
      private static const §_-d1N§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16711680,true);
      
      private static const §_-r1e§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017,true);
      
      private var §_-Gr§:ScrollPane;
      
      private var §_-9w§:Sprite;
      
      private var _items:Array = [];
      
      private var §_-i2o§:Array = [];
      
      private var §_-oD§:Dictionary = new Dictionary(true);
      
      private var §_-er§:Dictionary = new Dictionary(true);
      
      private var §_-u26§:Dictionary = new Dictionary(true);
      
      private var §_-D1z§:Dictionary = new Dictionary(true);
      
      private var §_-K2f§:Array = [];
      
      private var §_-Of§:int = -1;
      
      private var §_-JC§:Object = null;
      
      private var _width:int;
      
      private var _height:int;
      
      private var §_-i1d§:Boolean;
      
      private var §_-J2h§:int;
      
      private var §_-312§:Boolean = false;
      
      private var §_-C1P§:Function = null;
      
      private var §_-qZ§:String = "iconSource";
      
      private var §_-E1h§:Boolean = false;
      
      private var §_-8O§:Boolean = false;
      
      private var §_-y1O§:Boolean = false;
      
      private var §_-v2W§:Boolean = false;
      
      private var §_-GM§:Boolean = false;
      
      private var §_-Iy§:int = 0;
      
      private var §_-l8§:Function = null;
      
      private var §_-P27§:Object = null;
      
      private var §_-w2i§:Object = 0;
      
      public function §_-U1c§(param1:int = 220, param2:int = 200, param3:Boolean = false)
      {
         super();
         this._width = param1;
         this._height = param2;
         this.§_-i1d§ = param3;
         this.§_-J2h§ = param3 ? 24 : 6;
         this.§_-Gr§ = new ScrollPane();
         this.§_-Gr§.setSize(param1,param2);
         this.§_-Gr§.verticalLineScrollSize = §_-a1G§;
         addChild(this.§_-Gr§);
         this.§_-9w§ = new Sprite();
         this.§_-Gr§.source = this.§_-9w§;
         this.§_-Pi§();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§,false,0,true);
      }
      
      override public function get doubleClickEnabled() : Boolean
      {
         return super.doubleClickEnabled && this.§_-E1h§;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         super.doubleClickEnabled = this.§_-E1h§ = param1;
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function get length() : int
      {
         return this._items.length;
      }
      
      public function set §_-c23§(param1:Boolean) : void
      {
         this.§_-312§ = param1;
      }
      
      public function set §_-530§(param1:Function) : void
      {
         this.§_-C1P§ = param1;
      }
      
      public function set §_-y1N§(param1:String) : void
      {
         this.§_-qZ§ = param1;
      }
      
      public function get §_-JZ§() : int
      {
         return this.§_-Of§;
      }
      
      public function get §_-h2J§() : Array
      {
         return this.§_-K2f§.concat();
      }
      
      public function get §_-E2v§() : Object
      {
         return this.§_-Of§ >= 0 ? this._items[this.§_-Of§] : null;
      }
      
      public function set §_-E2v§(param1:Object) : void
      {
         this.§_-JZ§ = param1 != null ? this._items.indexOf(param1) : -1;
      }
      
      public function set §_-JZ§(param1:int) : void
      {
         if(param1 < -1 || param1 >= this._items.length)
         {
            return;
         }
         if(param1 < 0)
         {
            if(this.§_-K2f§.length == 0)
            {
               return;
            }
            this.§_-xI§([],null);
         }
         else
         {
            if(this.§_-K2f§.length == 1 && this.§_-Of§ == param1)
            {
               return;
            }
            this.§_-xI§([param1],this._items[param1]);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function §_-72S§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-K2f§.length)
         {
            _loc1_.push(this._items[int(this.§_-K2f§[_loc2_])]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function setSelection(param1:Array, param2:int = -1) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Object = null;
         if(param2 >= 0 && param2 < this._items.length)
         {
            _loc3_ = this._items[param2];
         }
         else if(param1.length > 0)
         {
            _loc4_ = int(param1[param1.length - 1]);
            if(_loc4_ >= 0 && _loc4_ < this._items.length)
            {
               _loc3_ = this._items[_loc4_];
            }
         }
         this.§_-xI§(param1,_loc3_);
      }
      
      public function §_-u2a§(param1:int) : Sprite
      {
         this.flush();
         return param1 >= 0 && param1 < this.§_-i2o§.length ? this.§_-i2o§[param1] as Sprite : null;
      }
      
      public function removeAll() : void
      {
         if(this._items.length == 0 && this.§_-K2f§.length == 0)
         {
            return;
         }
         this._items = [];
         this.§_-k1g§();
         this.§_-f2B§();
      }
      
      public function §_-533§(param1:Array, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         this._items = param1.concat();
         this.§_-k1g§();
         if(param2 >= 0 && this._items.length > 0)
         {
            _loc3_ = param2 < this._items.length ? param2 : 0;
            _loc4_ = this._items[_loc3_];
            this.§_-D1z§[_loc4_] = true;
            this.§_-K2f§ = [_loc3_];
            this.§_-Of§ = _loc3_;
            this.§_-JC§ = _loc4_;
         }
         this.§_-f2B§();
      }
      
      public function addItem(param1:Object) : void
      {
         this._items.push(param1);
         this.§_-f2B§();
      }
      
      public function removeItem(param1:Object) : void
      {
         var _loc2_:int = this._items.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this._items.splice(_loc2_,1);
         if(this.§_-D1z§[param1] != null)
         {
            delete this.§_-D1z§[param1];
            this.§_-A3V§();
         }
         if(this.§_-JC§ == param1)
         {
            this.§_-JC§ = null;
         }
         this.§_-f2B§();
      }
      
      public function §_-J2c§(param1:Function) : void
      {
         this.§_-Iy§ = §_-C19§;
         this.§_-l8§ = param1;
         this.§_-f2B§();
      }
      
      public function §_-r2Z§(param1:Object, param2:Object = 0) : void
      {
         this.§_-Iy§ = §_-93G§;
         this.§_-P27§ = param1;
         this.§_-w2i§ = param2;
         this.§_-f2B§();
      }
      
      public function §_-iJ§() : void
      {
         this.§_-v2W§ = true;
         this.§_-f2B§();
      }
      
      public function §_-r6§() : void
      {
         this.flush();
         this.§_-Gr§.update();
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         if(param1 == this._width && param2 == this._height)
         {
            return;
         }
         var _loc3_:Boolean = param1 != this._width;
         this._width = param1;
         this._height = param2;
         this.§_-Gr§.setSize(param1,param2);
         this.§_-Pi§();
         if(_loc3_)
         {
            this.§_-v2W§ = true;
         }
         this.§_-f2B§();
      }
      
      private function §_-f2B§() : void
      {
         this.§_-8O§ = true;
         this.§_-Xg§();
      }
      
      private function §_-u1U§() : void
      {
         this.§_-y1O§ = true;
         this.§_-Xg§();
      }
      
      private function §_-Xg§() : void
      {
         if(this.§_-GM§)
         {
            return;
         }
         if(this.stage)
         {
            this.§_-GM§ = true;
            this.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§,false,0,true);
         }
         else
         {
            this.flush();
         }
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         this.flush();
      }
      
      private function §_-I2T§() : void
      {
         if(!this.§_-GM§)
         {
            return;
         }
         this.§_-GM§ = false;
         if(this.stage)
         {
            this.stage.removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         }
      }
      
      private function §_-F10§(param1:Event) : void
      {
         if((this.§_-8O§ || this.§_-y1O§) && !this.§_-GM§)
         {
            this.§_-Xg§();
         }
      }
      
      private function §_-D1y§(param1:Event) : void
      {
         this.§_-I2T§();
         if(this.§_-8O§ || this.§_-y1O§)
         {
            this.flush();
         }
      }
      
      private function flush() : void
      {
         this.§_-I2T§();
         if(!this.§_-8O§ && !this.§_-y1O§)
         {
            return;
         }
         if(this.§_-8O§)
         {
            if(this.§_-v2W§)
            {
               this.§_-23b§();
               this.§_-v2W§ = false;
            }
            this.§_-q2k§();
            this.§_-Q2o§();
            this.§_-Gr§.update();
         }
         this.§_-k6§();
         this.§_-8O§ = false;
         this.§_-y1O§ = false;
      }
      
      private function §_-q2k§() : void
      {
         if(this.§_-Iy§ == §_-z2o§)
         {
            return;
         }
         if(this.§_-Iy§ == §_-93G§)
         {
            this._items.sortOn(this.§_-P27§,this.§_-w2i§);
         }
         else if(this.§_-l8§ != null)
         {
            this._items.sort(this.§_-l8§);
         }
         this.§_-Iy§ = §_-z2o§;
         this.§_-l8§ = null;
         this.§_-P27§ = null;
         this.§_-A3V§();
      }
      
      private function §_-Q2o§() : void
      {
         var _loc4_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Sprite = null;
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:Sprite = null;
         var _loc11_:Object = null;
         var _loc1_:int = int(this._items.length);
         var _loc2_:Array = new Array(_loc1_);
         var _loc3_:Dictionary = new Dictionary(true);
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc6_ = this._items[_loc4_];
            _loc7_ = this.§_-oD§[_loc6_] as Sprite;
            if(_loc7_ == null)
            {
               _loc7_ = this.§_-sh§(_loc6_,_loc4_);
               this.§_-9w§.addChild(_loc7_);
               this.§_-oD§[_loc6_] = _loc7_;
               this.§_-er§[_loc7_] = _loc6_;
            }
            _loc3_[_loc7_] = true;
            _loc8_ = _loc4_ * §_-a1G§;
            if(_loc7_.y != _loc8_)
            {
               _loc7_.y = _loc8_;
            }
            _loc9_ = String(_loc4_);
            if(_loc7_.name != _loc9_)
            {
               _loc7_.name = _loc9_;
            }
            _loc2_[_loc4_] = _loc7_;
            _loc4_++;
         }
         var _loc5_:Array = this.§_-i2o§;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc10_ = _loc5_[_loc4_];
            if(_loc3_[_loc10_] != true)
            {
               if(_loc10_.parent == this.§_-9w§)
               {
                  this.§_-9w§.removeChild(_loc10_);
               }
               _loc11_ = this.§_-er§[_loc10_];
               if(_loc11_ != null)
               {
                  delete this.§_-oD§[_loc11_];
                  delete this.§_-er§[_loc10_];
               }
               delete this.§_-u26§[_loc10_];
            }
            _loc4_++;
         }
         this.§_-i2o§ = _loc2_;
      }
      
      private function §_-k6§() : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc1_:int = int(this.§_-i2o§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:int = _loc1_ - 1;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc4_ = this.§_-i2o§[_loc3_];
            _loc5_ = this.§_-D1z§[this._items[_loc3_]] == true;
            _loc6_ = _loc3_ < _loc2_;
            _loc7_ = (_loc5_ ? 1 : 0) | (_loc6_ ? 2 : 0);
            if(this.§_-u26§[_loc4_] !== _loc7_)
            {
               this.§_-42E§(_loc4_,_loc5_,_loc6_);
               this.§_-u26§[_loc4_] = _loc7_;
            }
            _loc3_++;
         }
      }
      
      private function §_-42E§(param1:Sprite, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:Graphics = param1.graphics;
         _loc4_.clear();
         _loc4_.beginFill(param2 ? §_-01o§ : §_-q18§);
         _loc4_.drawRect(0,0,this._width,§_-H2K§);
         _loc4_.endFill();
         if(param3)
         {
            _loc4_.lineStyle(§_-02C§,§_-Mu§);
            _loc4_.moveTo(0,§_-H2K§);
            _loc4_.lineTo(this._width,§_-H2K§);
         }
      }
      
      private function §_-xI§(param1:Array, param2:Object) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         this.§_-D1z§ = new Dictionary(true);
         this.§_-K2f§ = [];
         var _loc3_:int = int(this._items.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = int(param1[_loc4_]);
            if(!(_loc5_ < 0 || _loc5_ >= _loc3_))
            {
               _loc6_ = this._items[_loc5_];
               if(this.§_-D1z§[_loc6_] == null)
               {
                  this.§_-D1z§[_loc6_] = true;
                  this.§_-K2f§.push(_loc5_);
               }
            }
            _loc4_++;
         }
         this.§_-Of§ = this.§_-K2f§.length > 0 ? int(this.§_-K2f§[this.§_-K2f§.length - 1]) : -1;
         this.§_-JC§ = param2;
         this.§_-u1U§();
      }
      
      private function §_-A3V§() : void
      {
         this.§_-K2f§ = [];
         var _loc1_:int = int(this._items.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.§_-D1z§[this._items[_loc2_]] == true)
            {
               this.§_-K2f§.push(_loc2_);
            }
            _loc2_++;
         }
         this.§_-Of§ = this.§_-K2f§.length > 0 ? int(this.§_-K2f§[this.§_-K2f§.length - 1]) : -1;
      }
      
      private function §_-k1g§() : void
      {
         this.§_-D1z§ = new Dictionary(true);
         this.§_-K2f§ = [];
         this.§_-Of§ = -1;
         this.§_-JC§ = null;
      }
      
      private function §_-23b§() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-i2o§.length)
         {
            _loc2_ = this.§_-i2o§[_loc1_];
            if(_loc2_.parent == this.§_-9w§)
            {
               this.§_-9w§.removeChild(_loc2_);
            }
            delete this.§_-u26§[_loc2_];
            _loc3_ = this.§_-er§[_loc2_];
            if(_loc3_ != null)
            {
               delete this.§_-oD§[_loc3_];
            }
            delete this.§_-er§[_loc2_];
            _loc1_++;
         }
         this.§_-i2o§ = [];
      }
      
      private function §_-Pi§() : void
      {
         var _loc1_:Graphics = this.§_-Gr§.graphics;
         _loc1_.clear();
         _loc1_.beginFill(§_-q18§);
         _loc1_.lineStyle(1,§_-Mu§);
         _loc1_.drawRoundRect(0,0,this._width,this._height,§_-34§,§_-34§);
         _loc1_.endFill();
      }
      
      private function §_-sh§(param1:Object, param2:int) : Sprite
      {
         var _loc3_:Sprite = this.§_-C1P§ != null ? this.§_-C1P§(param1,param2,this._width) as Sprite : this.§_-W2n§(param1);
         _loc3_.name = String(param2);
         _loc3_.buttonMode = true;
         _loc3_.mouseChildren = false;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-En§);
         if(this.§_-E1h§)
         {
            _loc3_.doubleClickEnabled = true;
            _loc3_.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-Np§);
         }
         return _loc3_;
      }
      
      private function §_-W2n§(param1:Object) : Sprite
      {
         var _loc7_:DisplayObject = null;
         var _loc8_:int = 0;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:int = this.§_-J2h§;
         if(this.§_-i1d§ && param1[this.§_-qZ§] != null)
         {
            try
            {
               _loc7_ = new (param1[this.§_-qZ§] as Class)() as DisplayObject;
               _loc7_.x = 4;
               _loc7_.y = int((§_-H2K§ - _loc7_.height) * 0.5);
               _loc2_.addChild(_loc7_);
               _loc8_ = int(_loc7_.x + _loc7_.width + 4);
               if(_loc8_ > _loc3_)
               {
                  _loc3_ = _loc8_;
               }
            }
            catch(e:Error)
            {
            }
         }
         var _loc4_:TextFormat = param1["marked"] ? §_-d1N§ : (param1["bold"] ? §_-r1e§ : §_-W2P§);
         var _loc5_:String = param1["label"] != null ? String(param1["label"]) : "";
         var _loc6_:§_-i5§ = new §_-i5§(_loc5_,_loc3_,2,_loc4_,this._width - _loc3_ - 4);
         _loc6_.multiline = false;
         _loc6_.wordWrap = false;
         _loc2_.addChild(_loc6_);
         return _loc2_;
      }
      
      private function §_-En§(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.flush();
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         var _loc3_:Object = this.§_-er§[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = this._items.indexOf(_loc3_);
         if(_loc4_ < 0)
         {
            return;
         }
         if(this.§_-312§ && param1.shiftKey && this.§_-JC§ != null)
         {
            _loc5_ = this._items.indexOf(this.§_-JC§);
            if(_loc5_ < 0)
            {
               _loc5_ = _loc4_;
            }
            _loc6_ = _loc5_ < _loc4_ ? _loc5_ : _loc4_;
            _loc7_ = _loc5_ < _loc4_ ? _loc4_ : _loc5_;
            this.§_-D1z§ = new Dictionary(true);
            this.§_-K2f§ = [];
            _loc8_ = _loc6_;
            while(_loc8_ <= _loc7_)
            {
               this.§_-D1z§[this._items[_loc8_]] = true;
               this.§_-K2f§.push(_loc8_);
               _loc8_++;
            }
            this.§_-Of§ = _loc4_;
         }
         else if(this.§_-312§ && param1.ctrlKey)
         {
            if(this.§_-D1z§[_loc3_] != null)
            {
               delete this.§_-D1z§[_loc3_];
            }
            else
            {
               this.§_-D1z§[_loc3_] = true;
            }
            this.§_-A3V§();
            this.§_-JC§ = _loc3_;
         }
         else
         {
            this.§_-D1z§ = new Dictionary(true);
            this.§_-D1z§[_loc3_] = true;
            this.§_-K2f§ = [_loc4_];
            this.§_-Of§ = _loc4_;
            this.§_-JC§ = _loc3_;
         }
         this.§_-u1U§();
         dispatchEvent(new Event(Event.CHANGE));
         dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false));
      }
      
      private function §_-Np§(param1:MouseEvent) : void
      {
         this.flush();
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         var _loc3_:Object = this.§_-er§[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = this._items.indexOf(_loc3_);
         if(_loc4_ < 0)
         {
            return;
         }
         this.§_-D1z§ = new Dictionary(true);
         this.§_-D1z§[_loc3_] = true;
         this.§_-K2f§ = [_loc4_];
         this.§_-Of§ = _loc4_;
         this.§_-JC§ = _loc3_;
         this.§_-u1U§();
         dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK,true,false));
      }
   }
}

