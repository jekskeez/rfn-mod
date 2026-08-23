package §_-s2u§
{
   import §_-I10§.§_-h1f§;
   import §_-P2b§.§_-6L§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-qb§;
   import events.GameEvent;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   
   public class §_-IU§ extends §_-l2n§
   {
      
      protected var §_-qW§:int = -1;
      
      protected var §_-29§:SimpleButton = new ButtonPerkExtraSlot();
      
      public function §_-IU§(param1:int = -1)
      {
         this.§_-qW§ = param1;
         this.§_-29§.x = 25;
         this.§_-29§.y = 25;
         addChild(this.§_-29§);
         super(§_-h1f§.§_-Eo§(param1));
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-Hp§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE_MAGIC,this.§_-Hp§);
         addEventListener(MouseEvent.CLICK,this.showDialog);
      }
      
      override protected function update(param1:GameEvent = null) : void
      {
         super.update();
         if(this.id == 0)
         {
            this.§_-l2h§.visible = false;
         }
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         if(this.id == §_-h1f§.§_-Eo§(this.§_-qW§))
         {
            return;
         }
         if(this.image)
         {
            removeChild(this.image);
         }
         this.id = §_-h1f§.§_-Eo§(this.§_-qW§);
         this.image = §_-6L§.§_-Gi§(this.id);
         this.image.x = 25;
         this.image.y = 25;
         addChild(this.image);
         if(this.§_-XW§)
         {
            this.§_-XW§.remove();
         }
         var _loc2_:String = "<body><b>" + §_-6L§.getName(id) + "</b>\n" + §_-6L§.§_-l7§(id) + "</body>";
         this.§_-XW§ = new §_-Hb§(this,_loc2_,false,true);
         this.update();
      }
      
      private function showDialog(param1:MouseEvent) : void
      {
         §_-qb§.show(this.§_-qW§);
      }
   }
}

