package §_-P2b§
{
   import §_-83V§.§_-o29§;
   import §_-83V§.§_-r1o§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-YU§ extends §_-H2N§
   {
      
      private var §_-jj§:§_-r1o§;
      
      public function §_-YU§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "snowfall";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get startCooldown() : Number
      {
         return 30;
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-jj§ != null)
         {
            this.§_-jj§.§_-u7§(-1);
         }
         this.§_-jj§ = null;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-63o§]);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,false,0,"");
         }
         if(this.§_-jj§ != null)
         {
            this.§_-jj§.§_-u7§(-1);
         }
         this.§_-jj§ = null;
         this.§_-f1z§ = 0;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         if(§_-g1M§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-63o§:
               if(this.§_-jj§ == null || !(this.§_-jj§ is §_-o29§) || this.§_-jj§.index != param1[3])
               {
                  return;
               }
               this.§_-jj§ = null;
               this.active = false;
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(this.hero != null && param1[1] == this.§_-i2D§ && param1[0] == this.hero.id)
               {
                  _loc2_ = int(param1[3]);
                  if(_loc2_ == -1)
                  {
                     if(this.hero.id == Game.selfId)
                     {
                        §_-92z§.sendMessage(this.hero.id,"",§_-A1n§.§_-p2k§);
                     }
                     return;
                  }
                  this.active = param1[2] == §_-S2I§.§_-EY§;
                  if(!(_loc2_ in this.hero.game.map.elements))
                  {
                     return;
                  }
                  this.§_-jj§ = this.hero.game.map.elements[_loc2_];
                  this.§_-jj§.§_-u7§(param1[2] == §_-S2I§.§_-EY§ ? this.hero.id : -1);
                  if(param1[2] != §_-S2I§.§_-EY§)
                  {
                     return;
                  }
                  §_-92z§.sendMessage(this.hero.id,"",§_-A1n§.§_-rr§);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
   }
}

