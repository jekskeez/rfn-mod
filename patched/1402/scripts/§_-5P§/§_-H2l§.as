package §_-5P§
{
   import §_-61C§.§_-a2p§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-n1h§.Perk;
   import flash.display.SimpleButton;
   import protocol.§_-s2l§;
   
   public class §_-H2l§ extends Perk
   {
      
      private static const §_-vT§:int = 3;
      
      protected var delay:int;
      
      public function §_-H2l§(param1:Hero)
      {
         super(param1);
         this.delay = §_-vT§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get available() : Boolean
      {
         var _loc1_:Boolean = §_-t2c§.active is §_-u24§ || §_-t2c§.active is §_-S2E§ && this.§_-T2a§ in §_-S2E§.§_-t1y§ || §_-t2c§.active is §_-H1k§ && this.§_-T2a§ in §_-H1k§.§_-t1y§;
         return super.available && !this.hero.isHare && _loc1_;
      }
      
      override protected function activate() : void
      {
         super.activate();
         var _loc1_:Class = §_-Z1f§.§_-92G§(this.§_-T2a§);
         this.hero.heroView.§_-v2L§(new _loc1_() as SimpleButton,this.delay);
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-C1i§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[2] == §_-s2l§.§_-j2o§)
         {
            return;
         }
         if(param1[2] == §_-s2l§.§_-x2Y§ && param1[1] == this.§_-T2a§)
         {
            §_-a2p§.§_-61R§(false);
         }
         if(this.hero != null && param1[1] == this.§_-T2a§ && param1[0] == this.hero.id)
         {
            this.active = param1[2] == §_-s2l§.§_-x2Y§;
         }
      }
   }
}

