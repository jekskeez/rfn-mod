package §_-bN§
{
   import §_-I2Y§.§_-l2r§;
   import buttons.§_-K2G§;
   import fl.controls.CheckBox;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import utils.§_-K1Y§;
   
   public class §_-Fk§ extends Dialog implements §_-l2r§
   {
      
      protected static const §_-F20§:int = 250;
      
      protected static const §_-DZ§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER);
      
      public var data:Object;
      
      protected var content:§_-i5§;
      
      protected var §_-w2a§:CheckBox;
      
      protected var §_-Zg§:§_-K2G§;
      
      protected var §_-l1e§:§_-K2G§;
      
      protected var §_-z2E§:Function;
      
      protected var §_-j1O§:int = 0;
      
      protected var format:TextFormat;
      
      private var §_-Ra§:Boolean;
      
      private var §_-wZ§:Boolean;
      
      public function §_-Fk§(param1:String, param2:String, param3:Boolean = false, param4:Function = null, param5:int = 0, param6:TextFormat = null, param7:Boolean = true, param8:Boolean = false)
      {
         super(param1);
         this.§_-z2E§ = param4;
         this.§_-Ra§ = param3;
         this.§_-j1O§ = param5;
         this.format = param6 || §_-DZ§;
         this.§_-wZ§ = param7;
         this.init(param2,param8);
      }
      
      override public function show() : void
      {
         if(Boolean(this.§_-w2a§) && Boolean(this.§_-w2a§.selected) && this.§_-z2E§ != null)
         {
            this.§_-z2E§();
            this.hide();
            return;
         }
         super.show();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      override protected function effectOpen() : void
      {
         if(!this.§_-wZ§)
         {
            return;
         }
         super.effectOpen();
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-Ra§)
         {
            if(this.§_-z2E§ != null)
            {
               super.§_-x2T§.removeEventListener(MouseEvent.CLICK,this.hide);
               super.§_-x2T§.addEventListener(MouseEvent.CLICK,this.§_-c2V§,false,0,true);
            }
         }
      }
      
      public function dispose() : void
      {
         this.§_-z2E§ = null;
      }
      
      public function §_-P2W§(param1:Array) : void
      {
         §_-K1Y§.§_-31q§(this.content,param1);
      }
      
      public function set message(param1:String) : void
      {
         this.content.text = param1;
         this.content.width = this.§_-j1O§ ? this.§_-j1O§ : Math.max(§_-F20§,this.content.textWidth + 5);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.§_-Zg§.height + (this.§_-w2a§ ? 30 : 20);
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
         if(this.§_-w2a§)
         {
            this.§_-w2a§.x = this.content.x + int((this.§_-j1O§ - this.content.textWidth) * 0.5) - 2;
         }
         if(!this.§_-Ra§)
         {
            place(this.§_-Zg§);
         }
         else
         {
            place(this.§_-Zg§,this.§_-l1e§);
         }
      }
      
      protected function init(param1:String, param2:Boolean) : void
      {
         this.content = new §_-i5§(param1,0,10,this.format);
         this.content.width = this.§_-j1O§ ? this.§_-j1O§ : Math.max(§_-F20§,this.content.textWidth + 5);
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         if(param2)
         {
            this.§_-w2a§ = new CheckBox();
            this.§_-w2a§.y = this.content.y + this.content.textHeight;
            this.§_-w2a§.width = §_-F20§;
            this.§_-w2a§.label = gls("Больше не спрашивать");
            this.§_-w2a§.selected = false;
            addChild(this.§_-w2a§);
         }
         this.§_-Zg§ = new §_-K2G§(gls("Ок"));
         this.§_-Zg§.addEventListener(MouseEvent.CLICK,this.hide);
         if(this.§_-z2E§ != null)
         {
            this.§_-Zg§.addEventListener(MouseEvent.CLICK,this.§_-c2V§,false,0,true);
         }
         if(!this.§_-Ra§)
         {
            place(this.§_-Zg§);
         }
         else
         {
            this.§_-l1e§ = new §_-K2G§(gls("Отмена"));
            this.§_-l1e§.width += 13;
            this.§_-l1e§.height += 5;
            this.§_-l1e§.addEventListener(MouseEvent.CLICK,this.hide,false,0,true);
            this.§_-l1e§.height = this.§_-Zg§.height;
            this.§_-l1e§.scaleX = this.§_-l1e§.scaleY;
            place(this.§_-Zg§,this.§_-l1e§);
         }
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.§_-Zg§.height + (param2 ? 30 : 20);
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
         if(param2)
         {
            this.§_-w2a§.x = this.content.x + int((this.§_-j1O§ - this.content.textWidth) * 0.5) - 2;
         }
      }
      
      protected function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.SPACE || this.§_-z2E§ == null)
         {
            return;
         }
         this.§_-c2V§(null);
      }
      
      protected function §_-c2V§(param1:MouseEvent) : void
      {
         this.hide();
         this.§_-z2E§();
      }
   }
}

