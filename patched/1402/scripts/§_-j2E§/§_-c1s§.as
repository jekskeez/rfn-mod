package §_-j2E§
{
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import views.§_-TE§;
   
   public class §_-c1s§ extends §_-92f§
   {
      
      public function §_-c1s§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get startCooldown() : Number
      {
         return 3;
      }
      
      override public function get activeTime() : Number
      {
         return 30;
      }
      
      override public function dispose() : void
      {
         if(this.hero != null && this.hero.id == Game.selfId)
         {
            §_-TE§.§_-82M§(§_-TE§.§_-A1C§);
         }
         if(this.active)
         {
            §_-TE§.stop(§_-TE§.§_-A1C§,this.hero.id);
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-TE§.start(§_-TE§.§_-A1C§,this.hero.id);
         §_-u24§.sendMessage(this.hero.id,"",§_-g1j§.§_-N16§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         §_-TE§.stop(§_-TE§.§_-A1C§,this.hero.id);
      }
   }
}

