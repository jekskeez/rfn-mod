package §_-I1s§
{
   import §_-k1c§.Dialog;
   import buttons.§_-91k§;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.getDefinitionByName;
   import utils.§_-nO§;
   
   public class §_-rt§ extends Dialog
   {
      
      public static const §_-p1J§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,23,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      public static const §_-L2Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,8746579,null,null,null,null,null,TextFormatAlign.CENTER);
      
      protected static const §_-K2V§:Array = [1,32,4,-43];
      
      protected static const §_-f1J§:Array = [0,0,0,0];
      
      protected static const §_-Y2c§:Array = [0,0,0,0];
      
      protected static const §_-u1i§:Array = [-10,5,100,15];
      
      protected var header:ImageDialogIconHeader = new ImageDialogIconHeader();
      
      protected var §_-l1I§:MovieClip = null;
      
      protected var §_-b2s§:ImageRibborn = new ImageRibborn();
      
      protected var §_-x1§:Boolean = false;
      
      protected var §_-hd§:§_-22V§ = null;
      
      public function §_-rt§(param1:*, param2:* = null, param3:String = "", param4:Boolean = true, param5:Boolean = true, param6:Class = null, param7:Boolean = true, param8:Array = null, param9:Array = null, param10:Array = null, param11:Array = null)
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
         this.§_-l1I§ = new param1();
         if(this.§_-l1I§.totalFrames > 0)
         {
            this.§_-x1§ = true;
         }
         this.header.header.cont.addChild(this.§_-l1I§);
         if(param8 == null)
         {
            param8 = §_-K2V§;
         }
         var _loc12_:§_-nO§ = new §_-nO§();
         _loc12_.§_-bb§(param8[0],param8[1],param8[2],param8[3]);
         this.header.header.border.filters = [new ColorMatrixFilter(_loc12_)];
         if(param9 == null)
         {
            param9 = §_-f1J§;
         }
         _loc12_.§_-bb§(param9[0],param9[1],param9[2],param9[3]);
         this.header.header.back.filters = [new ColorMatrixFilter(_loc12_)];
         if(param10 == null)
         {
            param10 = §_-Y2c§;
         }
         _loc12_ = new §_-nO§();
         _loc12_.§_-bb§(param10[0],param10[1],param10[2],param10[3]);
         this.§_-b2s§.filters = [new ColorMatrixFilter(_loc12_)];
         if(param11 == null)
         {
            param11 = §_-u1i§;
         }
         _loc12_ = new §_-nO§();
         _loc12_.§_-bb§(param11[0],param11[1],param11[2],param11[3]);
         this.header.bg.filters = [new ColorMatrixFilter(_loc12_)];
         if(param3 != "")
         {
            this.§_-hd§ = new §_-22V§(param3,0,33,§_-L2Y§,360);
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
         if(Boolean(this.§_-b2s§) && this.contains(this.§_-b2s§))
         {
            this.removeChild(this.§_-b2s§);
         }
      }
      
      override public function placeInCenter(param1:Number = 900, param2:Number = 620) : void
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
         this.y = this.topOffset * 2 + int((param2 - this.height) * 0.5);
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 15;
         this.§_-4n§ = 20;
         this.topOffset = 50;
         this.§_-JZ§ = 0;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return §_-p1J§;
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(Boolean(this.§_-hd§) && !this.contains(this.§_-hd§))
         {
            this.addChild(this.§_-hd§);
         }
         if(!this.contains(this.header))
         {
            this.addChild(this.header);
         }
         if(!this.contains(this.§_-b2s§))
         {
            this.addChild(this.§_-b2s§);
         }
         this.setChildIndex(this.header,0);
         this.setChildIndex(this.§_-X1Y§,1);
         this.setChildIndex(this.§_-b2s§,2);
         this.§_-ii§();
      }
      
      override protected function initCaption() : void
      {
         if(this.caption != "")
         {
            if(Boolean(this.§_-zl§) && this.contains(this.§_-zl§))
            {
               this.removeChild(this.§_-zl§);
            }
            this.§_-zl§ = new §_-22V§(this.caption,0,0,this.captionFormat,this.§_-b2s§.width);
            this.§_-zl§.filters = [new DropShadowFilter(0,0,532282,1,4,4,2)];
            this.§_-zl§.multiline = true;
            this.§_-zl§.wordWrap = true;
            addChild(this.§_-zl§);
            if(Boolean(this.§_-X1Y§) && §_-T1z§)
            {
               this.§_-X1Y§.y -= this.§_-zl§.height + 5;
            }
            this.§_-zl§.y = -this.§_-zl§.height - 63;
         }
         this.§_-ii§();
      }
      
      override protected function initClose() : void
      {
         if(!this.§_-Q2G§)
         {
            return;
         }
         this.§_-O2e§ = new §_-91k§();
         this.§_-O2e§.x = int((this.width - this.§_-O2e§.width) * 0.5 - this.§_-4n§ - this.§_-R1Y§);
         this.§_-O2e§.y = this.§_-b2s§.y + 74;
         this.§_-O2e§.addEventListener(MouseEvent.CLICK,hide);
         addChild(this.§_-O2e§);
      }
      
      protected function §_-ii§() : void
      {
         this.header.x = 163;
         this.header.y = this.§_-X1Y§.y - 80;
         this.§_-b2s§.x = this.§_-X1Y§.x - 30;
         this.§_-b2s§.y = this.§_-X1Y§.y - 33;
         if(this.§_-O2e§)
         {
            this.§_-O2e§.y = this.§_-b2s§.y + 74;
         }
         if(this.§_-zl§)
         {
            this.§_-zl§.x = (this.width - this.§_-zl§.width) * 0.5 - this.§_-R1Y§;
            this.§_-zl§.y = -this.§_-zl§.height - 65;
         }
         if(this.§_-hd§)
         {
            this.§_-hd§.x = -this.§_-R1Y§;
            this.§_-hd§.y = this.§_-b2s§.y + 72;
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

