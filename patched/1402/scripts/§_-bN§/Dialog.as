package §_-bN§
{
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-917§;
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
      
      public static const §_-q2I§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      public static const FORMAT_CAPTION_29:TextFormat = new TextFormat(§_-i5§.§_-p1s§,29,16763904);
      
      public static const FORMAT_CAPTION_16:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16763904);
      
      public static const FORMAT_CAPTION_18_CENTER:TextFormat = new TextFormat(§_-i5§.§_-p1s§,18,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_21_CENTER:TextFormat = new TextFormat(§_-i5§.§_-p1s§,21,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_23_CENTER:TextFormat = new TextFormat(§_-i5§.§_-p1s§,23,16763904,null,null,null,null,null,"center");
      
      public static const FORMAT_CAPTION_29_CENTER:TextFormat = new TextFormat(§_-i5§.§_-p1s§,29,16763904,null,null,null,null,null,"center");
      
      public static const §_-M2T§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6965033,true,null,null,null,null,"center");
      
      public static const §_-92m§:GlowFilter = new GlowFilter(102,1,7,7,1);
      
      protected var §_-Y1T§:§_-i5§ = null;
      
      protected var §_-x2T§:SimpleButton = null;
      
      protected var §_-01J§:Class = null;
      
      protected var caption:String = "";
      
      protected var §_-Ff§:MovieClip = null;
      
      protected var §_-oX§:Boolean;
      
      protected var drawBackground:Boolean;
      
      protected var §_-S2z§:MovieClip;
      
      protected var §_-01q§:int = 0;
      
      protected var §_-7N§:int = 0;
      
      protected var §_-f2d§:int = 0;
      
      protected var §_-I§:Boolean = true;
      
      protected var §_-u2j§:Boolean = true;
      
      protected var sound:String = "window_big_open";
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var §_-k1S§:Number = 0;
      
      private var §_-a2U§:Number = 0;
      
      private var §_-CO§:Array = [];
      
      private var §_-I2N§:int = 0;
      
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
            this.§_-Ff§ = param1;
         }
         this.§_-oX§ = param3;
         this.drawBackground = param2;
         this.§_-01J§ = param4;
         this.§_-u2j§ = param5;
         if(param5)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.startDragging);
            addEventListener(MouseEvent.MOUSE_UP,this.stopDragging);
         }
         §_-t2c§.§_-yl§(this);
      }
      
      override public function get width() : Number
      {
         return this.§_-k1S§;
      }
      
      override public function get height() : Number
      {
         return this.§_-a2U§;
      }
      
      override public function set width(param1:Number) : void
      {
         this.§_-k1S§ = param1;
         this.place();
      }
      
      override public function set height(param1:Number) : void
      {
         this.§_-a2U§ = param1;
         this.place();
      }
      
      public function hide(param1:MouseEvent = null) : void
      {
         §_-p2U§.add("Dialog.hide " + this);
         if(param1 != null && param1 is MouseEvent)
         {
            GameSounds.play("exit");
         }
         §_-33Q§.hide(this);
         dispatchEvent(new GameEvent(GameEvent.HIDED));
      }
      
      public function hideDialog() : void
      {
         this.visible = false;
         this.stopDragging();
      }
      
      public function show() : void
      {
         §_-p2U§.add("Dialog.show " + this);
         if(§_-uR§.§_-41k§)
         {
            §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.onScreenShow);
         }
         else
         {
            §_-33Q§.show(this);
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
         if(!Game.§_-q1L§.contains(this))
         {
            return;
         }
         Game.§_-q1L§.removeChild(this);
      }
      
      public function get captured() : Boolean
      {
         return false;
      }
      
      public function placeInCenter(param1:Number = 900, param2:Number = 620) : void
      {
         if(Game.starling.stage.stageWidth != §_-Zy§.§_-21V§)
         {
            param1 = Game.starling.stage.stageWidth;
         }
         if(Game.starling.stage.stageHeight != §_-Zy§.§_-02T§)
         {
            param2 = Game.starling.stage.stageHeight;
         }
         this.x = this.§_-01q§ + int((param1 - this.width) * 0.5);
         this.y = this.topOffset + int((param2 - this.height) * 0.5);
      }
      
      public function clear() : void
      {
         if(this.§_-Y1T§ != null)
         {
            removeChild(this.§_-Y1T§);
            this.§_-Y1T§ = null;
         }
         if(this.§_-x2T§ != null)
         {
            removeChild(this.§_-x2T§);
            this.§_-x2T§ = null;
         }
         if(this.§_-S2z§ != null)
         {
            removeChild(this.§_-S2z§);
            this.§_-S2z§ = null;
         }
      }
      
      public function onStageResize() : void
      {
         if(this.§_-u2j§)
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
            this.§_-CO§ = rest;
         }
         for each(_loc2_ in this.§_-CO§)
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
         Game.§_-q1L§.addChild(this);
      }
      
      protected function effectOpen() : void
      {
      }
      
      protected function initClose() : void
      {
         if(!this.§_-oX§)
         {
            return;
         }
         this.§_-x2T§ = new §_-917§();
         this.§_-x2T§.x = int(this.width - this.§_-x2T§.width * 0.5 - this.§_-7N§ - this.§_-01q§);
         this.§_-x2T§.y = this.§_-Y1T§ ? this.§_-Y1T§.y - 5 : 0;
         this.§_-x2T§.addEventListener(MouseEvent.CLICK,this.hide);
         addChild(this.§_-x2T§);
      }
      
      protected function setDefaultSize() : void
      {
         this.§_-01q§ = 15;
         this.§_-7N§ = 20;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      protected function get topOffset() : int
      {
         return this.§_-I2N§ + (this.§_-Y1T§ ? this.§_-Y1T§.height + 5 : 0) + (this.§_-Ff§ ? this.§_-Ff§.height + 5 : 0);
      }
      
      protected function set topOffset(param1:int) : void
      {
         this.§_-I2N§ = param1;
      }
      
      protected function initCaption() : void
      {
         if(this.caption != "")
         {
            this.§_-Y1T§ = new §_-i5§(this.caption,0,0,this.captionFormat);
            this.§_-Y1T§.filters = §_-q2I§;
            this.§_-Y1T§.width = this.width - this.§_-01q§ - this.§_-7N§;
            this.§_-Y1T§.multiline = true;
            this.§_-Y1T§.wordWrap = true;
            addChild(this.§_-Y1T§);
            if(Boolean(this.§_-S2z§) && this.§_-I§)
            {
               this.§_-S2z§.y -= this.§_-Y1T§.height + 5;
            }
            this.§_-Y1T§.y = -this.§_-Y1T§.height;
         }
         else if(this.§_-Ff§ != null)
         {
            this.§_-Ff§.x = int((this.width - this.§_-Ff§.width - this.§_-01q§ - this.§_-7N§) * 0.5);
            this.§_-Ff§.mouseEnabled = false;
            this.§_-Ff§.mouseChildren = false;
            addChild(this.§_-Ff§);
            this.§_-S2z§.y -= this.§_-Ff§.height + 5;
            this.§_-Ff§.y = -this.§_-Ff§.height;
         }
      }
      
      protected function draw() : void
      {
         if(!this.drawBackground)
         {
            return;
         }
         var _loc1_:int = this.§_-k1S§;
         var _loc2_:int = this.§_-a2U§;
         if(this.§_-01J§ == null)
         {
            this.§_-S2z§ = new DialogBaseBackground();
            this.§_-S2z§.filters = [§_-92m§];
         }
         else
         {
            this.§_-S2z§ = new this.§_-01J§();
         }
         this.§_-S2z§.x -= this.§_-01q§;
         this.§_-S2z§.y -= this.§_-I2N§;
         this.§_-S2z§.height = _loc2_;
         this.§_-S2z§.width = _loc1_;
         addChildAt(this.§_-S2z§,0);
      }
      
      private function initSize() : void
      {
         if(this.§_-01J§ == null && this.drawBackground)
         {
            this.setDefaultSize();
         }
         if(this.§_-k1S§ != 0 && this.§_-a2U§ != 0)
         {
            return;
         }
         this.§_-k1S§ = Math.floor(super.width) + this.§_-01q§ + this.§_-7N§;
         this.§_-a2U§ = Math.floor(super.height) + this.topOffset + this.§_-f2d§;
      }
      
      private function updateButtons() : void
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         if(this.§_-CO§.length == 0)
         {
            return;
         }
         var _loc1_:int = (this.§_-CO§.length - 1) * 20;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-CO§)
         {
            _loc2_ = Math.max(_loc2_,_loc3_.height);
            _loc1_ += _loc3_.width;
         }
         _loc4_ = _loc1_ + this.§_-01q§ + this.§_-7N§;
         if(_loc4_ > this.§_-k1S§)
         {
            this.§_-k1S§ = _loc4_;
            if(this.§_-S2z§)
            {
               this.§_-S2z§.width = this.§_-k1S§;
            }
            if(this.§_-Y1T§)
            {
               this.§_-Y1T§.width = this.§_-k1S§ - this.§_-01q§ - this.§_-7N§;
            }
            if(this.§_-x2T§)
            {
               this.§_-x2T§.x = int(this.width - this.§_-x2T§.width * 0.5 - this.§_-7N§ - this.§_-01q§);
            }
         }
         var _loc5_:int = int((this.width - _loc1_ - this.§_-01q§ - this.§_-7N§) * 0.5) + 3;
         var _loc6_:int = this.§_-S2z§.y + this.§_-S2z§.height - _loc2_ - this.§_-f2d§ - 10;
         for each(_loc3_ in this.§_-CO§)
         {
            _loc3_.x = _loc5_;
            _loc3_.y = _loc6_;
            _loc5_ += _loc3_.width + 20;
         }
      }
      
      private function onScreenShow(param1:ScreenEvent) : void
      {
         if(!(param1.screen is §_-si§))
         {
            return;
         }
         §_-33Q§.show(this);
         §_-t2c§.instance.removeEventListener(ScreenEvent.SHOW,this.onScreenShow);
      }
      
      private function dragObject(param1:MouseEvent) : void
      {
         this.x = (param1.stageX - Game.§_-q1L§.x - this.offsetX) / Game.§_-q1L§.scaleX;
         this.y = (param1.stageY - Game.§_-q1L§.y - this.offsetY) / Game.§_-q1L§.scaleY;
         param1.updateAfterEvent();
      }
      
      private function startDragging(param1:MouseEvent) : void
      {
         this.addToSprite();
         if(param1.target != this && !(param1.target is §_-i5§) && !(param1.target is Bitmap) && !(param1.target is Graphics) && !(param1.target is MovieClip))
         {
            return;
         }
         this.offsetX = param1.stageX - (Game.§_-q1L§.x + this.x * Game.§_-q1L§.scaleX);
         this.offsetY = param1.stageY - (Game.§_-q1L§.y + this.y * Game.§_-q1L§.scaleY);
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.dragObject);
      }
      
      private function stopDragging(param1:MouseEvent = null) : void
      {
         Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragObject);
      }
   }
}

