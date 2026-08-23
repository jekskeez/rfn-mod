package §_-bN§
{
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   
   public class §_-7y§ extends §_-Fk§
   {
      
      public function §_-7y§(param1:String, param2:String, param3:Function, param4:int = 0)
      {
         super(param1,param2,true,param3,param4);
      }
      
      override protected function init(param1:String, param2:Boolean) : void
      {
         this.content = new §_-i5§(param1,0,10,this.format);
         this.content.width = this.§_-j1O§ ? this.§_-j1O§ : Math.max(§_-F20§,this.content.textWidth + 5);
         this.content.wordWrap = true;
         this.content.multiline = true;
         addChild(this.content);
         this.§_-Zg§ = new §_-K2G§(gls("Да"));
         this.§_-Zg§.§_-I29§();
         this.§_-Zg§.addEventListener(MouseEvent.CLICK,§_-c2V§,false,0,true);
         this.§_-l1e§ = new §_-K2G§(gls("Отмена"));
         this.§_-l1e§.width += 13;
         this.§_-l1e§.height += 5;
         this.§_-l1e§.addEventListener(MouseEvent.CLICK,hide,false,0,true);
         this.§_-l1e§.height = this.§_-Zg§.height;
         this.§_-l1e§.scaleX = this.§_-l1e§.scaleY;
         place(this.§_-Zg§,this.§_-l1e§);
         this.height = this.topOffset + this.content.y + this.content.height + this.§_-f2d§ + this.§_-Zg§.height + 20;
         this.content.x = int((this.width - this.content.width) * 0.5) - this.§_-01q§;
      }
   }
}

