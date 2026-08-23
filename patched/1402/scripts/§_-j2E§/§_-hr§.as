package §_-j2E§
{
   import §_-8Q§.§_-r2M§;
   import §_-8Q§.§_-u1i§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-hr§ extends §_-92f§
   {
      
      private var §_-IT§:§_-r2M§;
      
      public function §_-hr§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "snowfall";
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
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-IT§ != null)
         {
            this.§_-IT§.§_-25§(-1);
         }
         this.§_-IT§ = null;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-kF§]);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,false,0,"");
         }
         if(this.§_-IT§ != null)
         {
            this.§_-IT§.§_-25§(-1);
         }
         this.§_-IT§ = null;
         this.§_-h1§ = 0;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         if(§_-x2b§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-kF§:
               if(this.§_-IT§ == null || !(this.§_-IT§ is §_-u1i§) || this.§_-IT§.index != param1[3])
               {
                  return;
               }
               this.§_-IT§ = null;
               this.active = false;
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(this.hero != null && param1[1] == this.§_-T2a§ && param1[0] == this.hero.id)
               {
                  _loc2_ = int(param1[3]);
                  if(_loc2_ == -1)
                  {
                     if(this.hero.id == Game.selfId)
                     {
                        §_-u24§.sendMessage(this.hero.id,"",§_-g1j§.§_-b1K§);
                     }
                     return;
                  }
                  this.active = param1[2] == §_-s2l§.§_-x2Y§;
                  if(!(_loc2_ in this.hero.game.map.elements))
                  {
                     return;
                  }
                  this.§_-IT§ = this.hero.game.map.elements[_loc2_];
                  this.§_-IT§.§_-25§(param1[2] == §_-s2l§.§_-x2Y§ ? this.hero.id : -1);
                  if(param1[2] != §_-s2l§.§_-x2Y§)
                  {
                     return;
                  }
                  §_-u24§.sendMessage(this.hero.id,"",§_-g1j§.§_-x1P§);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

