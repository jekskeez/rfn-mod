package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import protocol.§_-s2l§;
   
   public class §_-52i§ extends §_-92f§
   {
      
      private var point:b2Vec2 = null;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-52i§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-N2T§;
         this.§_-i1J§ = true;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.point != null;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         this.point = null;
         this.§_-L1c§();
      }
      
      override protected function activate() : void
      {
         this.§_-L1c§();
         super.activate();
         if(!this.point || isNaN(this.point.x) || isNaN(this.point.y))
         {
            return;
         }
         this.hero.teleportTo(this.point);
         this.point = null;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               switch(param1[1])
               {
                  case §_-A11§.§_-J2x§:
                     if(param1[2] != §_-s2l§.§_-x2Y§)
                     {
                        return;
                     }
                     if(param1[0] != this.hero.id)
                     {
                        return;
                     }
                     this.point = this.hero.position.Copy();
                     if(!this.§_-W1u§)
                     {
                        this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-Fe§);
                     }
                     this.§_-W1u§.view.visible = true;
                     this.§_-W1u§.view.§_-L2Z§ = this.hero.x;
                     this.§_-W1u§.view.§_-2F§ = this.hero.y;
                     this.§_-W1u§.start();
                     this.hero.game.map.§_-h2T§.§_-J2J§(this.§_-W1u§.view);
                     break;
                  case this.§_-T2a§:
                     super.§_-x2f§(param1);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-L1c§() : void
      {
         if(!this.§_-W1u§)
         {
            return;
         }
         this.§_-W1u§.view.visible = false;
         this.§_-W1u§.stop();
         §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}

