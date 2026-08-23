package §_-P2b§
{
   import §_-I10§.§_-g2W§;
   import protocol.§_-S2I§;
   
   public class §_-r1w§ extends §_-H2N§ implements §_-01l§
   {
      
      private var §_-qk§:Array = null;
      
      public function §_-r1w§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
      }
      
      override public function get target() : int
      {
         var ids:Array = §_-g2W§.§_-W2m§(§_-g2W§.§_-12P§[int(§_-g2W§.§_-12P§.length * Math.random())]).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return §_-g2W§.getPackageCoinsPrice(param1) != 0 && (!§_-g2W§.§_-91b§(param1) && !§_-g2W§.§_-W2e§(param1) && !§_-g2W§.§_-D2d§(param1));
         });
         return ids[int(Math.random() * ids.length)];
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 15;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.transform();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
         this.hero.viewChanged = false;
         this.§_-qk§ = null;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.§_-qk§ = [param1[4]];
               this.active = param1[2] == §_-S2I§.§_-EY§;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function transform() : void
      {
         if(!this.hero || !this.hero.game || this.§_-qk§ == null)
         {
            return;
         }
         this.hero.heroView.setClothing(this.§_-qk§,§_-g2W§.§_-e2y§(this.§_-qk§[0]));
         this.hero.viewChanged = true;
      }
   }
}

