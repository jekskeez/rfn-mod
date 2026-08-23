package §_-k1c§
{
   import buttons.§_-j18§;
   import flash.events.MouseEvent;
   
   public class §_-V2t§ extends §_-Q13§
   {
      
      public function §_-V2t§(param1:String, param2:String, param3:Function, param4:int = 0)
      {
         super(param1,param2,true,param3,param4);
      }
      
      override protected function init(param1:String, param2:Boolean) : void
      {
         this.content = new §_-22V§(param1,0,10,this.format);
         this.content.width = this.§_-71X§ ? this.§_-71X§ : Math.max(§_-11C§,this.content.textWidth + 5);
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.§_-61N§ = new §_-j18§(gls("Да"));
         this.§_-61N§.§_-52e§();
         this.§_-61N§.addEventListener(MouseEvent.CLICK,§_-u26§,false,0,true);
         this.§_-2q§ = new §_-j18§(gls("Отмена"));
         this.§_-2q§.width += 13;
         this.§_-2q§.height += 5;
         this.§_-2q§.addEventListener(MouseEvent.CLICK,hide,false,0,true);
         this.§_-2q§.height = this.§_-61N§.height;
         this.§_-2q§.scaleX = this.§_-2q§.scaleY;
         place(this.§_-61N§,this.§_-2q§);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-JZ§ + this.§_-61N§.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-R1Y§;
      }
   }
}

