package §_-Kr§
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class §_-12w§ extends Sprite
   {
      
      public static const §_-z1O§:int = 22;
      
      public static const §_-R20§:int = 1;
      
      public static const §_-C2A§:int = 6;
      
      private static const §_-Uh§:int = 23;
      
      private static const §_-UN§:uint = 16777215;
      
      private static const §_-N2U§:uint = 16775395;
      
      private static const §_-L2V§:uint = 14996402;
      
      private static const §_-F2I§:int = 0;
      
      private static const §_-nt§:int = 1;
      
      private static const §_-i2U§:int = 2;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017);
      
      private static const §_-Q2b§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16711680,true);
      
      private static const §_-x2i§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017,true);
      
      private var §_-H27§:ScrollPane;
      
      private var §_-I2y§:Sprite;
      
      private var _items:Array = [];
      
      private var §_-Bw§:Array = [];
      
      private var §_-32o§:Dictionary = new Dictionary(true);
      
      private var §_-OT§:Dictionary = new Dictionary(true);
      
      private var §_-s16§:Dictionary = new Dictionary(true);
      
      private var §_-mx§:Dictionary = new Dictionary(true);
      
      private var §_-qY§:Array = [];
      
      private var §_-1r§:int = -1;
      
      private var §_-M23§:Object = null;
      
      private var _width:int;
      
      private var _height:int;
      
      private var §_-g2x§:Boolean;
      
      private var §_-j2I§:int;
      
      private var §_-12d§:Boolean = false;
      
      private var §_-H11§:Function = null;
      
      private var §_-71c§:String = "iconSource";
      
      private var §_-N15§:Boolean = false;
      
      private var §_-n2l§:Boolean = false;
      
      private var §_-b2N§:Boolean = false;
      
      private var §_-ED§:Boolean = false;
      
      private var §_-C3i§:Boolean = false;
      
      private var §_-y1w§:int = 0;
      
      private var §_-91J§:Function = null;
      
      private var §_-O22§:Object = null;
      
      private var §_-53i§:Object = 0;
      
      public function §_-12w§(param1:int = 220, param2:int = 200, param3:Boolean = false)
      {
         super();
         this._width = param1;
         this._height = param2;
         this.§_-g2x§ = param3;
         this.§_-j2I§ = param3 ? 24 : 6;
         this.§_-H27§ = new ScrollPane();
         this.§_-H27§.setSize(param1,param2);
         this.§_-H27§.verticalLineScrollSize = §_-Uh§;
         addChild(this.§_-H27§);
         this.§_-I2y§ = new Sprite();
         this.§_-H27§.source = this.§_-I2y§;
         this.§_-73J§();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§,false,0,true);
      }
      
      override public function get doubleClickEnabled() : Boolean
      {
         return super.doubleClickEnabled && this.§_-N15§;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         super.doubleClickEnabled = this.§_-N15§ = param1;
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function get length() : int
      {
         return this._items.length;
      }
      
      public function set §_-Z1u§(param1:Boolean) : void
      {
         this.§_-12d§ = param1;
      }
      
      public function set §_-82M§(param1:Function) : void
      {
         this.§_-H11§ = param1;
      }
      
      public function set §_-73w§(param1:String) : void
      {
         this.§_-71c§ = param1;
      }
      
      public function get §_-Uf§() : int
      {
         return this.§_-1r§;
      }
      
      public function get §_-83s§() : Array
      {
         return this.§_-qY§.concat();
      }
      
      public function get §_-l1§() : Object
      {
         return this.§_-1r§ >= 0 ? this._items[this.§_-1r§] : null;
      }
      
      public function set §_-l1§(param1:Object) : void
      {
         this.§_-Uf§ = param1 != null ? this._items.indexOf(param1) : -1;
      }
      
      public function set §_-Uf§(param1:int) : void
      {
         if(param1 < -1 || param1 >= this._items.length)
         {
            return;
         }
         if(param1 < 0)
         {
            if(this.§_-qY§.length == 0)
            {
               return;
            }
            this.§_-4g§([],null);
         }
         else
         {
            if(this.§_-qY§.length == 1 && this.§_-1r§ == param1)
            {
               return;
            }
            this.§_-4g§([param1],this._items[param1]);
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function §_-x1U§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-qY§.length)
         {
            _loc1_.push(this._items[int(this.§_-qY§[_loc2_])]);
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
         this.§_-4g§(param1,_loc3_);
      }
      
      public function §_-J2W§(param1:int) : Sprite
      {
         this.flush();
         return param1 >= 0 && param1 < this.§_-Bw§.length ? this.§_-Bw§[param1] as Sprite : null;
      }
      
      public function removeAll() : void
      {
         if(this._items.length == 0 && this.§_-qY§.length == 0)
         {
            return;
         }
         this._items = [];
         this.§_-f5§();
         this.§_-32g§();
      }
      
      public function §_-K26§(param1:Array, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         this._items = param1.concat();
         this.§_-f5§();
         if(param2 >= 0 && this._items.length > 0)
         {
            _loc3_ = param2 < this._items.length ? param2 : 0;
            _loc4_ = this._items[_loc3_];
            this.§_-mx§[_loc4_] = true;
            this.§_-qY§ = [_loc3_];
            this.§_-1r§ = _loc3_;
            this.§_-M23§ = _loc4_;
         }
         this.§_-32g§();
      }
      
      public function addItem(param1:Object) : void
      {
         this._items.push(param1);
         this.§_-32g§();
      }
      
      public function removeItem(param1:Object) : void
      {
         var _loc2_:int = this._items.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this._items.splice(_loc2_,1);
         if(this.§_-mx§[param1] != null)
         {
            delete this.§_-mx§[param1];
            this.§_-13k§();
         }
         if(this.§_-M23§ == param1)
         {
            this.§_-M23§ = null;
         }
         this.§_-32g§();
      }
      
      public function §_-Y1n§(param1:Function) : void
      {
         this.§_-y1w§ = §_-nt§;
         this.§_-91J§ = param1;
         this.§_-32g§();
      }
      
      public function §_-yy§(param1:Object, param2:Object = 0) : void
      {
         this.§_-y1w§ = §_-i2U§;
         this.§_-O22§ = param1;
         this.§_-53i§ = param2;
         this.§_-32g§();
      }
      
      public function §_-f19§() : void
      {
         this.§_-ED§ = true;
         this.§_-32g§();
      }
      
      public function §_-43o§() : void
      {
         this.flush();
         this.§_-H27§.update();
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
         this.§_-H27§.setSize(param1,param2);
         this.§_-73J§();
         if(_loc3_)
         {
            this.§_-ED§ = true;
         }
         this.§_-32g§();
      }
      
      private function §_-32g§() : void
      {
         this.§_-n2l§ = true;
         this.§_-J2P§();
      }
      
      private function §_-h1D§() : void
      {
         this.§_-b2N§ = true;
         this.§_-J2P§();
      }
      
      private function §_-J2P§() : void
      {
         if(this.§_-C3i§)
         {
            return;
         }
         if(this.stage)
         {
            this.§_-C3i§ = true;
            this.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§,false,0,true);
         }
         else
         {
            this.flush();
         }
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         this.flush();
      }
      
      private function §_-e1J§() : void
      {
         if(!this.§_-C3i§)
         {
            return;
         }
         this.§_-C3i§ = false;
         if(this.stage)
         {
            this.stage.removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         }
      }
      
      private function §_-wm§(param1:Event) : void
      {
         if((this.§_-n2l§ || this.§_-b2N§) && !this.§_-C3i§)
         {
            this.§_-J2P§();
         }
      }
      
      private function §_-h2j§(param1:Event) : void
      {
         this.§_-e1J§();
         if(this.§_-n2l§ || this.§_-b2N§)
         {
            this.flush();
         }
      }
      
      private function flush() : void
      {
         this.§_-e1J§();
         if(!this.§_-n2l§ && !this.§_-b2N§)
         {
            return;
         }
         if(this.§_-n2l§)
         {
            if(this.§_-ED§)
            {
               this.§_-21Z§();
               this.§_-ED§ = false;
            }
            this.§_-71Q§();
            this.§_-y1e§();
            this.§_-H27§.update();
         }
         this.§_-l2r§();
         this.§_-n2l§ = false;
         this.§_-b2N§ = false;
      }
      
      private function §_-71Q§() : void
      {
         if(this.§_-y1w§ == §_-F2I§)
         {
            return;
         }
         if(this.§_-y1w§ == §_-i2U§)
         {
            this._items.sortOn(this.§_-O22§,this.§_-53i§);
         }
         else if(this.§_-91J§ != null)
         {
            this._items.sort(this.§_-91J§);
         }
         this.§_-y1w§ = §_-F2I§;
         this.§_-91J§ = null;
         this.§_-O22§ = null;
         this.§_-13k§();
      }
      
      private function §_-y1e§() : void
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
            _loc7_ = this.§_-32o§[_loc6_] as Sprite;
            if(_loc7_ == null)
            {
               _loc7_ = this.§_-h2E§(_loc6_,_loc4_);
               this.§_-I2y§.addChild(_loc7_);
               this.§_-32o§[_loc6_] = _loc7_;
               this.§_-OT§[_loc7_] = _loc6_;
            }
            _loc3_[_loc7_] = true;
            _loc8_ = _loc4_ * §_-Uh§;
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
         var _loc5_:Array = this.§_-Bw§;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc10_ = _loc5_[_loc4_];
            if(_loc3_[_loc10_] != true)
            {
               if(_loc10_.parent == this.§_-I2y§)
               {
                  this.§_-I2y§.removeChild(_loc10_);
               }
               _loc11_ = this.§_-OT§[_loc10_];
               if(_loc11_ != null)
               {
                  delete this.§_-32o§[_loc11_];
                  delete this.§_-OT§[_loc10_];
               }
               delete this.§_-s16§[_loc10_];
            }
            _loc4_++;
         }
         this.§_-Bw§ = _loc2_;
      }
      
      private function §_-l2r§() : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc1_:int = int(this.§_-Bw§.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:int = _loc1_ - 1;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc4_ = this.§_-Bw§[_loc3_];
            _loc5_ = this.§_-mx§[this._items[_loc3_]] == true;
            _loc6_ = _loc3_ < _loc2_;
            _loc7_ = (_loc5_ ? 1 : 0) | (_loc6_ ? 2 : 0);
            if(this.§_-s16§[_loc4_] !== _loc7_)
            {
               this.§_-5V§(_loc4_,_loc5_,_loc6_);
               this.§_-s16§[_loc4_] = _loc7_;
            }
            _loc3_++;
         }
      }
      
      private function §_-5V§(param1:Sprite, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:Graphics = param1.graphics;
         _loc4_.clear();
         _loc4_.beginFill(param2 ? §_-N2U§ : §_-UN§);
         _loc4_.drawRect(0,0,this._width,§_-z1O§);
         _loc4_.endFill();
         if(param3)
         {
            _loc4_.lineStyle(§_-R20§,§_-L2V§);
            _loc4_.moveTo(0,§_-z1O§);
            _loc4_.lineTo(this._width,§_-z1O§);
         }
      }
      
      private function §_-4g§(param1:Array, param2:Object) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         this.§_-mx§ = new Dictionary(true);
         this.§_-qY§ = [];
         var _loc3_:int = int(this._items.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = int(param1[_loc4_]);
            if(!(_loc5_ < 0 || _loc5_ >= _loc3_))
            {
               _loc6_ = this._items[_loc5_];
               if(this.§_-mx§[_loc6_] == null)
               {
                  this.§_-mx§[_loc6_] = true;
                  this.§_-qY§.push(_loc5_);
               }
            }
            _loc4_++;
         }
         this.§_-1r§ = this.§_-qY§.length > 0 ? int(this.§_-qY§[this.§_-qY§.length - 1]) : -1;
         this.§_-M23§ = param2;
         this.§_-h1D§();
      }
      
      private function §_-13k§() : void
      {
         this.§_-qY§ = [];
         var _loc1_:int = int(this._items.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.§_-mx§[this._items[_loc2_]] == true)
            {
               this.§_-qY§.push(_loc2_);
            }
            _loc2_++;
         }
         this.§_-1r§ = this.§_-qY§.length > 0 ? int(this.§_-qY§[this.§_-qY§.length - 1]) : -1;
      }
      
      private function §_-f5§() : void
      {
         this.§_-mx§ = new Dictionary(true);
         this.§_-qY§ = [];
         this.§_-1r§ = -1;
         this.§_-M23§ = null;
      }
      
      private function §_-21Z§() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-Bw§.length)
         {
            _loc2_ = this.§_-Bw§[_loc1_];
            if(_loc2_.parent == this.§_-I2y§)
            {
               this.§_-I2y§.removeChild(_loc2_);
            }
            delete this.§_-s16§[_loc2_];
            _loc3_ = this.§_-OT§[_loc2_];
            if(_loc3_ != null)
            {
               delete this.§_-32o§[_loc3_];
            }
            delete this.§_-OT§[_loc2_];
            _loc1_++;
         }
         this.§_-Bw§ = [];
      }
      
      private function §_-73J§() : void
      {
         var _loc1_:Graphics = this.§_-H27§.graphics;
         _loc1_.clear();
         _loc1_.beginFill(§_-UN§);
         _loc1_.lineStyle(1,§_-L2V§);
         _loc1_.drawRoundRect(0,0,this._width,this._height,§_-C2A§,§_-C2A§);
         _loc1_.endFill();
      }
      
      private function §_-h2E§(param1:Object, param2:int) : Sprite
      {
         var _loc3_:Sprite = this.§_-H11§ != null ? this.§_-H11§(param1,param2,this._width) as Sprite : this.§_-4a§(param1);
         _loc3_.name = String(param2);
         _loc3_.buttonMode = true;
         _loc3_.mouseChildren = false;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-n2u§);
         if(this.§_-N15§)
         {
            _loc3_.doubleClickEnabled = true;
            _loc3_.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-03l§);
         }
         return _loc3_;
      }
      
      private function §_-4a§(param1:Object) : Sprite
      {
         var _loc7_:DisplayObject = null;
         var _loc8_:int = 0;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:int = this.§_-j2I§;
         if(this.§_-g2x§ && param1[this.§_-71c§] != null)
         {
            try
            {
               _loc7_ = new (param1[this.§_-71c§] as Class)() as DisplayObject;
               _loc7_.x = 4;
               _loc7_.y = int((§_-z1O§ - _loc7_.height) * 0.5);
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
         var _loc4_:TextFormat = param1["marked"] ? §_-Q2b§ : (param1["bold"] ? §_-x2i§ : §_-i2c§);
         var _loc5_:String = param1["label"] != null ? String(param1["label"]) : "";
         var _loc6_:§_-22V§ = new §_-22V§(_loc5_,_loc3_,2,_loc4_,this._width - _loc3_ - 4);
         _loc6_.multiline = false;
         _loc6_.wordWrap = false;
         _loc2_.addChild(_loc6_);
         return _loc2_;
      }
      
      private function §_-n2u§(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.flush();
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         var _loc3_:Object = this.§_-OT§[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = this._items.indexOf(_loc3_);
         if(_loc4_ < 0)
         {
            return;
         }
         if(this.§_-12d§ && param1.shiftKey && this.§_-M23§ != null)
         {
            _loc5_ = this._items.indexOf(this.§_-M23§);
            if(_loc5_ < 0)
            {
               _loc5_ = _loc4_;
            }
            _loc6_ = _loc5_ < _loc4_ ? _loc5_ : _loc4_;
            _loc7_ = _loc5_ < _loc4_ ? _loc4_ : _loc5_;
            this.§_-mx§ = new Dictionary(true);
            this.§_-qY§ = [];
            _loc8_ = _loc6_;
            while(_loc8_ <= _loc7_)
            {
               this.§_-mx§[this._items[_loc8_]] = true;
               this.§_-qY§.push(_loc8_);
               _loc8_++;
            }
            this.§_-1r§ = _loc4_;
         }
         else if(this.§_-12d§ && param1.ctrlKey)
         {
            if(this.§_-mx§[_loc3_] != null)
            {
               delete this.§_-mx§[_loc3_];
            }
            else
            {
               this.§_-mx§[_loc3_] = true;
            }
            this.§_-13k§();
            this.§_-M23§ = _loc3_;
         }
         else
         {
            this.§_-mx§ = new Dictionary(true);
            this.§_-mx§[_loc3_] = true;
            this.§_-qY§ = [_loc4_];
            this.§_-1r§ = _loc4_;
            this.§_-M23§ = _loc3_;
         }
         this.§_-h1D§();
         dispatchEvent(new Event(Event.CHANGE));
         dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false));
      }
      
      private function §_-03l§(param1:MouseEvent) : void
      {
         this.flush();
         var _loc2_:Sprite = param1.currentTarget as Sprite;
         var _loc3_:Object = this.§_-OT§[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = this._items.indexOf(_loc3_);
         if(_loc4_ < 0)
         {
            return;
         }
         this.§_-mx§ = new Dictionary(true);
         this.§_-mx§[_loc3_] = true;
         this.§_-qY§ = [_loc4_];
         this.§_-1r§ = _loc4_;
         this.§_-M23§ = _loc3_;
         this.§_-h1D§();
         dispatchEvent(new MouseEvent(MouseEvent.DOUBLE_CLICK,true,false));
      }
   }
}

