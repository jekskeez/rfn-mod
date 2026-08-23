package §_-k1c§
{
   import §_-Y22§.§_-C2x§;
   import buttons.§_-j18§;
   import fl.controls.CheckBox;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import utils.§_-jB§;
   
   public class §_-Q13§ extends Dialog implements §_-C2x§
   {
      
      protected static const §_-11C§:int = 250;
      
      protected static const §_-L1e§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,2039583,null,null,null,null,null,TextFormatAlign.CENTER);
      
      public var data:Object;
      
      protected var content:§_-22V§;
      
      protected var §_-m2L§:CheckBox;
      
      protected var §_-61N§:§_-j18§;
      
      protected var §_-2q§:§_-j18§;
      
      protected var §_-02D§:Function;
      
      protected var §_-71X§:int = 0;
      
      protected var format:TextFormat;
      
      private var §_-oX§:Boolean;
      
      private var §_-416§:Boolean;
      
      public function §_-Q13§(param1:String, param2:String, param3:Boolean = false, param4:Function = null, param5:int = 0, param6:TextFormat = null, param7:Boolean = true, param8:Boolean = false)
      {
         super(param1);
         this.§_-02D§ = param4;
         this.§_-oX§ = param3;
         this.§_-71X§ = param5;
         this.format = param6 || §_-L1e§;
         this.§_-416§ = param7;
         this.init(param2,param8);
      }
      
      override public function show() : void
      {
         if(Boolean(this.§_-m2L§) && Boolean(this.§_-m2L§.selected) && this.§_-02D§ != null)
         {
            this.§_-02D§();
            this.hide();
            return;
         }
         super.show();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      override protected function effectOpen() : void
      {
         if(!this.§_-416§)
         {
            return;
         }
         super.effectOpen();
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-oX§)
         {
            if(this.§_-02D§ != null)
            {
               super.§_-O2e§.removeEventListener(MouseEvent.CLICK,this.hide);
               super.§_-O2e§.addEventListener(MouseEvent.CLICK,this.§_-u26§,false,0,true);
            }
         }
      }
      
      public function dispose() : void
      {
         this.§_-02D§ = null;
      }
      
      public function §_-fG§(param1:Array) : void
      {
         §_-jB§.§_-Y2B§(this.content,param1);
      }
      
      public function set message(param1:String) : void
      {
         this.content.text = param1;
         this.content.width = this.§_-71X§ ? this.§_-71X§ : Math.max(§_-11C§,this.content.textWidth + 5);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.§_-61N§.height + (this.§_-m2L§ ? 30 : 20);
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
         if(this.§_-m2L§)
         {
            this.§_-m2L§.x = this.content.x + int((this.§_-71X§ - this.content.textWidth) * 0.5) - 2;
         }
         if(!this.§_-oX§)
         {
            place(this.§_-61N§);
         }
         else
         {
            place(this.§_-61N§,this.§_-2q§);
         }
      }
      
      protected function init(param1:String, param2:Boolean) : void
      {
         this.content = new §_-22V§(param1,0,10,this.format);
         this.content.width = this.§_-71X§ ? this.§_-71X§ : Math.max(§_-11C§,this.content.textWidth + 5);
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         if(param2)
         {
            this.§_-m2L§ = new CheckBox();
            this.§_-m2L§.y = this.content.y + this.content.textHeight;
            this.§_-m2L§.width = §_-11C§;
            this.§_-m2L§.label = gls("Больше не спрашивать");
            this.§_-m2L§.selected = false;
            addChild(this.§_-m2L§);
         }
         this.§_-61N§ = new §_-j18§(gls("Ок"));
         this.§_-61N§.addEventListener(MouseEvent.CLICK,this.hide);
         if(this.§_-02D§ != null)
         {
            this.§_-61N§.addEventListener(MouseEvent.CLICK,this.§_-u26§,false,0,true);
         }
         if(!this.§_-oX§)
         {
            place(this.§_-61N§);
         }
         else
         {
            this.§_-2q§ = new §_-j18§(gls("Отмена"));
            this.§_-2q§.width += 13;
            this.§_-2q§.height += 5;
            this.§_-2q§.addEventListener(MouseEvent.CLICK,this.hide,false,0,true);
            this.§_-2q§.height = this.§_-61N§.height;
            this.§_-2q§.scaleX = this.§_-2q§.scaleY;
            place(this.§_-61N§,this.§_-2q§);
         }
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.§_-61N§.height + (param2 ? 30 : 20);
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
         if(param2)
         {
            this.§_-m2L§.x = this.content.x + int((this.§_-71X§ - this.content.textWidth) * 0.5) - 2;
         }
      }
      
      protected function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.SPACE || this.§_-02D§ == null)
         {
            return;
         }
         this.§_-u26§(null);
      }
      
      protected function §_-u26§(param1:MouseEvent) : void
      {
         this.hide();
         this.§_-02D§();
      }
   }
}

