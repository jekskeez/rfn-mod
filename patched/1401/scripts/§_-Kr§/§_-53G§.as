package §_-Kr§
{
   import flash.display.CapsStyle;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.JointStyle;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import utils.StringUtil;
   import utils.§_-vo§;
   
   public class §_-53G§ extends Sprite
   {
      
      private static const §_-kI§:int = 22;
      
      private static const §_-XD§:int = 20;
      
      private static const PAD:int = 6;
      
      private static const §_-c1F§:int = 3;
      
      private static const §_-o1R§:int = 20;
      
      private static const §_-62d§:int = 2;
      
      private static const §_-qA§:int = 8;
      
      private static const §_-D1Y§:int = 16;
      
      private static const §_-b29§:int = 44;
      
      private static const §_-01W§:int = 30;
      
      private static const §_-uW§:int = 10;
      
      private static const §_-p2L§:int = 22;
      
      private static const §_-E2F§:int = 85;
      
      private static const §_-Cx§:int = 27;
      
      private static const §_-72r§:int = 8;
      
      private static const §_-T1B§:int = 4;
      
      private static const §_-B1f§:uint = 14996402;
      
      private static const SELECT:uint = 6175017;
      
      private static var §_-u1x§:§_-53G§;
      
      public static const §_-T2G§:Array = [16777215,15263976,11579568,7368816,4210752,0,16775395,6175017,16711680,16734778,16737792,16750848,16763904,16776960,16743982,15900416,26367,2520009,255,6727423,52479,65484,6697932,15689471,55607,3368499,9127187,16711833,14221491,16763135,14674432,7395584];
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,6175017);
      
      private static var §_-v1p§:Vector.<uint> = new Vector.<uint>();
      
      private var _width:int;
      
      private var selected:uint = 16777215;
      
      private var preview:uint = 16777215;
      
      private var §_-Uf§:int = 0;
      
      private var §_-J18§:int;
      
      private var §_-63U§:SimpleButton;
      
      private var §_-z1e§:Sprite;
      
      private var §_-I1N§:Sprite;
      
      private var §_-q2z§:Sprite;
      
      private var §_-L2h§:Sprite;
      
      private var §_-T2d§:Sprite;
      
      private var §_-211§:§_-22V§;
      
      private var arrow:Sprite;
      
      private var §_-B§:Sprite;
      
      private var §_-92d§:Sprite;
      
      private var §_-X2Y§:Sprite;
      
      private var §_-u2G§:Sprite;
      
      private var §_-ER§:§_-22V§;
      
      private var §_-s2S§:§_-22V§;
      
      private var §_-IX§:Sprite;
      
      private var §_-i18§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-w9§:TextField;
      
      private var §_-T1S§:TextField;
      
      private var §_-d2T§:TextField;
      
      private var §_-x2Y§:TextField;
      
      private var §_-M1N§:ScrollPane;
      
      private var §_-13N§:Boolean;
      
      private var §_-02L§:Boolean;
      
      public function §_-53G§(param1:int = 0)
      {
         super();
         this._width = param1 > 0 ? param1 : §_-xM§();
         this.preview = this.selected;
         this.§_-Uf§ = this.§_-sV§(this.selected);
         this.init();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§);
      }
      
      public static function §_-y1j§() : void
      {
         if(§_-u1x§)
         {
            §_-u1x§.close();
         }
      }
      
      private static function §_-xM§() : int
      {
         return §_-qA§ * §_-o1R§ + (§_-qA§ - 1) * §_-62d§ + PAD * 2;
      }
      
      private static function §_-Be§() : int
      {
         return int((§_-T2G§.length + §_-qA§ - 1) / §_-qA§) * (§_-o1R§ + §_-62d§) - §_-62d§;
      }
      
      private static function §_-lA§(param1:Graphics, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.lineStyle(1,§_-B1f§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         param1.moveTo(param2,param3);
         param1.lineTo(param4,param5);
      }
      
      private static function §_-J2S§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2 + §_-c1F§,param3);
         param1.lineTo(param2 + param4 - §_-c1F§,param3);
         param1.curveTo(param2 + param4,param3,param2 + param4,param3 + §_-c1F§);
         param1.lineTo(param2 + param4,param3 + param5);
         param1.lineTo(param2,param3 + param5);
         param1.lineTo(param2,param3 + §_-c1F§);
         param1.curveTo(param2,param3,param2 + §_-c1F§,param3);
      }
      
      private static function §_-23K§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2,param3);
         param1.lineTo(param2 + param4,param3);
         param1.lineTo(param2 + param4,param3 + param5 - §_-c1F§);
         param1.curveTo(param2 + param4,param3 + param5,param2 + param4 - §_-c1F§,param3 + param5);
         param1.lineTo(param2 + §_-c1F§,param3 + param5);
         param1.curveTo(param2,param3 + param5,param2,param3 + param5 - §_-c1F§);
         param1.lineTo(param2,param3);
      }
      
      private static function §_-t1k§(param1:uint) : String
      {
         var _loc2_:String = (param1 & 0xFFFFFF).toString(16).toUpperCase();
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "#" + _loc2_;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return §_-kI§;
      }
      
      public function get §_-P1u§() : uint
      {
         return this.selected;
      }
      
      public function set §_-P1u§(param1:uint) : void
      {
         this.selected = param1 & 0xFFFFFF;
         this.preview = this.selected;
         this.§_-Uf§ = this.§_-sV§(this.selected);
         if(this.§_-zj§(this.selected))
         {
            this.§_-A1s§();
         }
         this.§_-LF§();
      }
      
      public function get enabled() : Boolean
      {
         return this.mouseEnabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.mouseEnabled = this.mouseChildren = param1;
         this.alpha = param1 ? 1 : 0.5;
      }
      
      public function dispose() : void
      {
         this.close();
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§);
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§);
         }
         this.§_-U10§();
         this.§_-13v§();
         this.§_-B§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-53m§);
         this.§_-B§.removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-l2a§);
         this.§_-63U§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-f2p§);
         this.§_-QV§(this.§_-w9§);
         this.§_-QV§(this.§_-T1S§);
         this.§_-QV§(this.§_-d2T§);
         this.§_-QV§(this.§_-x2Y§);
         if(this.§_-B§.parent)
         {
            this.§_-B§.parent.removeChild(this.§_-B§);
         }
      }
      
      private function init() : void
      {
         this.§_-z1e§ = this.§_-B3u§(16777215,false);
         this.§_-I1N§ = this.§_-B3u§(16775395,false);
         this.§_-q2z§ = this.§_-B3u§(16777215,true);
         this.§_-L2h§ = this.§_-B3u§(16775395,true);
         this.§_-63U§ = new SimpleButton();
         this.§_-Tj§();
         this.§_-63U§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-f2p§);
         addChild(this.§_-63U§);
         this.§_-T2d§ = new Sprite();
         this.§_-T2d§.x = 4;
         this.§_-T2d§.y = 3;
         this.§_-T2d§.mouseEnabled = false;
         addChild(this.§_-T2d§);
         this.§_-211§ = new §_-22V§("",24,2,§_-i2c§,this._width - 42);
         this.§_-211§.mouseEnabled = false;
         addChild(this.§_-211§);
         this.arrow = this.§_-Y1G§();
         this.arrow.x = this._width - 18;
         this.arrow.y = 9;
         addChild(this.arrow);
         this.§_-B§ = new Sprite();
         this.§_-B§.visible = false;
         this.§_-B§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-53m§);
         this.§_-B§.addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-l2a§,false,0,true);
         this.§_-92d§ = new Sprite();
         this.§_-92d§.x = PAD;
         this.§_-92d§.y = PAD;
         this.§_-B§.addChild(this.§_-92d§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-T2G§.length)
         {
            this.§_-Z2M§(§_-T2G§[_loc1_],_loc1_,false,this.§_-92d§);
            _loc1_++;
         }
         this.§_-X2Y§ = new Sprite();
         this.§_-X2Y§.x = PAD;
         this.§_-B§.addChild(this.§_-X2Y§);
         this.§_-IX§ = new Sprite();
         §_-lA§(this.§_-IX§.graphics,PAD,0,this._width - PAD,0);
         this.§_-IX§.mouseEnabled = false;
         this.§_-B§.addChild(this.§_-IX§);
         this.§_-ER§ = new §_-22V§("HTML:",0,0,§_-i2c§);
         this.§_-ER§.mouseEnabled = false;
         this.§_-B§.addChild(this.§_-ER§);
         this.§_-s2S§ = new §_-22V§("RGB:",0,0,§_-i2c§);
         this.§_-s2S§.mouseEnabled = false;
         this.§_-B§.addChild(this.§_-s2S§);
         var _loc2_:int = PAD + §_-01W§ + §_-uW§;
         this.§_-w9§ = this.§_-316§(this.§_-B§,§_-E2F§,_loc2_,0,"0-9A-Fa-f#",7);
         this.§_-T1S§ = this.§_-316§(this.§_-B§,§_-Cx§,_loc2_,0);
         this.§_-d2T§ = this.§_-316§(this.§_-B§,§_-Cx§,0,0);
         this.§_-x2Y§ = this.§_-316§(this.§_-B§,§_-Cx§,0,0);
         this.§_-u2G§ = new Sprite();
         this.§_-u2G§.mouseEnabled = false;
         this.§_-B§.addChild(this.§_-u2G§);
         this.§_-A1s§();
         this.§_-LF§();
      }
      
      private function §_-A1s§() : void
      {
         this.§_-Uf§ = this.§_-sV§(this.selected);
         while(this.§_-X2Y§.numChildren)
         {
            this.§_-X2Y§.removeChildAt(0);
         }
         var _loc1_:* = int(this.§_-i18§.length - 1);
         while(_loc1_ >= §_-T2G§.length)
         {
            this.§_-r2b§(this.§_-i18§[_loc1_]);
            this.§_-i18§.splice(_loc1_,1);
            _loc1_--;
         }
         this.§_-X2Y§.y = PAD + §_-Be§() + (§_-v1p§.length ? §_-T1B§ : 0);
         _loc1_ = 0;
         while(_loc1_ < §_-v1p§.length)
         {
            this.§_-Z2M§(§_-v1p§[_loc1_],§_-T2G§.length + _loc1_,true,this.§_-X2Y§,_loc1_ * (§_-o1R§ + §_-62d§),0);
            _loc1_++;
         }
         this.§_-XP§();
         this.§_-J18§ = this.§_-HO§() + §_-XD§ + PAD;
         this.§_-QU§();
         if(this.§_-02L§)
         {
            this.§_-53L§();
         }
      }
      
      private function §_-XP§() : void
      {
         var _loc1_:int = this.§_-g2w§() + 8;
         var _loc2_:int = _loc1_ + §_-p2L§;
         var _loc3_:int = PAD + §_-01W§ + §_-uW§;
         this.§_-IX§.y = _loc1_ - 4;
         this.§_-ER§.x = PAD;
         this.§_-ER§.y = _loc1_ + 1;
         this.§_-w9§.x = _loc3_;
         this.§_-w9§.y = _loc1_;
         this.§_-s2S§.x = PAD;
         this.§_-s2S§.y = _loc2_ + 1;
         this.§_-T1S§.x = _loc3_;
         this.§_-T1S§.y = _loc2_;
         this.§_-d2T§.x = this.§_-T1S§.x + §_-Cx§ + §_-62d§;
         this.§_-d2T§.y = _loc2_;
         this.§_-x2Y§.x = this.§_-d2T§.x + §_-Cx§ + §_-62d§;
         this.§_-x2Y§.y = _loc2_;
         this.§_-u2G§.x = this._width - PAD - §_-b29§;
         this.§_-u2G§.y = _loc1_;
      }
      
      private function §_-Z2M§(param1:uint, param2:int, param3:Boolean, param4:Sprite, param5:Number = NaN, param6:Number = NaN) : void
      {
         if(isNaN(param5))
         {
            param5 = param2 % §_-qA§ * (§_-o1R§ + §_-62d§);
            param6 = int(param2 / §_-qA§) * (§_-o1R§ + §_-62d§);
         }
         var _loc7_:Sprite = new Sprite();
         _loc7_.name = param2.toString();
         _loc7_.x = param5;
         _loc7_.y = param6;
         var _loc8_:Sprite = new Sprite();
         _loc8_.graphics.lineStyle(1,§_-B1f§);
         _loc8_.graphics.beginFill(param1);
         _loc8_.graphics.drawRect(0,0,§_-o1R§,§_-o1R§);
         _loc8_.graphics.endFill();
         _loc7_.addChild(_loc8_);
         var _loc9_:Sprite = new Sprite();
         _loc9_.name = "mark";
         _loc9_.mouseEnabled = false;
         _loc9_.mouseChildren = false;
         _loc7_.addChild(_loc9_);
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-621§);
         _loc7_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-E1E§);
         if(param3)
         {
            _loc7_.doubleClickEnabled = true;
            _loc7_.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-z13§);
         }
         param4.addChild(_loc7_);
         this.§_-i18§.push(_loc7_);
         this.§_-H1s§(_loc9_,param2 == this.§_-Uf§);
      }
      
      private function §_-316§(param1:Sprite, param2:int, param3:int, param4:int, param5:String = "0-9", param6:int = 3) : TextField
      {
         var _loc7_:TextField = new TextField();
         _loc7_.width = param2;
         _loc7_.height = §_-XD§;
         _loc7_.background = true;
         _loc7_.border = true;
         _loc7_.type = TextFieldType.INPUT;
         _loc7_.restrict = param5;
         _loc7_.maxChars = param6;
         _loc7_.x = param3;
         _loc7_.y = param4;
         §_-vo§.embedFonts(_loc7_);
         _loc7_.defaultTextFormat = §_-i2c§;
         _loc7_.addEventListener(FocusEvent.FOCUS_OUT,this.§_-V1t§);
         _loc7_.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-qq§);
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      private function §_-QV§(param1:TextField) : void
      {
         param1.removeEventListener(FocusEvent.FOCUS_OUT,this.§_-V1t§);
         param1.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-qq§);
      }
      
      private function §_-sV§(param1:uint) : int
      {
         param1 &= 16777215;
         var _loc2_:int = 0;
         while(_loc2_ < §_-T2G§.length)
         {
            if(§_-T2G§[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-v1p§.length)
         {
            if(§_-v1p§[_loc2_] == param1)
            {
               return §_-T2G§.length + _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private function §_-O2Q§(param1:int) : int
      {
         if(param1 < 0)
         {
            return -1;
         }
         if(param1 < §_-T2G§.length)
         {
            return §_-T2G§[param1];
         }
         param1 -= §_-T2G§.length;
         return param1 < §_-v1p§.length ? int(§_-v1p§[param1]) : -1;
      }
      
      private function §_-zj§(param1:uint) : Boolean
      {
         if(this.§_-sV§(param1) >= 0)
         {
            return false;
         }
         if(§_-v1p§.length >= §_-72r§)
         {
            §_-v1p§.shift();
         }
         §_-v1p§.push(param1 & 0xFFFFFF);
         return true;
      }
      
      private function §_-LF§() : void
      {
         this.§_-YO§(this.§_-T2d§,§_-D1Y§,this.selected);
         this.§_-211§.text = §_-t1k§(this.selected);
         this.§_-w9§.text = §_-t1k§(this.selected);
         this.§_-T1S§.text = (this.selected >> 16 & 0xFF).toString();
         this.§_-d2T§.text = (this.selected >> 8 & 0xFF).toString();
         this.§_-x2Y§.text = (this.selected & 0xFF).toString();
         this.§_-91Q§();
         this.§_-B3P§();
      }
      
      private function §_-B3P§() : void
      {
         this.§_-YO§(this.§_-u2G§,§_-b29§,this.§_-02L§ ? this.preview : this.selected);
      }
      
      private function §_-91Q§() : void
      {
         var _loc1_:Sprite = null;
         for each(_loc1_ in this.§_-i18§)
         {
            this.§_-H1s§(_loc1_.getChildByName("mark") as Sprite,int(_loc1_.name) == this.§_-Uf§);
         }
      }
      
      private function §_-H1s§(param1:Sprite, param2:Boolean) : void
      {
         if(!param1)
         {
            return;
         }
         param1.graphics.clear();
         if(!param2)
         {
            return;
         }
         param1.graphics.lineStyle(2,SELECT);
         param1.graphics.drawRect(0,0,§_-o1R§,§_-o1R§);
      }
      
      private function §_-YO§(param1:Sprite, param2:int, param3:uint) : void
      {
         param1.graphics.clear();
         param1.graphics.lineStyle(1,§_-B1f§);
         param1.graphics.beginFill(param3);
         param1.graphics.drawRect(0,0,param2,param2);
         param1.graphics.endFill();
      }
      
      private function §_-015§(param1:uint, param2:int) : void
      {
         this.selected = param1 & 0xFFFFFF;
         this.preview = this.selected;
         this.§_-Uf§ = param2 >= 0 ? param2 : this.§_-sV§(this.selected);
         this.§_-LF§();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-11g§(param1:TextField) : int
      {
         if(param1 == this.§_-w9§)
         {
            return StringUtil.§_-C1R§(this.§_-w9§.text);
         }
         return this.§_-w1i§();
      }
      
      private function §_-w1i§() : int
      {
         var _loc1_:int = this.clamp(int(this.§_-T1S§.text));
         var _loc2_:int = this.clamp(int(this.§_-d2T§.text));
         var _loc3_:int = this.clamp(int(this.§_-x2Y§.text));
         return _loc1_ << 16 | _loc2_ << 8 | _loc3_;
      }
      
      private function clamp(param1:int) : int
      {
         if(isNaN(param1) || param1 < 0)
         {
            return 0;
         }
         return param1 > 255 ? 255 : param1;
      }
      
      private function §_-wm§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§,false,0,true);
      }
      
      private function §_-h2j§(param1:Event) : void
      {
         this.close();
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-q1k§);
         }
      }
      
      private function §_-f2p§(param1:MouseEvent) : void
      {
         param1.preventDefault();
         param1.stopPropagation();
         if(this.§_-02L§)
         {
            this.close();
         }
         else
         {
            this.§_-R4§();
         }
      }
      
      private function §_-53m§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function §_-l2a§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         param1.preventDefault();
      }
      
      private function §_-621§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:int = this.§_-O2Q§(_loc2_);
         if(_loc3_ < 0)
         {
            return;
         }
         this.§_-015§(_loc3_,_loc2_);
         this.close();
      }
      
      private function §_-z13§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int(param1.currentTarget.name) - §_-T2G§.length;
         if(_loc2_ < 0 || _loc2_ >= §_-v1p§.length)
         {
            return;
         }
         §_-v1p§.splice(_loc2_,1);
         this.§_-A1s§();
      }
      
      private function §_-E1E§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-O2Q§(int(param1.currentTarget.name));
         if(_loc2_ < 0)
         {
            return;
         }
         this.preview = _loc2_;
         this.§_-B3P§();
      }
      
      private function §_-V1t§(param1:FocusEvent) : void
      {
         this.§_-32p§(param1.currentTarget as TextField);
      }
      
      private function §_-qq§(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.§_-32p§(param1.currentTarget as TextField);
         }
      }
      
      private function §_-32p§(param1:TextField) : void
      {
         var _loc2_:int = this.§_-11g§(param1);
         if(_loc2_ < 0)
         {
            this.§_-LF§();
            return;
         }
         _loc2_ &= 16777215;
         if(_loc2_ == this.selected)
         {
            return;
         }
         if(this.§_-zj§(_loc2_))
         {
            this.§_-A1s§();
         }
         this.§_-015§(_loc2_,this.§_-sV§(_loc2_));
      }
      
      private function §_-q1k§(param1:MouseEvent) : void
      {
         if(!this.§_-02L§)
         {
            return;
         }
         if(!hitTestPoint(param1.stageX,param1.stageY,true) && !this.§_-B§.hitTestPoint(param1.stageX,param1.stageY,true))
         {
            this.close();
         }
      }
      
      private function §_-R4§() : void
      {
         if(Boolean(§_-u1x§) && §_-u1x§ != this)
         {
            §_-u1x§.close();
         }
         §_-u1x§ = this;
         this.§_-02L§ = true;
         this.preview = this.selected;
         this.§_-A1s§();
         this.§_-B§.visible = true;
         this.§_-Tj§();
         this.arrow.scaleY = -1;
         this.arrow.y = 14;
         this.§_-LF§();
         this.§_-E15§();
         this.§_-Pz§();
      }
      
      private function close() : void
      {
         if(!this.§_-02L§)
         {
            return;
         }
         this.§_-02L§ = false;
         this.preview = this.selected;
         this.§_-B§.visible = false;
         this.§_-n1c§();
         this.§_-Tj§();
         this.arrow.scaleY = 1;
         this.arrow.y = 9;
         this.§_-B3P§();
         if(§_-u1x§ == this)
         {
            §_-u1x§ = null;
         }
      }
      
      private function §_-Pz§() : void
      {
         if(!this.stage || this.§_-13N§)
         {
            return;
         }
         var _loc1_:DisplayObjectContainer = this.§_-e2q§();
         if(Boolean(this.§_-B§.parent) && this.§_-B§.parent != _loc1_)
         {
            this.§_-B§.parent.removeChild(this.§_-B§);
         }
         _loc1_.addChild(this.§_-B§);
         this.§_-13N§ = true;
         this.§_-33X§();
         this.§_-53L§();
      }
      
      private function §_-n1c§() : void
      {
         if(!this.§_-13N§)
         {
            return;
         }
         if(this.§_-B§.parent)
         {
            this.§_-B§.parent.removeChild(this.§_-B§);
         }
         this.§_-13N§ = false;
         this.§_-U10§();
      }
      
      private function §_-e2q§() : DisplayObjectContainer
      {
         if(Boolean(Game.§_-d2t§) && this.§_-12V§(Game.§_-d2t§))
         {
            return Game.§_-d2t§;
         }
         return this.stage;
      }
      
      private function §_-12V§(param1:DisplayObjectContainer) : Boolean
      {
         var _loc2_:DisplayObject = this;
         while(_loc2_)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.parent;
         }
         return false;
      }
      
      private function §_-33X§() : void
      {
         this.§_-U10§();
         var _loc1_:DisplayObjectContainer = this.parent;
         while(_loc1_)
         {
            if(_loc1_ is ScrollPane)
            {
               this.§_-M1N§ = _loc1_ as ScrollPane;
               this.§_-M1N§.addEventListener(Event.CHANGE,this.§_-yb§,false,0,true);
               break;
            }
            _loc1_ = _loc1_.parent;
         }
      }
      
      private function §_-U10§() : void
      {
         if(!this.§_-M1N§)
         {
            return;
         }
         this.§_-M1N§.removeEventListener(Event.CHANGE,this.§_-yb§);
         this.§_-M1N§ = null;
      }
      
      private function §_-yb§(param1:Event) : void
      {
         if(!this.§_-02L§)
         {
            return;
         }
         if(!this.§_-QE§())
         {
            this.close();
            return;
         }
         this.§_-53L§();
      }
      
      private function §_-QE§() : Boolean
      {
         if(!this.§_-M1N§ || !this.stage)
         {
            return true;
         }
         var _loc1_:Rectangle = getBounds(this.stage);
         var _loc2_:Point = this.§_-M1N§.localToGlobal(new Point(0,0));
         var _loc3_:Rectangle = new Rectangle(_loc2_.x,_loc2_.y,this.§_-M1N§.width,this.§_-M1N§.height);
         return _loc3_.intersects(_loc1_);
      }
      
      private function §_-53L§() : void
      {
         if(!this.§_-13N§)
         {
            return;
         }
         var _loc1_:DisplayObjectContainer = this.§_-B§.parent;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Point = _loc1_.globalToLocal(localToGlobal(new Point(0,§_-kI§)));
         var _loc3_:Point = _loc1_.globalToLocal(localToGlobal(new Point(0,0)));
         var _loc4_:Number = _loc1_ == Game.§_-d2t§ ? GameMap.§_-P1Q§ : this.stage.stageHeight;
         var _loc5_:Boolean = _loc2_.y + this.§_-J18§ <= _loc4_ || _loc3_.y < this.§_-J18§;
         this.§_-B§.x = _loc5_ ? _loc2_.x : _loc3_.x;
         this.§_-B§.y = _loc5_ ? _loc2_.y : _loc3_.y - this.§_-J18§;
         _loc1_.setChildIndex(this.§_-B§,_loc1_.numChildren - 1);
      }
      
      private function §_-E15§() : void
      {
         var _loc1_:DisplayObjectContainer = this.parent as DisplayObjectContainer;
         while(_loc1_)
         {
            if(_loc1_.parent)
            {
               _loc1_.parent.setChildIndex(_loc1_,_loc1_.parent.numChildren - 1);
            }
            _loc1_ = _loc1_.parent as DisplayObjectContainer;
         }
      }
      
      private function §_-QU§() : void
      {
         this.§_-B§.graphics.clear();
         this.§_-B§.graphics.beginFill(16777215);
         this.§_-B§.graphics.lineStyle(1,§_-B1f§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         §_-23K§(this.§_-B§.graphics,0,0,this._width,this.§_-J18§);
         this.§_-B§.graphics.endFill();
      }
      
      private function §_-Tj§() : void
      {
         if(this.§_-02L§)
         {
            this.§_-63U§.upState = this.§_-q2z§;
            this.§_-63U§.overState = this.§_-L2h§;
            this.§_-63U§.downState = this.§_-L2h§;
            this.§_-63U§.hitTestState = this.§_-q2z§;
         }
         else
         {
            this.§_-63U§.upState = this.§_-z1e§;
            this.§_-63U§.overState = this.§_-I1N§;
            this.§_-63U§.downState = this.§_-I1N§;
            this.§_-63U§.hitTestState = this.§_-z1e§;
         }
      }
      
      private function §_-r2b§(param1:Sprite) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.§_-621§);
         param1.removeEventListener(MouseEvent.MOUSE_OVER,this.§_-E1E§);
         if(int(param1.name) >= §_-T2G§.length)
         {
            param1.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§_-z13§);
         }
      }
      
      private function §_-13v§() : void
      {
         var _loc1_:Sprite = null;
         for each(_loc1_ in this.§_-i18§)
         {
            this.§_-r2b§(_loc1_);
         }
         this.§_-i18§.length = 0;
      }
      
      private function §_-g2w§() : int
      {
         var _loc1_:int = PAD + §_-Be§();
         if(§_-v1p§.length)
         {
            _loc1_ += §_-T1B§ + §_-o1R§;
         }
         return _loc1_;
      }
      
      private function §_-HO§() : int
      {
         return this.§_-g2w§() + 8 + §_-p2L§;
      }
      
      private function §_-B3u§(param1:uint, param2:Boolean) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.lineStyle(1,§_-B1f§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         if(param2)
         {
            §_-J2S§(_loc3_.graphics,0,0,this._width,§_-kI§);
         }
         else
         {
            _loc3_.graphics.drawRoundRect(0,0,this._width,§_-kI§,§_-c1F§ * 2,§_-c1F§ * 2);
         }
         _loc3_.graphics.endFill();
         return _loc3_;
      }
      
      private function §_-Y1G§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(SELECT);
         _loc1_.graphics.moveTo(0,0);
         _loc1_.graphics.lineTo(6,6);
         _loc1_.graphics.lineTo(12,0);
         _loc1_.graphics.endFill();
         _loc1_.mouseEnabled = false;
         return _loc1_;
      }
   }
}

