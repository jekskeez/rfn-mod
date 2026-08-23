package §_-B1G§
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
   import utils.§_-L2J§;
   
   public class §_-mD§ extends Sprite
   {
      
      private static const §_-i2u§:int = 22;
      
      private static const §_-U2a§:int = 20;
      
      private static const PAD:int = 6;
      
      private static const §_-A2L§:int = 3;
      
      private static const §_-kt§:int = 20;
      
      private static const §_-OP§:int = 2;
      
      private static const §_-D1q§:int = 8;
      
      private static const §_-Dw§:int = 16;
      
      private static const §_-d1x§:int = 44;
      
      private static const §_-Mw§:int = 30;
      
      private static const §_-Wc§:int = 10;
      
      private static const §_-j2k§:int = 22;
      
      private static const §_-61e§:int = 85;
      
      private static const §_-a1N§:int = 27;
      
      private static const §_-8W§:int = 8;
      
      private static const §_-x2E§:int = 4;
      
      private static const §_-t24§:uint = 14996402;
      
      private static const SELECT:uint = 6175017;
      
      private static var §_-91z§:§_-mD§;
      
      public static const §_-bM§:Array = [16777215,15263976,11579568,7368816,4210752,0,16775395,6175017,16711680,16734778,16737792,16750848,16763904,16776960,16743982,15900416,26367,2520009,255,6727423,52479,65484,6697932,15689471,55607,3368499,9127187,16711833,14221491,16763135,14674432,7395584];
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017);
      
      private static var §_-F2X§:Vector.<uint> = new Vector.<uint>();
      
      private var _width:int;
      
      private var selected:uint = 16777215;
      
      private var preview:uint = 16777215;
      
      private var §_-JZ§:int = 0;
      
      private var §_-n1U§:int;
      
      private var §_-n1z§:SimpleButton;
      
      private var §_-PO§:Sprite;
      
      private var §_-Q1§:Sprite;
      
      private var §_-t2s§:Sprite;
      
      private var §_-83I§:Sprite;
      
      private var §_-6X§:Sprite;
      
      private var §_-vm§:§_-i5§;
      
      private var arrow:Sprite;
      
      private var §_-B2§:Sprite;
      
      private var §_-31z§:Sprite;
      
      private var §_-nB§:Sprite;
      
      private var §_-jM§:Sprite;
      
      private var §_-pF§:§_-i5§;
      
      private var §_-m10§:§_-i5§;
      
      private var §_-X25§:Sprite;
      
      private var §_-jr§:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var §_-N2h§:TextField;
      
      private var §_-O8§:TextField;
      
      private var §_-Ul§:TextField;
      
      private var §_-E10§:TextField;
      
      private var §_-W18§:ScrollPane;
      
      private var §_-q1n§:Boolean;
      
      private var §_-82H§:Boolean;
      
      public function §_-mD§(param1:int = 0)
      {
         super();
         this._width = param1 > 0 ? param1 : §_-H2y§();
         this.preview = this.selected;
         this.§_-JZ§ = this.§_-32X§(this.selected);
         this.init();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§);
      }
      
      public static function §_-E1f§() : void
      {
         if(§_-91z§)
         {
            §_-91z§.close();
         }
      }
      
      private static function §_-H2y§() : int
      {
         return §_-D1q§ * §_-kt§ + (§_-D1q§ - 1) * §_-OP§ + PAD * 2;
      }
      
      private static function §_-62§() : int
      {
         return int((§_-bM§.length + §_-D1q§ - 1) / §_-D1q§) * (§_-kt§ + §_-OP§) - §_-OP§;
      }
      
      private static function §_-B1E§(param1:Graphics, param2:int, param3:int, param4:int, param5:int) : void
      {
         param1.lineStyle(1,§_-t24§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         param1.moveTo(param2,param3);
         param1.lineTo(param4,param5);
      }
      
      private static function §_-7m§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2 + §_-A2L§,param3);
         param1.lineTo(param2 + param4 - §_-A2L§,param3);
         param1.curveTo(param2 + param4,param3,param2 + param4,param3 + §_-A2L§);
         param1.lineTo(param2 + param4,param3 + param5);
         param1.lineTo(param2,param3 + param5);
         param1.lineTo(param2,param3 + §_-A2L§);
         param1.curveTo(param2,param3,param2 + §_-A2L§,param3);
      }
      
      private static function §_-gp§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2,param3);
         param1.lineTo(param2 + param4,param3);
         param1.lineTo(param2 + param4,param3 + param5 - §_-A2L§);
         param1.curveTo(param2 + param4,param3 + param5,param2 + param4 - §_-A2L§,param3 + param5);
         param1.lineTo(param2 + §_-A2L§,param3 + param5);
         param1.curveTo(param2,param3 + param5,param2,param3 + param5 - §_-A2L§);
         param1.lineTo(param2,param3);
      }
      
      private static function §_-K2w§(param1:uint) : String
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
         return §_-i2u§;
      }
      
      public function get §_-u2l§() : uint
      {
         return this.selected;
      }
      
      public function set §_-u2l§(param1:uint) : void
      {
         this.selected = param1 & 0xFFFFFF;
         this.preview = this.selected;
         this.§_-JZ§ = this.§_-32X§(this.selected);
         if(this.§_-y1w§(this.selected))
         {
            this.§_-03n§();
         }
         this.§_-q1r§();
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
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§);
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§);
         }
         this.§_-e2N§();
         this.§_-z1p§();
         this.§_-B2§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-22o§);
         this.§_-B2§.removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-U2t§);
         this.§_-n1z§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-p2m§);
         this.§_-N2W§(this.§_-N2h§);
         this.§_-N2W§(this.§_-O8§);
         this.§_-N2W§(this.§_-Ul§);
         this.§_-N2W§(this.§_-E10§);
         if(this.§_-B2§.parent)
         {
            this.§_-B2§.parent.removeChild(this.§_-B2§);
         }
      }
      
      private function init() : void
      {
         this.§_-PO§ = this.§_-w7§(16777215,false);
         this.§_-Q1§ = this.§_-w7§(16775395,false);
         this.§_-t2s§ = this.§_-w7§(16777215,true);
         this.§_-83I§ = this.§_-w7§(16775395,true);
         this.§_-n1z§ = new SimpleButton();
         this.§_-4A§();
         this.§_-n1z§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-p2m§);
         addChild(this.§_-n1z§);
         this.§_-6X§ = new Sprite();
         this.§_-6X§.x = 4;
         this.§_-6X§.y = 3;
         this.§_-6X§.mouseEnabled = false;
         addChild(this.§_-6X§);
         this.§_-vm§ = new §_-i5§("",24,2,§_-W2P§,this._width - 42);
         this.§_-vm§.mouseEnabled = false;
         addChild(this.§_-vm§);
         this.arrow = this.§_-42G§();
         this.arrow.x = this._width - 18;
         this.arrow.y = 9;
         addChild(this.arrow);
         this.§_-B2§ = new Sprite();
         this.§_-B2§.visible = false;
         this.§_-B2§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-22o§);
         this.§_-B2§.addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-U2t§,false,0,true);
         this.§_-31z§ = new Sprite();
         this.§_-31z§.x = PAD;
         this.§_-31z§.y = PAD;
         this.§_-B2§.addChild(this.§_-31z§);
         var _loc1_:int = 0;
         while(_loc1_ < §_-bM§.length)
         {
            this.§_-t1x§(§_-bM§[_loc1_],_loc1_,false,this.§_-31z§);
            _loc1_++;
         }
         this.§_-nB§ = new Sprite();
         this.§_-nB§.x = PAD;
         this.§_-B2§.addChild(this.§_-nB§);
         this.§_-X25§ = new Sprite();
         §_-B1E§(this.§_-X25§.graphics,PAD,0,this._width - PAD,0);
         this.§_-X25§.mouseEnabled = false;
         this.§_-B2§.addChild(this.§_-X25§);
         this.§_-pF§ = new §_-i5§("HTML:",0,0,§_-W2P§);
         this.§_-pF§.mouseEnabled = false;
         this.§_-B2§.addChild(this.§_-pF§);
         this.§_-m10§ = new §_-i5§("RGB:",0,0,§_-W2P§);
         this.§_-m10§.mouseEnabled = false;
         this.§_-B2§.addChild(this.§_-m10§);
         var _loc2_:int = PAD + §_-Mw§ + §_-Wc§;
         this.§_-N2h§ = this.§_-93h§(this.§_-B2§,§_-61e§,_loc2_,0,"0-9A-Fa-f#",7);
         this.§_-O8§ = this.§_-93h§(this.§_-B2§,§_-a1N§,_loc2_,0);
         this.§_-Ul§ = this.§_-93h§(this.§_-B2§,§_-a1N§,0,0);
         this.§_-E10§ = this.§_-93h§(this.§_-B2§,§_-a1N§,0,0);
         this.§_-jM§ = new Sprite();
         this.§_-jM§.mouseEnabled = false;
         this.§_-B2§.addChild(this.§_-jM§);
         this.§_-03n§();
         this.§_-q1r§();
      }
      
      private function §_-03n§() : void
      {
         this.§_-JZ§ = this.§_-32X§(this.selected);
         while(this.§_-nB§.numChildren)
         {
            this.§_-nB§.removeChildAt(0);
         }
         var _loc1_:* = int(this.§_-jr§.length - 1);
         while(_loc1_ >= §_-bM§.length)
         {
            this.§_-C2x§(this.§_-jr§[_loc1_]);
            this.§_-jr§.splice(_loc1_,1);
            _loc1_--;
         }
         this.§_-nB§.y = PAD + §_-62§() + (§_-F2X§.length ? §_-x2E§ : 0);
         _loc1_ = 0;
         while(_loc1_ < §_-F2X§.length)
         {
            this.§_-t1x§(§_-F2X§[_loc1_],§_-bM§.length + _loc1_,true,this.§_-nB§,_loc1_ * (§_-kt§ + §_-OP§),0);
            _loc1_++;
         }
         this.§_-qq§();
         this.§_-n1U§ = this.§_-Q1B§() + §_-U2a§ + PAD;
         this.§_-f1z§();
         if(this.§_-82H§)
         {
            this.§_-416§();
         }
      }
      
      private function §_-qq§() : void
      {
         var _loc1_:int = this.§_-tN§() + 8;
         var _loc2_:int = _loc1_ + §_-j2k§;
         var _loc3_:int = PAD + §_-Mw§ + §_-Wc§;
         this.§_-X25§.y = _loc1_ - 4;
         this.§_-pF§.x = PAD;
         this.§_-pF§.y = _loc1_ + 1;
         this.§_-N2h§.x = _loc3_;
         this.§_-N2h§.y = _loc1_;
         this.§_-m10§.x = PAD;
         this.§_-m10§.y = _loc2_ + 1;
         this.§_-O8§.x = _loc3_;
         this.§_-O8§.y = _loc2_;
         this.§_-Ul§.x = this.§_-O8§.x + §_-a1N§ + §_-OP§;
         this.§_-Ul§.y = _loc2_;
         this.§_-E10§.x = this.§_-Ul§.x + §_-a1N§ + §_-OP§;
         this.§_-E10§.y = _loc2_;
         this.§_-jM§.x = this._width - PAD - §_-d1x§;
         this.§_-jM§.y = _loc1_;
      }
      
      private function §_-t1x§(param1:uint, param2:int, param3:Boolean, param4:Sprite, param5:Number = NaN, param6:Number = NaN) : void
      {
         if(isNaN(param5))
         {
            param5 = param2 % §_-D1q§ * (§_-kt§ + §_-OP§);
            param6 = int(param2 / §_-D1q§) * (§_-kt§ + §_-OP§);
         }
         var _loc7_:Sprite = new Sprite();
         _loc7_.name = param2.toString();
         _loc7_.x = param5;
         _loc7_.y = param6;
         var _loc8_:Sprite = new Sprite();
         _loc8_.graphics.lineStyle(1,§_-t24§);
         _loc8_.graphics.beginFill(param1);
         _loc8_.graphics.drawRect(0,0,§_-kt§,§_-kt§);
         _loc8_.graphics.endFill();
         _loc7_.addChild(_loc8_);
         var _loc9_:Sprite = new Sprite();
         _loc9_.name = "mark";
         _loc9_.mouseEnabled = false;
         _loc9_.mouseChildren = false;
         _loc7_.addChild(_loc9_);
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-Pq§);
         _loc7_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-v2U§);
         if(param3)
         {
            _loc7_.doubleClickEnabled = true;
            _loc7_.addEventListener(MouseEvent.DOUBLE_CLICK,this.§_-ix§);
         }
         param4.addChild(_loc7_);
         this.§_-jr§.push(_loc7_);
         this.§_-v2Y§(_loc9_,param2 == this.§_-JZ§);
      }
      
      private function §_-93h§(param1:Sprite, param2:int, param3:int, param4:int, param5:String = "0-9", param6:int = 3) : TextField
      {
         var _loc7_:TextField = new TextField();
         _loc7_.width = param2;
         _loc7_.height = §_-U2a§;
         _loc7_.background = true;
         _loc7_.border = true;
         _loc7_.type = TextFieldType.INPUT;
         _loc7_.restrict = param5;
         _loc7_.maxChars = param6;
         _loc7_.x = param3;
         _loc7_.y = param4;
         §_-L2J§.embedFonts(_loc7_);
         _loc7_.defaultTextFormat = §_-W2P§;
         _loc7_.addEventListener(FocusEvent.FOCUS_OUT,this.§_-o6§);
         _loc7_.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-d1M§);
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      private function §_-N2W§(param1:TextField) : void
      {
         param1.removeEventListener(FocusEvent.FOCUS_OUT,this.§_-o6§);
         param1.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-d1M§);
      }
      
      private function §_-32X§(param1:uint) : int
      {
         param1 &= 16777215;
         var _loc2_:int = 0;
         while(_loc2_ < §_-bM§.length)
         {
            if(§_-bM§[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-F2X§.length)
         {
            if(§_-F2X§[_loc2_] == param1)
            {
               return §_-bM§.length + _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private function §_-z11§(param1:int) : int
      {
         if(param1 < 0)
         {
            return -1;
         }
         if(param1 < §_-bM§.length)
         {
            return §_-bM§[param1];
         }
         param1 -= §_-bM§.length;
         return param1 < §_-F2X§.length ? int(§_-F2X§[param1]) : -1;
      }
      
      private function §_-y1w§(param1:uint) : Boolean
      {
         if(this.§_-32X§(param1) >= 0)
         {
            return false;
         }
         if(§_-F2X§.length >= §_-8W§)
         {
            §_-F2X§.shift();
         }
         §_-F2X§.push(param1 & 0xFFFFFF);
         return true;
      }
      
      private function §_-q1r§() : void
      {
         this.§_-A1j§(this.§_-6X§,§_-Dw§,this.selected);
         this.§_-vm§.text = §_-K2w§(this.selected);
         this.§_-N2h§.text = §_-K2w§(this.selected);
         this.§_-O8§.text = (this.selected >> 16 & 0xFF).toString();
         this.§_-Ul§.text = (this.selected >> 8 & 0xFF).toString();
         this.§_-E10§.text = (this.selected & 0xFF).toString();
         this.§_-S1§();
         this.§_-02W§();
      }
      
      private function §_-02W§() : void
      {
         this.§_-A1j§(this.§_-jM§,§_-d1x§,this.§_-82H§ ? this.preview : this.selected);
      }
      
      private function §_-S1§() : void
      {
         var _loc1_:Sprite = null;
         for each(_loc1_ in this.§_-jr§)
         {
            this.§_-v2Y§(_loc1_.getChildByName("mark") as Sprite,int(_loc1_.name) == this.§_-JZ§);
         }
      }
      
      private function §_-v2Y§(param1:Sprite, param2:Boolean) : void
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
         param1.graphics.drawRect(0,0,§_-kt§,§_-kt§);
      }
      
      private function §_-A1j§(param1:Sprite, param2:int, param3:uint) : void
      {
         param1.graphics.clear();
         param1.graphics.lineStyle(1,§_-t24§);
         param1.graphics.beginFill(param3);
         param1.graphics.drawRect(0,0,param2,param2);
         param1.graphics.endFill();
      }
      
      private function §_-93M§(param1:uint, param2:int) : void
      {
         this.selected = param1 & 0xFFFFFF;
         this.preview = this.selected;
         this.§_-JZ§ = param2 >= 0 ? param2 : this.§_-32X§(this.selected);
         this.§_-q1r§();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-u15§(param1:TextField) : int
      {
         if(param1 == this.§_-N2h§)
         {
            return StringUtil.§_-l2W§(this.§_-N2h§.text);
         }
         return this.§_-x1Q§();
      }
      
      private function §_-x1Q§() : int
      {
         var _loc1_:int = this.clamp(int(this.§_-O8§.text));
         var _loc2_:int = this.clamp(int(this.§_-Ul§.text));
         var _loc3_:int = this.clamp(int(this.§_-E10§.text));
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
      
      private function §_-F10§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§,false,0,true);
      }
      
      private function §_-D1y§(param1:Event) : void
      {
         this.close();
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§);
         }
      }
      
      private function §_-p2m§(param1:MouseEvent) : void
      {
         param1.preventDefault();
         param1.stopPropagation();
         if(this.§_-82H§)
         {
            this.close();
         }
         else
         {
            this.§_-w1b§();
         }
      }
      
      private function §_-22o§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function §_-U2t§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         param1.preventDefault();
      }
      
      private function §_-Pq§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int(param1.currentTarget.name);
         var _loc3_:int = this.§_-z11§(_loc2_);
         if(_loc3_ < 0)
         {
            return;
         }
         this.§_-93M§(_loc3_,_loc2_);
         this.close();
      }
      
      private function §_-ix§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int(param1.currentTarget.name) - §_-bM§.length;
         if(_loc2_ < 0 || _loc2_ >= §_-F2X§.length)
         {
            return;
         }
         §_-F2X§.splice(_loc2_,1);
         this.§_-03n§();
      }
      
      private function §_-v2U§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.§_-z11§(int(param1.currentTarget.name));
         if(_loc2_ < 0)
         {
            return;
         }
         this.preview = _loc2_;
         this.§_-02W§();
      }
      
      private function §_-o6§(param1:FocusEvent) : void
      {
         this.§_-41C§(param1.currentTarget as TextField);
      }
      
      private function §_-d1M§(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.§_-41C§(param1.currentTarget as TextField);
         }
      }
      
      private function §_-41C§(param1:TextField) : void
      {
         var _loc2_:int = this.§_-u15§(param1);
         if(_loc2_ < 0)
         {
            this.§_-q1r§();
            return;
         }
         _loc2_ &= 16777215;
         if(_loc2_ == this.selected)
         {
            return;
         }
         if(this.§_-y1w§(_loc2_))
         {
            this.§_-03n§();
         }
         this.§_-93M§(_loc2_,this.§_-32X§(_loc2_));
      }
      
      private function §_-8s§(param1:MouseEvent) : void
      {
         if(!this.§_-82H§)
         {
            return;
         }
         if(!hitTestPoint(param1.stageX,param1.stageY,true) && !this.§_-B2§.hitTestPoint(param1.stageX,param1.stageY,true))
         {
            this.close();
         }
      }
      
      private function §_-w1b§() : void
      {
         if(Boolean(§_-91z§) && §_-91z§ != this)
         {
            §_-91z§.close();
         }
         §_-91z§ = this;
         this.§_-82H§ = true;
         this.preview = this.selected;
         this.§_-03n§();
         this.§_-B2§.visible = true;
         this.§_-4A§();
         this.arrow.scaleY = -1;
         this.arrow.y = 14;
         this.§_-q1r§();
         this.§_-r1b§();
         this.§_-j2W§();
      }
      
      private function close() : void
      {
         if(!this.§_-82H§)
         {
            return;
         }
         this.§_-82H§ = false;
         this.preview = this.selected;
         this.§_-B2§.visible = false;
         this.§_-s29§();
         this.§_-4A§();
         this.arrow.scaleY = 1;
         this.arrow.y = 9;
         this.§_-02W§();
         if(§_-91z§ == this)
         {
            §_-91z§ = null;
         }
      }
      
      private function §_-j2W§() : void
      {
         if(!this.stage || this.§_-q1n§)
         {
            return;
         }
         var _loc1_:DisplayObjectContainer = this.§_-la§();
         if(Boolean(this.§_-B2§.parent) && this.§_-B2§.parent != _loc1_)
         {
            this.§_-B2§.parent.removeChild(this.§_-B2§);
         }
         _loc1_.addChild(this.§_-B2§);
         this.§_-q1n§ = true;
         this.§_-m18§();
         this.§_-416§();
      }
      
      private function §_-s29§() : void
      {
         if(!this.§_-q1n§)
         {
            return;
         }
         if(this.§_-B2§.parent)
         {
            this.§_-B2§.parent.removeChild(this.§_-B2§);
         }
         this.§_-q1n§ = false;
         this.§_-e2N§();
      }
      
      private function §_-la§() : DisplayObjectContainer
      {
         if(Boolean(Game.§_-q1L§) && this.§_-c2G§(Game.§_-q1L§))
         {
            return Game.§_-q1L§;
         }
         return this.stage;
      }
      
      private function §_-c2G§(param1:DisplayObjectContainer) : Boolean
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
      
      private function §_-m18§() : void
      {
         this.§_-e2N§();
         var _loc1_:DisplayObjectContainer = this.parent;
         while(_loc1_)
         {
            if(_loc1_ is ScrollPane)
            {
               this.§_-W18§ = _loc1_ as ScrollPane;
               this.§_-W18§.addEventListener(Event.CHANGE,this.§_-X2c§,false,0,true);
               break;
            }
            _loc1_ = _loc1_.parent;
         }
      }
      
      private function §_-e2N§() : void
      {
         if(!this.§_-W18§)
         {
            return;
         }
         this.§_-W18§.removeEventListener(Event.CHANGE,this.§_-X2c§);
         this.§_-W18§ = null;
      }
      
      private function §_-X2c§(param1:Event) : void
      {
         if(!this.§_-82H§)
         {
            return;
         }
         if(!this.§_-X1R§())
         {
            this.close();
            return;
         }
         this.§_-416§();
      }
      
      private function §_-X1R§() : Boolean
      {
         if(!this.§_-W18§ || !this.stage)
         {
            return true;
         }
         var _loc1_:Rectangle = getBounds(this.stage);
         var _loc2_:Point = this.§_-W18§.localToGlobal(new Point(0,0));
         var _loc3_:Rectangle = new Rectangle(_loc2_.x,_loc2_.y,this.§_-W18§.width,this.§_-W18§.height);
         return _loc3_.intersects(_loc1_);
      }
      
      private function §_-416§() : void
      {
         if(!this.§_-q1n§)
         {
            return;
         }
         var _loc1_:DisplayObjectContainer = this.§_-B2§.parent;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Point = _loc1_.globalToLocal(localToGlobal(new Point(0,§_-i2u§)));
         var _loc3_:Point = _loc1_.globalToLocal(localToGlobal(new Point(0,0)));
         var _loc4_:Number = _loc1_ == Game.§_-q1L§ ? GameMap.§_-Gd§ : this.stage.stageHeight;
         var _loc5_:Boolean = _loc2_.y + this.§_-n1U§ <= _loc4_ || _loc3_.y < this.§_-n1U§;
         this.§_-B2§.x = _loc5_ ? _loc2_.x : _loc3_.x;
         this.§_-B2§.y = _loc5_ ? _loc2_.y : _loc3_.y - this.§_-n1U§;
         _loc1_.setChildIndex(this.§_-B2§,_loc1_.numChildren - 1);
      }
      
      private function §_-r1b§() : void
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
      
      private function §_-f1z§() : void
      {
         this.§_-B2§.graphics.clear();
         this.§_-B2§.graphics.beginFill(16777215);
         this.§_-B2§.graphics.lineStyle(1,§_-t24§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         §_-gp§(this.§_-B2§.graphics,0,0,this._width,this.§_-n1U§);
         this.§_-B2§.graphics.endFill();
      }
      
      private function §_-4A§() : void
      {
         if(this.§_-82H§)
         {
            this.§_-n1z§.upState = this.§_-t2s§;
            this.§_-n1z§.overState = this.§_-83I§;
            this.§_-n1z§.downState = this.§_-83I§;
            this.§_-n1z§.hitTestState = this.§_-t2s§;
         }
         else
         {
            this.§_-n1z§.upState = this.§_-PO§;
            this.§_-n1z§.overState = this.§_-Q1§;
            this.§_-n1z§.downState = this.§_-Q1§;
            this.§_-n1z§.hitTestState = this.§_-PO§;
         }
      }
      
      private function §_-C2x§(param1:Sprite) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.§_-Pq§);
         param1.removeEventListener(MouseEvent.MOUSE_OVER,this.§_-v2U§);
         if(int(param1.name) >= §_-bM§.length)
         {
            param1.removeEventListener(MouseEvent.DOUBLE_CLICK,this.§_-ix§);
         }
      }
      
      private function §_-z1p§() : void
      {
         var _loc1_:Sprite = null;
         for each(_loc1_ in this.§_-jr§)
         {
            this.§_-C2x§(_loc1_);
         }
         this.§_-jr§.length = 0;
      }
      
      private function §_-tN§() : int
      {
         var _loc1_:int = PAD + §_-62§();
         if(§_-F2X§.length)
         {
            _loc1_ += §_-x2E§ + §_-kt§;
         }
         return _loc1_;
      }
      
      private function §_-Q1B§() : int
      {
         return this.§_-tN§() + 8 + §_-j2k§;
      }
      
      private function §_-w7§(param1:uint, param2:Boolean) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.lineStyle(1,§_-t24§,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         if(param2)
         {
            §_-7m§(_loc3_.graphics,0,0,this._width,§_-i2u§);
         }
         else
         {
            _loc3_.graphics.drawRoundRect(0,0,this._width,§_-i2u§,§_-A2L§ * 2,§_-A2L§ * 2);
         }
         _loc3_.graphics.endFill();
         return _loc3_;
      }
      
      private function §_-42G§() : Sprite
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

