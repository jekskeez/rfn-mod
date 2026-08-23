package §_-b5§
{
   import §_-f1T§.Event;
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
   import starling.core.§_-wz§;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Sprite;
   import starling.display.§_-81s§;
   import starling.display.§_-I2q§;
   import starling.display.§_-V2h§;
   import starling.textures.Texture;
   import starling.utils.§_-42b§;
   import starling.utils.§_-F2o§;
   import starling.utils.§_-U2x§;
   import starling.utils.deg2rad;
   
   public class TextField extends DisplayObjectContainer
   {
      
      private static const §_-x1C§:String = "starling.display.TextField.BitmapFonts";
      
      private static var §_-J13§:String = "BGRA_PACKED" in Context3DTextureFormat ? "bgraPacked4444" : "bgra";
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var §_-N2X§:flash.text.TextField = new flash.text.TextField();
      
      private static var §_-wB§:Dictionary = new Dictionary();
      
      private var §_-r2f§:Number;
      
      private var §_-21g§:uint;
      
      private var §_-2D§:String;
      
      private var §_-N12§:String;
      
      private var §_-m0§:String;
      
      private var §_-n24§:String;
      
      private var §_-w17§:Boolean;
      
      private var §_-x1§:Boolean;
      
      private var §_-I1R§:Boolean;
      
      private var §_-V2U§:Boolean;
      
      private var §_-F26§:String;
      
      private var §_-41t§:Boolean;
      
      private var §_-e10§:Number;
      
      private var §_-J5§:Array;
      
      private var §_-D1L§:Boolean;
      
      private var §_-G1Z§:Boolean;
      
      private var §_-Os§:Rectangle;
      
      private var §_-91o§:Boolean;
      
      private var §_-63F§:Rectangle;
      
      private var §_-32f§:DisplayObjectContainer;
      
      private var §_-d1w§:§_-I2q§;
      
      private var §_-f2o§:§_-81s§;
      
      public function TextField(param1:int, param2:int, param3:String, param4:String = "Verdana", param5:Number = 12, param6:uint = 0, param7:Boolean = false)
      {
         super();
         this.§_-2D§ = param3 ? param3 : "";
         this.§_-r2f§ = param5;
         this.§_-21g§ = param6;
         this.§_-m0§ = §_-U2x§.CENTER;
         this.§_-n24§ = §_-42b§.CENTER;
         this.§_-32f§ = null;
         this.§_-41t§ = true;
         this.§_-e10§ = 0;
         this.§_-w17§ = param7;
         this.§_-F26§ = TextFieldAutoSize.NONE;
         this.§_-63F§ = new Rectangle(0,0,param1,param2);
         this.§_-11j§ = param4;
         addEventListener(Event.§_-g2f§,this.§_-d1L§);
      }
      
      public static function get §_-13C§() : String
      {
         return §_-J13§;
      }
      
      public static function set §_-13C§(param1:String) : void
      {
         §_-J13§ = param1;
      }
      
      public static function §_-d1s§(param1:BitmapFont, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1.name;
         }
         §_-d1k§[§_-OH§(param2)] = param1;
         return param2;
      }
      
      public static function §_-VJ§(param1:String, param2:Boolean = true) : void
      {
         param1 = §_-OH§(param1);
         if(param2 && §_-d1k§[param1] != undefined)
         {
            §_-d1k§[param1].dispose();
         }
         delete §_-d1k§[param1];
      }
      
      public static function §_-vy§(param1:String) : BitmapFont
      {
         return §_-d1k§[§_-OH§(param1)];
      }
      
      private static function get §_-d1k§() : Dictionary
      {
         var _loc1_:Dictionary = Starling.§_-n1s§.§_-wx§[§_-x1C§] as Dictionary;
         if(_loc1_ == null)
         {
            _loc1_ = new Dictionary();
            Starling.§_-n1s§.§_-wx§[§_-x1C§] = _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-OH§(param1:String) : String
      {
         var _loc2_:String = §_-wB§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = param1.toLowerCase();
            §_-wB§[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         removeEventListener(Event.§_-g2f§,this.§_-d1L§);
         if(this.§_-d1w§)
         {
            this.§_-d1w§.texture.dispose();
         }
         if(this.§_-f2o§)
         {
            this.§_-f2o§.dispose();
         }
         super.dispose();
      }
      
      private function §_-d1L§() : void
      {
         if(this.§_-D1L§)
         {
            this.redraw();
         }
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         if(this.§_-D1L§)
         {
            this.redraw();
         }
         super.render(param1,param2);
      }
      
      public function redraw() : void
      {
         if(this.§_-D1L§)
         {
            if(§_-vy§(this.§_-N12§))
            {
               this.§_-V1f§();
            }
            else
            {
               this.§_-c0§();
            }
            this.§_-n2§();
            this.§_-D1L§ = false;
         }
      }
      
      private function §_-c0§() : void
      {
         var format:String;
         var maxTextureSize:int;
         var shrinkHelper:Number;
         var texture:Texture = null;
         var scale:Number = NaN;
         var bitmapData:BitmapData = null;
         if(this.§_-f2o§)
         {
            this.§_-f2o§.removeFromParent(true);
            this.§_-f2o§ = null;
         }
         if(this.§_-Os§ == null)
         {
            this.§_-Os§ = new Rectangle();
         }
         scale = Starling.§_-Cj§;
         bitmapData = this.§_-l2g§(scale,this.§_-Os§);
         format = §_-J13§;
         maxTextureSize = Texture.§_-o1D§;
         shrinkHelper = 0;
         while(bitmapData.width > maxTextureSize || bitmapData.height > maxTextureSize)
         {
            scale *= Math.min((maxTextureSize - shrinkHelper) / bitmapData.width,(maxTextureSize - shrinkHelper) / bitmapData.height);
            bitmapData.dispose();
            bitmapData = this.§_-l2g§(scale,this.§_-Os§);
            shrinkHelper += 1;
         }
         this.§_-63F§.width = bitmapData.width / scale;
         this.§_-63F§.height = bitmapData.height / scale;
         texture = Texture.§_-h2H§(bitmapData,false,false,scale,format);
         texture.root.§_-y1f§ = function():void
         {
            if(§_-Os§ == null)
            {
               §_-Os§ = new Rectangle();
            }
            bitmapData = §_-l2g§(scale,§_-Os§);
            texture.root.§_-YT§(bitmapData);
            bitmapData.dispose();
            bitmapData = null;
         };
         bitmapData.dispose();
         bitmapData = null;
         if(this.§_-d1w§ == null)
         {
            this.§_-d1w§ = new §_-I2q§(texture);
            this.§_-d1w§.touchable = false;
            addChild(this.§_-d1w§);
         }
         else
         {
            this.§_-d1w§.texture.dispose();
            this.§_-d1w§.texture = texture;
            this.§_-d1w§.§_-D25§();
         }
      }
      
      protected function §_-pI§(param1:flash.text.TextField, param2:TextFormat) : void
      {
      }
      
      final protected function §_-D1R§() : void
      {
         this.§_-D1L§ = true;
      }
      
      private function §_-l2g§(param1:Number, param2:Rectangle) : BitmapData
      {
         var _loc3_:Number = this.§_-63F§.width * param1;
         var _loc4_:Number = this.§_-63F§.height * param1;
         var _loc5_:String = this.§_-m0§;
         var _loc6_:String = this.§_-n24§;
         if(this.§_-7f§)
         {
            _loc3_ = int.MAX_VALUE;
            _loc5_ = §_-U2x§.LEFT;
         }
         if(this.§_-ve§)
         {
            _loc4_ = int.MAX_VALUE;
            _loc6_ = §_-42b§.TOP;
         }
         var _loc7_:TextFormat = new TextFormat(this.§_-N12§,this.§_-r2f§ * param1,this.§_-21g§,this.§_-w17§,this.§_-x1§,this.§_-I1R§,null,null,_loc5_);
         _loc7_.kerning = this.§_-41t§;
         _loc7_.leading = this.§_-e10§;
         §_-N2X§.defaultTextFormat = _loc7_;
         §_-N2X§.width = _loc3_;
         §_-N2X§.height = _loc4_;
         §_-N2X§.antiAliasType = AntiAliasType.ADVANCED;
         §_-N2X§.selectable = false;
         §_-N2X§.multiline = true;
         §_-N2X§.wordWrap = true;
         if(this.§_-G1Z§)
         {
            §_-N2X§.htmlText = this.§_-2D§;
         }
         else
         {
            §_-N2X§.text = this.§_-2D§;
         }
         §_-N2X§.embedFonts = true;
         §_-N2X§.filters = this.§_-J5§;
         if(§_-N2X§.textWidth == 0 || §_-N2X§.textHeight == 0)
         {
            §_-N2X§.embedFonts = false;
         }
         this.§_-pI§(§_-N2X§,_loc7_);
         if(this.§_-V2U§)
         {
            this.§_-R2a§(§_-N2X§);
         }
         var _loc8_:Number = §_-N2X§.textWidth;
         var _loc9_:Number = §_-N2X§.textHeight;
         if(this.§_-7f§)
         {
            §_-N2X§.width = _loc3_ = Math.ceil(_loc8_ + 5);
         }
         if(this.§_-ve§)
         {
            §_-N2X§.height = _loc4_ = Math.ceil(_loc9_ + 4);
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
         if(_loc5_ == §_-U2x§.LEFT)
         {
            _loc10_ = 2;
         }
         else if(_loc5_ == §_-U2x§.CENTER)
         {
            _loc10_ = (_loc3_ - _loc8_) / 2;
         }
         else if(_loc5_ == §_-U2x§.RIGHT)
         {
            _loc10_ = _loc3_ - _loc8_ - 2;
         }
         var _loc11_:Number = 0;
         if(_loc6_ == §_-42b§.TOP)
         {
            _loc11_ = 2;
         }
         else if(_loc6_ == §_-42b§.CENTER)
         {
            _loc11_ = (_loc4_ - _loc9_) / 2;
         }
         else if(_loc6_ == §_-42b§.BOTTOM)
         {
            _loc11_ = _loc4_ - _loc9_ - 2;
         }
         var _loc12_:Point = this.§_-xc§(§_-N2X§,_loc5_,_loc6_);
         var _loc13_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         var _loc14_:Matrix = new Matrix(1,0,0,1,_loc12_.x,_loc12_.y + int(_loc11_) - 2);
         var _loc15_:Function = "drawWithQuality" in _loc13_ ? _loc13_["drawWithQuality"] : null;
         if(_loc15_ is Function)
         {
            _loc15_.call(_loc13_,§_-N2X§,_loc14_,null,null,null,false,StageQuality.MEDIUM);
         }
         else
         {
            _loc13_.draw(§_-N2X§,_loc14_);
         }
         §_-N2X§.text = "";
         param2.setTo((_loc10_ + _loc12_.x) / param1,(_loc11_ + _loc12_.y) / param1,_loc8_ / param1,_loc9_ / param1);
         return _loc13_;
      }
      
      private function §_-R2a§(param1:flash.text.TextField) : void
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
            if(this.§_-G1Z§)
            {
               param1.htmlText = this.§_-2D§;
            }
            else
            {
               param1.text = this.§_-2D§;
            }
         }
      }
      
      private function §_-xc§(param1:flash.text.TextField, param2:String, param3:String) : Point
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
            if(param2 == §_-U2x§.LEFT && _loc8_.x < 0)
            {
               _loc4_.x = -_loc8_.x;
            }
            else if(param2 == §_-U2x§.RIGHT && _loc8_.y > 0)
            {
               _loc4_.x = -(_loc8_.right - _loc6_);
            }
            if(param3 == §_-42b§.TOP && _loc8_.y < 0)
            {
               _loc4_.y = -_loc8_.y;
            }
            else if(param3 == §_-42b§.BOTTOM && _loc8_.y > 0)
            {
               _loc4_.y = -(_loc8_.bottom - _loc7_);
            }
         }
         return _loc4_;
      }
      
      private function §_-V1f§() : void
      {
         if(this.§_-d1w§)
         {
            this.§_-d1w§.removeFromParent(true);
            this.§_-d1w§.texture.dispose();
            this.§_-d1w§ = null;
         }
         if(this.§_-f2o§ == null)
         {
            this.§_-f2o§ = new §_-81s§();
            this.§_-f2o§.touchable = false;
            addChild(this.§_-f2o§);
         }
         else
         {
            this.§_-f2o§.reset();
         }
         var _loc1_:BitmapFont = §_-vy§(this.§_-N12§);
         if(_loc1_ == null)
         {
            throw new Error("Bitmap font not registered: " + this.§_-N12§);
         }
         var _loc2_:Number = this.§_-63F§.width;
         var _loc3_:Number = this.§_-63F§.height;
         var _loc4_:String = this.§_-m0§;
         var _loc5_:String = this.§_-n24§;
         if(this.§_-7f§)
         {
            _loc2_ = int.MAX_VALUE;
            _loc4_ = §_-U2x§.LEFT;
         }
         if(this.§_-ve§)
         {
            _loc3_ = int.MAX_VALUE;
            _loc5_ = §_-42b§.TOP;
         }
         _loc1_.§_-Zj§(this.§_-f2o§,_loc2_,_loc3_,this.§_-2D§,this.§_-r2f§,this.§_-21g§,_loc4_,_loc5_,this.§_-V2U§,this.§_-41t§,this.§_-e10§);
         this.§_-f2o§.§_-32r§ = this.§_-91o§;
         if(this.§_-F26§ != TextFieldAutoSize.NONE)
         {
            this.§_-Os§ = this.§_-f2o§.getBounds(this.§_-f2o§,this.§_-Os§);
            if(this.§_-7f§)
            {
               this.§_-63F§.width = this.§_-Os§.x + this.§_-Os§.width;
            }
            if(this.§_-ve§)
            {
               this.§_-63F§.height = this.§_-Os§.y + this.§_-Os§.height;
            }
         }
         else
         {
            this.§_-Os§ = null;
         }
      }
      
      private function §_-n2§() : void
      {
         if(this.§_-32f§ == null)
         {
            return;
         }
         var _loc1_:Number = this.§_-63F§.width;
         var _loc2_:Number = this.§_-63F§.height;
         var _loc3_:§_-V2h§ = this.§_-32f§.getChildAt(0) as §_-V2h§;
         var _loc4_:§_-V2h§ = this.§_-32f§.getChildAt(1) as §_-V2h§;
         var _loc5_:§_-V2h§ = this.§_-32f§.getChildAt(2) as §_-V2h§;
         var _loc6_:§_-V2h§ = this.§_-32f§.getChildAt(3) as §_-V2h§;
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
         _loc3_.color = _loc4_.color = _loc5_.color = _loc6_.color = this.§_-21g§;
      }
      
      private function get §_-7f§() : Boolean
      {
         return this.§_-F26§ == TextFieldAutoSize.HORIZONTAL || this.§_-F26§ == TextFieldAutoSize.§_-V15§;
      }
      
      private function get §_-ve§() : Boolean
      {
         return this.§_-F26§ == TextFieldAutoSize.VERTICAL || this.§_-F26§ == TextFieldAutoSize.§_-V15§;
      }
      
      public function get §_-dA§() : Rectangle
      {
         if(this.§_-D1L§)
         {
            this.redraw();
         }
         if(this.§_-Os§ == null)
         {
            this.§_-Os§ = this.§_-f2o§.getBounds(this.§_-f2o§);
         }
         return this.§_-Os§.clone();
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(this.§_-D1L§)
         {
            this.redraw();
         }
         §_-R1D§(param1,§_-7w§);
         return §_-F2o§.getBounds(this.§_-63F§,§_-7w§,param2);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(this.§_-63F§.containsPoint(param1) && §_-Dz§(param1))
         {
            return this;
         }
         return null;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-63F§.width = param1;
         this.§_-D1L§ = true;
      }
      
      override public function set height(param1:Number) : void
      {
         this.§_-63F§.height = param1;
         this.§_-D1L§ = true;
      }
      
      public function get text() : String
      {
         return this.§_-2D§;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(this.§_-2D§ != param1)
         {
            this.§_-2D§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get §_-11j§() : String
      {
         return this.§_-N12§;
      }
      
      public function set §_-11j§(param1:String) : void
      {
         if(this.§_-N12§ != param1)
         {
            if(param1 == BitmapFont.§_-M23§ && §_-d1k§[param1] == undefined)
            {
               §_-d1s§(new BitmapFont());
            }
            this.§_-N12§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get fontSize() : Number
      {
         return this.§_-r2f§;
      }
      
      public function set fontSize(param1:Number) : void
      {
         if(this.§_-r2f§ != param1)
         {
            this.§_-r2f§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get color() : uint
      {
         return this.§_-21g§;
      }
      
      public function set color(param1:uint) : void
      {
         if(this.§_-21g§ != param1)
         {
            this.§_-21g§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get hAlign() : String
      {
         return this.§_-m0§;
      }
      
      public function set hAlign(param1:String) : void
      {
         if(!§_-U2x§.§_-B2D§(param1))
         {
            throw new ArgumentError("Invalid horizontal align: " + param1);
         }
         if(this.§_-m0§ != param1)
         {
            this.§_-m0§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get vAlign() : String
      {
         return this.§_-n24§;
      }
      
      public function set vAlign(param1:String) : void
      {
         if(!§_-42b§.§_-B2D§(param1))
         {
            throw new ArgumentError("Invalid vertical align: " + param1);
         }
         if(this.§_-n24§ != param1)
         {
            this.§_-n24§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get border() : Boolean
      {
         return this.§_-32f§ != null;
      }
      
      public function set border(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && this.§_-32f§ == null)
         {
            this.§_-32f§ = new Sprite();
            addChild(this.§_-32f§);
            _loc2_ = 0;
            while(_loc2_ < 4)
            {
               this.§_-32f§.addChild(new §_-V2h§(1,1));
               _loc2_++;
            }
            this.§_-n2§();
         }
         else if(!param1 && this.§_-32f§ != null)
         {
            this.§_-32f§.removeFromParent(true);
            this.§_-32f§ = null;
         }
      }
      
      public function get bold() : Boolean
      {
         return this.§_-w17§;
      }
      
      public function set bold(param1:Boolean) : void
      {
         if(this.§_-w17§ != param1)
         {
            this.§_-w17§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get §_-io§() : Boolean
      {
         return this.§_-x1§;
      }
      
      public function set §_-io§(param1:Boolean) : void
      {
         if(this.§_-x1§ != param1)
         {
            this.§_-x1§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get §_-s1r§() : Boolean
      {
         return this.§_-I1R§;
      }
      
      public function set §_-s1r§(param1:Boolean) : void
      {
         if(this.§_-I1R§ != param1)
         {
            this.§_-I1R§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get kerning() : Boolean
      {
         return this.§_-41t§;
      }
      
      public function set kerning(param1:Boolean) : void
      {
         if(this.§_-41t§ != param1)
         {
            this.§_-41t§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get §_-j1n§() : Boolean
      {
         return this.§_-V2U§;
      }
      
      public function set §_-j1n§(param1:Boolean) : void
      {
         if(this.§_-V2U§ != param1)
         {
            this.§_-V2U§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get autoSize() : String
      {
         return this.§_-F26§;
      }
      
      public function set autoSize(param1:String) : void
      {
         if(this.§_-F26§ != param1)
         {
            this.§_-F26§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get §_-32r§() : Boolean
      {
         return this.§_-91o§;
      }
      
      public function set §_-32r§(param1:Boolean) : void
      {
         this.§_-91o§ = param1;
         if(this.§_-f2o§)
         {
            this.§_-f2o§.§_-32r§ = param1;
         }
      }
      
      public function get §_-j1Z§() : Array
      {
         return this.§_-J5§;
      }
      
      public function set §_-j1Z§(param1:Array) : void
      {
         this.§_-J5§ = param1.concat();
         this.§_-D1L§ = true;
      }
      
      public function get §_-sA§() : Boolean
      {
         return this.§_-G1Z§;
      }
      
      public function set §_-sA§(param1:Boolean) : void
      {
         if(this.§_-G1Z§ != param1)
         {
            this.§_-G1Z§ = param1;
            this.§_-D1L§ = true;
         }
      }
      
      public function get leading() : Number
      {
         return this.§_-e10§;
      }
      
      public function set leading(param1:Number) : void
      {
         if(this.§_-e10§ != param1)
         {
            this.§_-e10§ = param1;
            this.§_-D1L§ = true;
         }
      }
   }
}

