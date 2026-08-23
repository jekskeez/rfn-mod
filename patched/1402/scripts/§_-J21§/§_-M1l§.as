package §_-J21§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-L1o§;
   import §_-bN§.§_-Uj§;
   import §_-j2E§.§_-A11§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class §_-M1l§ extends §_-Q1j§
   {
      
      protected var §_-nb§:int = -1;
      
      protected var §_-X1P§:SimpleButton = new ButtonPerkExtraSlot();
      
      public function §_-M1l§(param1:int = -1)
      {
         this.§_-nb§ = param1;
         this.§_-X1P§.x = 25;
         this.§_-X1P§.y = 25;
         addChild(this.§_-X1P§);
         super(§_-L1o§.§_-31E§(param1));
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-w1T§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE_MAGIC,this.§_-w1T§);
         addEventListener(MouseEvent.CLICK,this.showDialog);
      }
      
      override protected function update(param1:GameEvent = null) : void
      {
         super.update();
         if(this.id == 0)
         {
            this.§_-v2C§.visible = false;
         }
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         if(this.id == §_-L1o§.§_-31E§(this.§_-nb§))
         {
            return;
         }
         if(this.image)
         {
            removeChild(this.image);
         }
         this.id = §_-L1o§.§_-31E§(this.§_-nb§);
         this.image = §_-A11§.§_-51T§(this.id);
         this.image.x = 25;
         this.image.y = 25;
         addChild(this.image);
         if(this.§_-oj§)
         {
            this.§_-oj§.remove();
         }
         var _loc2_:String = "<body><b>" + §_-A11§.getName(id) + "</b>\n" + §_-A11§.§_-ya§(id) + "</body>";
         this.§_-oj§ = new §_-kr§(this,_loc2_,false,true);
         this.update();
      }
      
      private function showDialog(param1:MouseEvent) : void
      {
         §_-Uj§.show(this.§_-nb§);
      }
   }
}

