package §_-j2E§
{
   import §_-X1k§.§_-P2x§;
   import protocol.§_-s2l§;
   
   public class §_-I1o§ extends §_-92f§ implements §_-x1v§
   {
      
      private var §_-o1M§:Array = null;
      
      public function §_-I1o§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
      }
      
      override public function get target() : int
      {
         var ids:Array = §_-P2x§.§_-y18§(§_-P2x§.§_-e0§[int(§_-P2x§.§_-e0§.length * Math.random())]).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return §_-P2x§.getPackageCoinsPrice(param1) != 0 && (!§_-P2x§.§_-r5§(param1) && !§_-P2x§.§_-e2S§(param1) && !§_-P2x§.§_-k1G§(param1));
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
         this.§_-o1M§ = null;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.§_-o1M§ = [param1[4]];
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function transform() : void
      {
         if(!this.hero || !this.hero.game || this.§_-o1M§ == null)
         {
            return;
         }
         this.hero.heroView.setClothing(this.§_-o1M§,§_-P2x§.§_-L19§(this.§_-o1M§[0]));
         this.hero.viewChanged = true;
      }
   }
}

