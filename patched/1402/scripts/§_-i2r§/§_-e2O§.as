package §_-i2r§
{
   import §_-bN§.Dialog;
   import buttons.§_-917§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.getDefinitionByName;
   import utils.§_-p1r§;
   
   public class §_-e2O§ extends Dialog
   {
      
      public static const §_-7l§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,23,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      public static const §_-B1§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,8746579,null,null,null,null,null,TextFormatAlign.CENTER);
      
      protected static const §_-Z14§:Array = [1,32,4,-43];
      
      protected static const §_-K2o§:Array = [0,0,0,0];
      
      protected static const §_-S1d§:Array = [0,0,0,0];
      
      protected static const §_-t9§:Array = [-10,5,100,15];
      
      protected var header:ImageDialogIconHeader = new ImageDialogIconHeader();
      
      protected var §_-rU§:MovieClip = null;
      
      protected var §_-s2§:ImageRibborn = new ImageRibborn();
      
      protected var §_-oO§:Boolean = false;
      
      protected var §_-n2m§:§_-i5§ = null;
      
      public function §_-e2O§(param1:*, param2:* = null, param3:String = "", param4:Boolean = true, param5:Boolean = true, param6:Class = null, param7:Boolean = true, param8:Array = null, param9:Array = null, param10:Array = null, param11:Array = null)
      {
         super(param2,param4,param5,param6,param7);
         if(param1 == null)
         {
            throw new Error("iconHeader not be null!");
         }
         if(param1 is String)
         {
            param1 = getDefinitionByName(param1 as String) as Class;
         }
         this.§_-rU§ = new param1();
         if(this.§_-rU§.totalFrames > 0)
         {
            this.§_-oO§ = true;
         }
         this.header.header.cont.addChild(this.§_-rU§);
         if(param8 == null)
         {
            param8 = §_-Z14§;
         }
         var _loc12_:§_-p1r§ = new §_-p1r§();
         _loc12_.§_-xC§(param8[0],param8[1],param8[2],param8[3]);
         this.header.header.border.filters = [new ColorMatrixFilter(_loc12_)];
         if(param9 == null)
         {
            param9 = §_-K2o§;
         }
         _loc12_.§_-xC§(param9[0],param9[1],param9[2],param9[3]);
         this.header.header.back.filters = [new ColorMatrixFilter(_loc12_)];
         if(param10 == null)
         {
            param10 = §_-S1d§;
         }
         _loc12_ = new §_-p1r§();
         _loc12_.§_-xC§(param10[0],param10[1],param10[2],param10[3]);
         this.§_-s2§.filters = [new ColorMatrixFilter(_loc12_)];
         if(param11 == null)
         {
            param11 = §_-t9§;
         }
         _loc12_ = new §_-p1r§();
         _loc12_.§_-xC§(param11[0],param11[1],param11[2],param11[3]);
         this.header.bg.filters = [new ColorMatrixFilter(_loc12_)];
         if(param3 != "")
         {
            this.§_-n2m§ = new §_-i5§(param3,0,33,§_-B1§,360);
         }
         this.init();
      }
      
      override public function clear() : void
      {
         super.clear();
         if(Boolean(this.header) && this.contains(this.header))
         {
            this.removeChild(this.header);
         }
         if(Boolean(this.§_-s2§) && this.contains(this.§_-s2§))
         {
            this.removeChild(this.§_-s2§);
         }
      }
      
      override public function placeInCenter(param1:Number = 900, param2:Number = 620) : void
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
         this.y = this.topOffset * 2 + int((param2 - this.height) * 0.5);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 15;
         this.§_-7N§ = 20;
         this.topOffset = 50;
         this.§_-f2d§ = 0;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return §_-7l§;
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(Boolean(this.§_-n2m§) && !this.contains(this.§_-n2m§))
         {
            this.addChild(this.§_-n2m§);
         }
         if(!this.contains(this.header))
         {
            this.addChild(this.header);
         }
         if(!this.contains(this.§_-s2§))
         {
            this.addChild(this.§_-s2§);
         }
         this.setChildIndex(this.header,0);
         this.setChildIndex(this.§_-S2z§,1);
         this.setChildIndex(this.§_-s2§,2);
         this.§_-21v§();
      }
      
      override protected function initCaption() : void
      {
         if(this.caption != "")
         {
            if(Boolean(this.§_-Y1T§) && this.contains(this.§_-Y1T§))
            {
               this.removeChild(this.§_-Y1T§);
            }
            this.§_-Y1T§ = new §_-i5§(this.caption,0,0,this.captionFormat,this.§_-s2§.width);
            this.§_-Y1T§.filters = [new DropShadowFilter(0,0,532282,1,4,4,2)];
            this.§_-Y1T§.multiline = true;
            this.§_-Y1T§.wordWrap = true;
            addChild(this.§_-Y1T§);
            if(Boolean(this.§_-S2z§) && §_-I§)
            {
               this.§_-S2z§.y -= this.§_-Y1T§.height + 5;
            }
            this.§_-Y1T§.y = -this.§_-Y1T§.height - 63;
         }
         this.§_-21v§();
      }
      
      override protected function initClose() : void
      {
         if(!this.§_-oX§)
         {
            return;
         }
         this.§_-x2T§ = new §_-917§();
         this.§_-x2T§.x = int((this.width - this.§_-x2T§.width) * 0.5 - this.§_-7N§ - this.§_-01q§);
         this.§_-x2T§.y = this.§_-s2§.y + 74;
         this.§_-x2T§.addEventListener(MouseEvent.CLICK,hide);
         addChild(this.§_-x2T§);
      }
      
      protected function §_-21v§() : void
      {
         this.header.x = 163;
         this.header.y = this.§_-S2z§.y - 80;
         this.§_-s2§.x = this.§_-S2z§.x - 30;
         this.§_-s2§.y = this.§_-S2z§.y - 33;
         if(this.§_-x2T§)
         {
            this.§_-x2T§.y = this.§_-s2§.y + 74;
         }
         if(this.§_-Y1T§)
         {
            this.§_-Y1T§.x = (this.width - this.§_-Y1T§.width) * 0.5 - this.§_-01q§;
            this.§_-Y1T§.y = -this.§_-Y1T§.height - 65;
         }
         if(this.§_-n2m§)
         {
            this.§_-n2m§.x = -this.§_-01q§;
            this.§_-n2m§.y = this.§_-s2§.y + 72;
         }
      }
      
      private function init() : void
      {
         place();
         this.height = 386;
         this.width = 360;
      }
   }
}

