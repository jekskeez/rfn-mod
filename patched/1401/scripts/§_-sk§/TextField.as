package §_-sk§
{
   import §_-K2c§.Event;
   import flash.display.BitmapData;
   import flash.display.StageQuality;
   import flash.display3D.Context3DTextureFormat;
   import flash.filters.BitmapFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.display.§_-t2M§;
   import starling.display.§_-u16§;
   import starling.textures.Texture;
   import starling.utils.§_-G8§;
   import starling.utils.§_-U2t§;
   import starling.utils.§_-Y1C§;
   import starling.utils.deg2rad;
   
   public class TextField extends DisplayObjectContainer
   {
      
      private static const §_-62o§:String = "starling.display.TextField.BitmapFonts";
      
      private static var §_-u2R§:String = "BGRA_PACKED" in Context3DTextureFormat ? "bgraPacked4444" : "bgra";
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-81Q§:flash.text.TextField = new flash.text.TextField();
      
      private static var §_-128§:Dictionary = new Dictionary();
      
      private var §_-JS§:Number;
      
      private var §_-Vt§:uint;
      
      private var §_-y1A§:String;
      
      private var §_-k1N§:String;
      
      private var §_-Y24§:String;
      
      private var §_-xO§:String;
      
      private var §_-D1T§:Boolean;
      
      private var §_-52Y§:Boolean;
      
      private var §_-cv§:Boolean;
      
      private var §_-Z1c§:Boolean;
      
      private var §_-U1z§:String;
      
      private var §_-k2r§:Boolean;
      
      private var §_-01A§:Number;
      
      private var §_-z2k§:Array;
      
      private var §_-fH§:Boolean;
      
      private var §_-r2P§:Boolean;
      
      private var §_-42x§:Rectangle;
      
      private var §_-g1I§:Boolean;
      
      private var §_-TY§:Rectangle;
      
      private var §_-NZ§:DisplayObjectContainer;
      
      private var §_-qE§:§_-jH§;
      
      private var §_-T2L§:§_-t2M§;
      
      public function TextField(param1:int, param2:int, param3:String, param4:String = "Verdana", param5:Number = 12, param6:uint = 0, param7:Boolean = false)
      {
         super();
         this.§_-y1A§ = param3 ? param3 : "";
         this.§_-JS§ = param5;
         this.§_-Vt§ = param6;
         this.§_-Y24§ = §_-G8§.CENTER;
         this.§_-xO§ = §_-Y1C§.CENTER;
         this.§_-NZ§ = null;
         this.§_-k2r§ = true;
         this.§_-01A§ = 0;
         this.§_-D1T§ = param7;
         this.§_-U1z§ = TextFieldAutoSize.NONE;
         this.§_-TY§ = new Rectangle(0,0,param1,param2);
         this.§_-B1l§ = param4;
         addEventListener(Event.§_-b2W§,this.§_-234§);
      }
      
      public static function get §_-j2H§() : String
      {
         return §_-u2R§;
      }
      
      public static function set §_-j2H§(param1:String) : void
      {
         §_-u2R§ = param1;
      }
      
      public static function §_-A3N§(param1:BitmapFont, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1.name;
         }
         §_-k2c§[§_-vP§(param2)] = param1;
         return param2;
      }
      
      public static function §_-v1B§(param1:String, param2:Boolean = true) : void
      {
         param1 = §_-vP§(param1);
         if(param2 && §_-k2c§[param1] != undefined)
         {
            §_-k2c§[param1].dispose();
         }
         delete §_-k2c§[param1];
      }
      
      public static function §_-Y1e§(param1:String) : BitmapFont
      {
         return §_-k2c§[§_-vP§(param1)];
      }
      
      private static function get §_-k2c§() : Dictionary
      {
         var _loc1_:Dictionary = Starling.§_-y1l§.§_-g28§[§_-62o§] as Dictionary;
         if(_loc1_ == null)
         {
            _loc1_ = new Dictionary();
            Starling.§_-y1l§.§_-g28§[§_-62o§] = _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-vP§(param1:String) : String
      {
         var _loc2_:String = §_-128§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = param1.toLowerCase();
            §_-128§[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         removeEventListener(Event.§_-b2W§,this.§_-234§);
         if(this.§_-qE§)
         {
            this.§_-qE§.texture.dispose();
         }
         if(this.§_-T2L§)
         {
            this.§_-T2L§.dispose();
         }
         super.dispose();
      }
      
      private function §_-234§() : void
      {
         if(this.§_-fH§)
         {
            this.redraw();
         }
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         if(this.§_-fH§)
         {
            this.redraw();
         }
         super.render(param1,param2);
      }
      
      public function redraw() : void
      {
         if(this.§_-fH§)
         {
            if(§_-Y1e§(this.§_-k1N§))
            {
               this.§_-C2§();
            }
            else
            {
               this.§_-S1H§();
            }
            this.§_-x2W§();
            this.§_-fH§ = false;
         }
      }
      
      private function §_-S1H§() : void
      {
         var format:String;
         var maxTextureSize:int;
         var shrinkHelper:Number;
         var texture:Texture = null;
         var scale:Number = NaN;
         var bitmapData:BitmapData = null;
         if(this.§_-T2L§)
         {
            this.§_-T2L§.removeFromParent(true);
            this.§_-T2L§ = null;
         }
         if(this.§_-42x§ == null)
         {
            this.§_-42x§ = new Rectangle();
         }
         scale = Starling.§_-61w§;
         bitmapData = this.§_-22W§(scale,this.§_-42x§);
         format = §_-u2R§;
         maxTextureSize = Texture.§_-s1c§;
         shrinkHelper = 0;
         while(bitmapData.width > maxTextureSize || bitmapData.height > maxTextureSize)
         {
            scale *= Math.min((maxTextureSize - shrinkHelper) / bitmapData.width,(maxTextureSize - shrinkHelper) / bitmapData.height);
            bitmapData.dispose();
            bitmapData = this.§_-22W§(scale,this.§_-42x§);
            shrinkHelper += 1;
         }
         this.§_-TY§.width = bitmapData.width / scale;
         this.§_-TY§.height = bitmapData.height / scale;
         texture = Texture.§_-b2K§(bitmapData,false,false,scale,format);
         texture.root.§_-x2b§ = function():void
         {
            if(§_-42x§ == null)
            {
               §_-42x§ = new Rectangle();
            }
            bitmapData = §_-22W§(scale,§_-42x§);
            texture.root.§_-B3d§(bitmapData);
            bitmapData.dispose();
            bitmapData = null;
         };
         bitmapData.dispose();
         bitmapData = null;
         if(this.§_-qE§ == null)
         {
            this.§_-qE§ = new §_-jH§(texture);
            this.§_-qE§.touchable = false;
            addChild(this.§_-qE§);
         }
         else
         {
            this.§_-qE§.texture.dispose();
            this.§_-qE§.texture = texture;
            this.§_-qE§.§_-T2Q§();
         }
      }
      
      protected function §_-1w§(param1:flash.text.TextField, param2:TextFormat) : void
      {
      }
      
      final protected function §_-9W§() : void
      {
         this.§_-fH§ = true;
      }
      
      private function §_-22W§(param1:Number, param2:Rectangle) : BitmapData
      {
         var _loc3_:Number = this.§_-TY§.width * param1;
         var _loc4_:Number = this.§_-TY§.height * param1;
         var _loc5_:String = this.§_-Y24§;
         var _loc6_:String = this.§_-xO§;
         if(this.§_-K1m§)
         {
            _loc3_ = int.MAX_VALUE;
            _loc5_ = §_-G8§.LEFT;
         }
         if(this.§_-kS§)
         {
            _loc4_ = int.MAX_VALUE;
            _loc6_ = §_-Y1C§.TOP;
         }
         var _loc7_:TextFormat = new TextFormat(this.§_-k1N§,this.§_-JS§ * param1,this.§_-Vt§,this.§_-D1T§,this.§_-52Y§,this.§_-cv§,null,null,_loc5_);
         _loc7_.kerning = this.§_-k2r§;
         _loc7_.leading = this.§_-01A§;
         §_-81Q§.defaultTextFormat = _loc7_;
         §_-81Q§.width = _loc3_;
         §_-81Q§.height = _loc4_;
         §_-81Q§.antiAliasType = AntiAliasType.ADVANCED;
         §_-81Q§.selectable = false;
         §_-81Q§.multiline = true;
         §_-81Q§.wordWrap = true;
         if(this.§_-r2P§)
         {
            §_-81Q§.htmlText = this.§_-y1A§;
         }
         else
         {
            §_-81Q§.text = this.§_-y1A§;
         }
         §_-81Q§.embedFonts = true;
         §_-81Q§.filters = this.§_-z2k§;
         if(§_-81Q§.textWidth == 0 || §_-81Q§.textHeight == 0)
         {
            §_-81Q§.embedFonts = false;
         }
         this.§_-1w§(§_-81Q§,_loc7_);
         if(this.§_-Z1c§)
         {
            this.§_-U18§(§_-81Q§);
         }
         var _loc8_:Number = §_-81Q§.textWidth;
         var _loc9_:Number = §_-81Q§.textHeight;
         if(this.§_-K1m§)
         {
            §_-81Q§.width = _loc3_ = Math.ceil(_loc8_ + 5);
         }
         if(this.§_-kS§)
         {
            §_-81Q§.height = _loc4_ = Math.ceil(_loc9_ + 4);
         }
         if(_loc3_ < 1)
         {
            _loc3_ = 1;
         }
         if(_loc4_ < 1)
         {
            _loc4_ = 1;
         }
         var _loc10_:Number = 0;
         if(_loc5_ == §_-G8§.LEFT)
         {
            _loc10_ = 2;
         }
         else if(_loc5_ == §_-G8§.CENTER)
         {
            _loc10_ = (_loc3_ - _loc8_) / 2;
         }
         else if(_loc5_ == §_-G8§.RIGHT)
         {
            _loc10_ = _loc3_ - _loc8_ - 2;
         }
         var _loc11_:Number = 0;
         if(_loc6_ == §_-Y1C§.TOP)
         {
            _loc11_ = 2;
         }
         else if(_loc6_ == §_-Y1C§.CENTER)
         {
            _loc11_ = (_loc4_ - _loc9_) / 2;
         }
         else if(_loc6_ == §_-Y1C§.BOTTOM)
         {
            _loc11_ = _loc4_ - _loc9_ - 2;
         }
         var _loc12_:Point = this.§_-W2Y§(§_-81Q§,_loc5_,_loc6_);
         var _loc13_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         var _loc14_:Matrix = new Matrix(1,0,0,1,_loc12_.x,_loc12_.y + int(_loc11_) - 2);
         var _loc15_:Function = "drawWithQuality" in _loc13_ ? _loc13_["drawWithQuality"] : null;
         if(_loc15_ is Function)
         {
            _loc15_.call(_loc13_,§_-81Q§,_loc14_,null,null,null,false,StageQuality.MEDIUM);
         }
         else
         {
            _loc13_.draw(§_-81Q§,_loc14_);
         }
         §_-81Q§.text = "";
         param2.setTo((_loc10_ + _loc12_.x) / param1,(_loc11_ + _loc12_.y) / param1,_loc8_ / param1,_loc9_ / param1);
         return _loc13_;
      }
      
      private function §_-U18§(param1:flash.text.TextField) : void
      {
         var _loc5_:TextFormat = null;
         var _loc2_:Number = Number(param1.defaultTextFormat.size);
         var _loc3_:int = param1.height - 4;
         var _loc4_:int = param1.width - 4;
         while(param1.textWidth > _loc4_ || param1.textHeight > _loc3_)
         {
            if(_loc2_ <= 4)
            {
               break;
            }
            _loc5_ = param1.defaultTextFormat;
            _loc5_.size = _loc2_--;
            param1.defaultTextFormat = _loc5_;
            if(this.§_-r2P§)
            {
               param1.htmlText = this.§_-y1A§;
            }
            else
            {
               param1.text = this.§_-y1A§;
            }
         }
      }
      
      private function §_-W2Y§(param1:flash.text.TextField, param2:String, param3:String) : Point
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Rectangle = null;
         var _loc9_:BitmapFilter = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Rectangle = null;
         var _loc4_:Point = new Point();
         var _loc5_:Array = param1.filters;
         if(_loc5_ != null && _loc5_.length > 0)
         {
            _loc6_ = param1.textWidth;
            _loc7_ = param1.textHeight;
            _loc8_ = new Rectangle();
            for each(_loc9_ in _loc5_)
            {
               _loc10_ = "blurX" in _loc9_ ? Number(_loc9_["blurX"]) : 0;
               _loc11_ = "blurY" in _loc9_ ? Number(_loc9_["blurY"]) : 0;
               _loc12_ = "angle" in _loc9_ ? Number(_loc9_["angle"]) : 0;
               _loc13_ = "distance" in _loc9_ ? Number(_loc9_["distance"]) : 0;
               _loc14_ = deg2rad(_loc12_);
               _loc15_ = _loc10_ * 1.33;
               _loc16_ = _loc11_ * 1.33;
               _loc17_ = Math.cos(_loc14_) * _loc13_ - _loc15_ / 2;
               _loc18_ = Math.sin(_loc14_) * _loc13_ - _loc16_ / 2;
               _loc19_ = new Rectangle(_loc17_,_loc18_,_loc6_ + _loc15_,_loc7_ + _loc16_);
               _loc8_ = _loc8_.union(_loc19_);
            }
            if(param2 == §_-G8§.LEFT && _loc8_.x < 0)
            {
               _loc4_.x = -_loc8_.x;
            }
            else if(param2 == §_-G8§.RIGHT && _loc8_.y > 0)
            {
               _loc4_.x = -(_loc8_.right - _loc6_);
            }
            if(param3 == §_-Y1C§.TOP && _loc8_.y < 0)
            {
               _loc4_.y = -_loc8_.y;
            }
            else if(param3 == §_-Y1C§.BOTTOM && _loc8_.y > 0)
            {
               _loc4_.y = -(_loc8_.bottom - _loc7_);
            }
         }
         return _loc4_;
      }
      
      private function §_-C2§() : void
      {
         if(this.§_-qE§)
         {
            this.§_-qE§.removeFromParent(true);
            this.§_-qE§.texture.dispose();
            this.§_-qE§ = null;
         }
         if(this.§_-T2L§ == null)
         {
            this.§_-T2L§ = new §_-t2M§();
            this.§_-T2L§.touchable = false;
            addChild(this.§_-T2L§);
         }
         else
         {
            this.§_-T2L§.reset();
         }
         var _loc1_:BitmapFont = §_-Y1e§(this.§_-k1N§);
         if(_loc1_ == null)
         {
            throw new Error("Bitmap font not registered: " + this.§_-k1N§);
         }
         var _loc2_:Number = this.§_-TY§.width;
         var _loc3_:Number = this.§_-TY§.height;
         var _loc4_:String = this.§_-Y24§;
         var _loc5_:String = this.§_-xO§;
         if(this.§_-K1m§)
         {
            _loc2_ = int.MAX_VALUE;
            _loc4_ = §_-G8§.LEFT;
         }
         if(this.§_-kS§)
         {
            _loc3_ = int.MAX_VALUE;
            _loc5_ = §_-Y1C§.TOP;
         }
         _loc1_.§_-N1F§(this.§_-T2L§,_loc2_,_loc3_,this.§_-y1A§,this.§_-JS§,this.§_-Vt§,_loc4_,_loc5_,this.§_-Z1c§,this.§_-k2r§,this.§_-01A§);
         this.§_-T2L§.§_-T19§ = this.§_-g1I§;
         if(this.§_-U1z§ != TextFieldAutoSize.NONE)
         {
            this.§_-42x§ = this.§_-T2L§.getBounds(this.§_-T2L§,this.§_-42x§);
            if(this.§_-K1m§)
            {
               this.§_-TY§.width = this.§_-42x§.x + this.§_-42x§.width;
            }
            if(this.§_-kS§)
            {
               this.§_-TY§.height = this.§_-42x§.y + this.§_-42x§.height;
            }
         }
         else
         {
            this.§_-42x§ = null;
         }
      }
      
      private function §_-x2W§() : void
      {
         if(this.§_-NZ§ == null)
         {
            return;
         }
         var _loc1_:Number = this.§_-TY§.width;
         var _loc2_:Number = this.§_-TY§.height;
         var _loc3_:§_-u16§ = this.§_-NZ§.getChildAt(0) as §_-u16§;
         var _loc4_:§_-u16§ = this.§_-NZ§.getChildAt(1) as §_-u16§;
         var _loc5_:§_-u16§ = this.§_-NZ§.getChildAt(2) as §_-u16§;
         var _loc6_:§_-u16§ = this.§_-NZ§.getChildAt(3) as §_-u16§;
         _loc3_.width = _loc1_;
         _loc3_.height = 1;
         _loc5_.width = _loc1_;
         _loc5_.height = 1;
         _loc6_.width = 1;
         _loc6_.height = _loc2_;
         _loc4_.width = 1;
         _loc4_.height = _loc2_;
         _loc4_.x = _loc1_ - 1;
         _loc5_.y = _loc2_ - 1;
         _loc3_.color = _loc4_.color = _loc5_.color = _loc6_.color = this.§_-Vt§;
      }
      
      private function get §_-K1m§() : Boolean
      {
         return this.§_-U1z§ == TextFieldAutoSize.HORIZONTAL || this.§_-U1z§ == TextFieldAutoSize.§_-w1G§;
      }
      
      private function get §_-kS§() : Boolean
      {
         return this.§_-U1z§ == TextFieldAutoSize.VERTICAL || this.§_-U1z§ == TextFieldAutoSize.§_-w1G§;
      }
      
      public function get §_-81X§() : Rectangle
      {
         if(this.§_-fH§)
         {
            this.redraw();
         }
         if(this.§_-42x§ == null)
         {
            this.§_-42x§ = this.§_-T2L§.getBounds(this.§_-T2L§);
         }
         return this.§_-42x§.clone();
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(this.§_-fH§)
         {
            this.redraw();
         }
         §_-eJ§(param1,§_-S19§);
         return §_-U2t§.getBounds(this.§_-TY§,§_-S19§,param2);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(this.§_-TY§.containsPoint(param1) && §_-O2d§(param1))
         {
            return this;
         }
         return null;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-TY§.width = param1;
         this.§_-fH§ = true;
      }
      
      override public function set height(param1:Number) : void
      {
         this.§_-TY§.height = param1;
         this.§_-fH§ = true;
      }
      
      public function get text() : String
      {
         return this.§_-y1A§;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(this.§_-y1A§ != param1)
         {
            this.§_-y1A§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get §_-B1l§() : String
      {
         return this.§_-k1N§;
      }
      
      public function set §_-B1l§(param1:String) : void
      {
         if(this.§_-k1N§ != param1)
         {
            if(param1 == BitmapFont.§_-Q1Y§ && §_-k2c§[param1] == undefined)
            {
               §_-A3N§(new BitmapFont());
            }
            this.§_-k1N§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get fontSize() : Number
      {
         return this.§_-JS§;
      }
      
      public function set fontSize(param1:Number) : void
      {
         if(this.§_-JS§ != param1)
         {
            this.§_-JS§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get color() : uint
      {
         return this.§_-Vt§;
      }
      
      public function set color(param1:uint) : void
      {
         if(this.§_-Vt§ != param1)
         {
            this.§_-Vt§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get hAlign() : String
      {
         return this.§_-Y24§;
      }
      
      public function set hAlign(param1:String) : void
      {
         if(!§_-G8§.§_-CQ§(param1))
         {
            throw new ArgumentError("Invalid horizontal align: " + param1);
         }
         if(this.§_-Y24§ != param1)
         {
            this.§_-Y24§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get vAlign() : String
      {
         return this.§_-xO§;
      }
      
      public function set vAlign(param1:String) : void
      {
         if(!§_-Y1C§.§_-CQ§(param1))
         {
            throw new ArgumentError("Invalid vertical align: " + param1);
         }
         if(this.§_-xO§ != param1)
         {
            this.§_-xO§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get border() : Boolean
      {
         return this.§_-NZ§ != null;
      }
      
      public function set border(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && this.§_-NZ§ == null)
         {
            this.§_-NZ§ = new Sprite();
            addChild(this.§_-NZ§);
            _loc2_ = 0;
            while(_loc2_ < 4)
            {
               this.§_-NZ§.addChild(new §_-u16§(1,1));
               _loc2_++;
            }
            this.§_-x2W§();
         }
         else if(!param1 && this.§_-NZ§ != null)
         {
            this.§_-NZ§.removeFromParent(true);
            this.§_-NZ§ = null;
         }
      }
      
      public function get bold() : Boolean
      {
         return this.§_-D1T§;
      }
      
      public function set bold(param1:Boolean) : void
      {
         if(this.§_-D1T§ != param1)
         {
            this.§_-D1T§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get §_-Ma§() : Boolean
      {
         return this.§_-52Y§;
      }
      
      public function set §_-Ma§(param1:Boolean) : void
      {
         if(this.§_-52Y§ != param1)
         {
            this.§_-52Y§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get §_-6s§() : Boolean
      {
         return this.§_-cv§;
      }
      
      public function set §_-6s§(param1:Boolean) : void
      {
         if(this.§_-cv§ != param1)
         {
            this.§_-cv§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get kerning() : Boolean
      {
         return this.§_-k2r§;
      }
      
      public function set kerning(param1:Boolean) : void
      {
         if(this.§_-k2r§ != param1)
         {
            this.§_-k2r§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get §_-M2A§() : Boolean
      {
         return this.§_-Z1c§;
      }
      
      public function set §_-M2A§(param1:Boolean) : void
      {
         if(this.§_-Z1c§ != param1)
         {
            this.§_-Z1c§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get autoSize() : String
      {
         return this.§_-U1z§;
      }
      
      public function set autoSize(param1:String) : void
      {
         if(this.§_-U1z§ != param1)
         {
            this.§_-U1z§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get §_-T19§() : Boolean
      {
         return this.§_-g1I§;
      }
      
      public function set §_-T19§(param1:Boolean) : void
      {
         this.§_-g1I§ = param1;
         if(this.§_-T2L§)
         {
            this.§_-T2L§.§_-T19§ = param1;
         }
      }
      
      public function get §_-Md§() : Array
      {
         return this.§_-z2k§;
      }
      
      public function set §_-Md§(param1:Array) : void
      {
         this.§_-z2k§ = param1.concat();
         this.§_-fH§ = true;
      }
      
      public function get §_-g21§() : Boolean
      {
         return this.§_-r2P§;
      }
      
      public function set §_-g21§(param1:Boolean) : void
      {
         if(this.§_-r2P§ != param1)
         {
            this.§_-r2P§ = param1;
            this.§_-fH§ = true;
         }
      }
      
      public function get leading() : Number
      {
         return this.§_-01A§;
      }
      
      public function set leading(param1:Number) : void
      {
         if(this.§_-01A§ != param1)
         {
            this.§_-01A§ = param1;
            this.§_-fH§ = true;
         }
      }
   }
}

