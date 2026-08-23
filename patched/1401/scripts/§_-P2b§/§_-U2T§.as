package §_-P2b§
{
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import views.§_-nd§;
   
   public class §_-U2T§ extends §_-H2N§
   {
      
      public function §_-U2T§(param1:Hero)
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
            §_-nd§.§_-23V§(§_-nd§.§_-S6§);
         }
         if(this.active)
         {
            §_-nd§.stop(§_-nd§.§_-S6§,this.hero.id);
         }
         super.dispose();
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-nd§.start(§_-nd§.§_-S6§,this.hero.id);
         §_-92z§.sendMessage(this.hero.id,"",§_-A1n§.§_-P1D§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         §_-nd§.stop(§_-nd§.§_-S6§,this.hero.id);
      }
   }
}

