package §_-k1c§
{
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import buttons.§_-91k§;
   import com.IShow;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   
   public class Dialog extends Sprite implements IShow
   {
      
      public static const §_-m2A§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      public static const FORMAT_CAPTION_29:TextFormat = new TextFormat(§_-22V§.§_-pJ§,29,16763904);
      
      public static const FORMAT_CAPTION_16:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16763904);
      
      public static const FORMAT_CAPTION_18_CENTER:TextFormat = new TextFormat(§_-22V§.§_-pJ§,18,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_21_CENTER:TextFormat = new TextFormat(§_-22V§.§_-pJ§,21,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_23_CENTER:TextFormat = new TextFormat(§_-22V§.§_-pJ§,23,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_29_CENTER:TextFormat = new TextFormat(§_-22V§.§_-pJ§,29,16763904,null,null,null,null,null,"center");
      
      public static const §_-72L§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6965033,true,null,null,null,null,"center");
      
      public static const §_-X1h§:GlowFilter = new GlowFilter(102,1,7,7,1);
      
      protected var §_-zl§:§_-22V§ = null;
      
      protected var §_-O2e§:SimpleButton = null;
      
      protected var §_-lv§:Class = null;
      
      protected var caption:String = "";
      
      protected var §_-q13§:MovieClip = null;
      
      protected var §_-Q2G§:Boolean;
      
      protected var drawBackground:Boolean;
      
      protected var §_-X1Y§:MovieClip;
      
      protected var §_-R1Y§:int = 0;
      
      protected var §_-4n§:int = 0;
      
      protected var §_-JZ§:int = 0;
      
      protected var §_-T1z§:Boolean = true;
      
      protected var §_-33o§:Boolean = true;
      
      protected var sound:String = "window_big_open";
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var §_-A12§:Number = 0;
      
      private var §_-hA§:Number = 0;
      
      private var §_-Xe§:Array = [];
      
      private var §_-f2F§:int = 0;
      
      public function Dialog(param1:* = null, param2:Boolean = true, param3:Boolean = true, param4:Class = null, param5:Boolean = true)
      {
         super();
         this.visible = false;
         if(param1 is String)
         {
            this.caption = param1;
         }
         else if(param1 is DisplayObject)
         {
            this.§_-q13§ = param1;
         }
         this.§_-Q2G§ = param3;
         this.drawBackground = param2;
         this.§_-lv§ = param4;
         this.§_-33o§ = param5;
         if(param5)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.startDragging);
            addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
         }
         §_-71o§.§_-5o§(this);
      }
      
      override public function get width() : Number
      {
         return this.§_-A12§;
      }
      
      override public function get height() : Number
      {
         return this.§_-hA§;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-A12§ = param1;
         this.place();
      }
      
      override public function set height(param1:Number) : void
      {
         this.§_-hA§ = param1;
         this.place();
      }
      
      public function hide(param1:MouseEvent = null) : void
      {
         §_-TQ§.add("Dialog.hide " + this);
         if(param1 != null && param1 is MouseEvent)
         {
            GameSounds.play("exit");
         }
         §_-83D§.hide(this);
         dispatchEvent(new GameEvent(GameEvent.HIDED));
      }
      
      public function hideDialog() : void
      {
         this.visible = false;
         this.stopDragging();
      }
      
      public function show() : void
      {
         §_-TQ§.add("Dialog.show " + this);
         if(§_-k2X§.§_-P21§)
         {
            §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.onScreenShow);
         }
         else
         {
            §_-83D§.show(this);
         }
         dispatchEvent(new GameEvent(GameEvent.SHOWED));
      }
      
      public function showDialog() : void
      {
         this.visible = true;
         this.addToSprite();
         if(this.sound != "")
         {
            GameSounds.play(this.sound);
         }
         this.placeInCenter();
         this.effectOpen();
      }
      
      public function close() : void
      {
         this.hide();
         if(!Game.§_-d2t§.contains(this))
         {
            return;
         }
         Game.§_-d2t§.removeChild(this);
      }
      
      public function get captured() : Boolean
      {
         return false;
      }
      
      public function placeInCenter(param1:Number = 900, param2:Number = 620) : void
      {
         if(Game.starling.stage.stageWidth != §_-a9§.§_-9o§)
         {
            param1 = Game.starling.stage.stageWidth;
         }
         if(Game.starling.stage.stageHeight != §_-a9§.§_-31m§)
         {
            param2 = Game.starling.stage.stageHeight;
         }
         this.x = this.§_-R1Y§ + int((param1 - this.width) * 0.5);
         this.y = this.topOffset + int((param2 - this.height) * 0.5);
      }
      
      public function clear() : void
      {
         if(this.§_-zl§ != null)
         {
            removeChild(this.§_-zl§);
            this.§_-zl§ = null;
         }
         if(this.§_-O2e§ != null)
         {
            removeChild(this.§_-O2e§);
            this.§_-O2e§ = null;
         }
         if(this.§_-X1Y§ != null)
         {
            removeChild(this.§_-X1Y§);
            this.§_-X1Y§ = null;
         }
      }
      
      public function onStageResize() : void
      {
         if(this.§_-33o§)
         {
            return;
         }
         this.placeOnResize();
         this.redrawModalBackdrop();
      }
      
      protected function placeOnResize() : void
      {
         this.placeInCenter();
      }
      
      protected function redrawModalBackdrop() : void
      {
      }
      
      protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_18_CENTER;
      }
      
      protected function place(... rest) : void
      {
         var _loc2_:* = undefined;
         if(rest.length != 0)
         {
            this.§_-Xe§ = rest;
         }
         for each(_loc2_ in this.§_-Xe§)
         {
            addChild(_loc2_);
         }
         this.clear();
         this.initSize();
         this.draw();
         this.initCaption();
         this.initClose();
         this.updateButtons();
         this.placeInCenter();
      }
      
      protected function addToSprite() : void
      {
         Game.§_-d2t§.addChild(this);
      }
      
      protected function effectOpen() : void
      {
      }
      
      protected function initClose() : void
      {
         if(!this.§_-Q2G§)
         {
            return;
         }
         this.§_-O2e§ = new §_-91k§();
         this.§_-O2e§.x = int(this.width - this.§_-O2e§.width * 0.5 - this.§_-4n§ - this.§_-R1Y§);
         this.§_-O2e§.y = this.§_-zl§ ? this.§_-zl§.y - 5 : 0;
         this.§_-O2e§.addEventListener(MouseEvent.CLICK,this.hide);
         addChild(this.§_-O2e§);
      }
      
      protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 15;
         this.§_-4n§ = 20;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      protected function get topOffset() : int
      {
         return this.§_-f2F§ + (this.§_-zl§ ? this.§_-zl§.height + 5 : 0) + (this.§_-q13§ ? this.§_-q13§.height + 5 : 0);
      }
      
      protected function set topOffset(param1:int) : void
      {
         this.§_-f2F§ = param1;
      }
      
      protected function initCaption() : void
      {
         if(this.caption != "")
         {
            this.§_-zl§ = new §_-22V§(this.caption,0,0,this.captionFormat);
            this.§_-zl§.filters = §_-m2A§;
            this.§_-zl§.width = this.width - this.§_-R1Y§ - this.§_-4n§;
            this.§_-zl§.multiline = true;
            this.§_-zl§.wordWrap = true;
            addChild(this.§_-zl§);
            if(Boolean(this.§_-X1Y§) && this.§_-T1z§)
            {
               this.§_-X1Y§.y -= this.§_-zl§.height + 5;
            }
            this.§_-zl§.y = -this.§_-zl§.height;
         }
         else if(this.§_-q13§ != null)
         {
            this.§_-q13§.x = int((this.width - this.§_-q13§.width - this.§_-R1Y§ - this.§_-4n§) * 0.5);
            this.§_-q13§.mouseEnabled = false;
            this.§_-q13§.mouseChildren = false;
            addChild(this.§_-q13§);
            this.§_-X1Y§.y -= this.§_-q13§.height + 5;
            this.§_-q13§.y = -this.§_-q13§.height;
         }
      }
      
      protected function draw() : void
      {
         if(!this.drawBackground)
         {
            return;
         }
         var _loc1_:int = this.§_-A12§;
         var _loc2_:int = this.§_-hA§;
         if(this.§_-lv§ == null)
         {
            this.§_-X1Y§ = new DialogBaseBackground();
            this.§_-X1Y§.filters = [§_-X1h§];
         }
         else
         {
            this.§_-X1Y§ = new this.§_-lv§();
         }
         this.§_-X1Y§.x -= this.§_-R1Y§;
         this.§_-X1Y§.y -= this.§_-f2F§;
         this.§_-X1Y§.height = _loc2_;
         this.§_-X1Y§.width = _loc1_;
         addChildAt(this.§_-X1Y§,0);
      }
      
      private function initSize() : void
      {
         if(this.§_-lv§ == null && this.drawBackground)
         {
            this.setDefaultSize();
         }
         if(this.§_-A12§ != 0 && this.§_-hA§ != 0)
         {
            return;
         }
         this.§_-A12§ = Math.floor(super.width) + this.§_-R1Y§ + this.§_-4n§;
         this.§_-hA§ = Math.floor(super.height) + this.topOffset + this.§_-JZ§;
      }
      
      private function updateButtons() : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         if(this.§_-Xe§.length == 0)
         {
            return;
         }
         var _loc1_:int = (this.§_-Xe§.length - 1) * 20;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-Xe§)
         {
            _loc2_ = Math.max(_loc2_,_loc3_.height);
            _loc1_ += _loc3_.width;
         }
         _loc4_ = _loc1_ + this.§_-R1Y§ + this.§_-4n§;
         if(_loc4_ > this.§_-A12§)
         {
            this.§_-A12§ = _loc4_;
            if(this.§_-X1Y§)
            {
               this.§_-X1Y§.width = this.§_-A12§;
            }
            if(this.§_-zl§)
            {
               this.§_-zl§.width = this.§_-A12§ - this.§_-R1Y§ - this.§_-4n§;
            }
            if(this.§_-O2e§)
            {
               this.§_-O2e§.x = int(this.width - this.§_-O2e§.width * 0.5 - this.§_-4n§ - this.§_-R1Y§);
            }
         }
         var _loc5_:int = int((this.width - _loc1_ - this.§_-R1Y§ - this.§_-4n§) * 0.5) + 3;
         var _loc6_:int = this.§_-X1Y§.y + this.§_-X1Y§.height - _loc2_ - this.§_-JZ§ - 10;
         for each(_loc3_ in this.§_-Xe§)
         {
            _loc3_.x = _loc5_;
            _loc3_.y = _loc6_;
            _loc5_ += _loc3_.width + 20;
         }
      }
      
      private function onScreenShow(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-5K§))
         {
            return;
         }
         §_-83D§.show(this);
         §_-71o§.instance.removeEventListener(ScreenEvent.SHOW,this.onScreenShow);
      }
      
      private function dragObject(param1:MouseEvent) : void
      {
         this.x = (param1.stageX - Game.§_-d2t§.x - this.offsetX) / Game.§_-d2t§.scaleX;
         this.y = (param1.stageY - Game.§_-d2t§.y - this.offsetY) / Game.§_-d2t§.scaleY;
         param1.updateAfterEvent();
      }
      
      private function startDragging(param1:MouseEvent) : void
      {
         this.addToSprite();
         if(param1.target != this && !(param1.target is §_-22V§) && !(param1.target is Bitmap) && !(param1.target is Graphics) && !(param1.target is MovieClip))
         {
            return;
         }
         this.offsetX = param1.stageX - (Game.§_-d2t§.x + this.x * Game.§_-d2t§.scaleX);
         this.offsetY = param1.stageY - (Game.§_-d2t§.y + this.y * Game.§_-d2t§.scaleY);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.dragObject);
      }
      
      private function stopDragging(param1:MouseEvent = null) : void
      {
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragObject);
      }
   }
}

