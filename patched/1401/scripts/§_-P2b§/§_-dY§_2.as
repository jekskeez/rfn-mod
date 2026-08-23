package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import protocol.§_-S2I§;
   
   public class §_-dY§ extends §_-H2N§
   {
      
      private var point:b2Vec2 = null;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-dY§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-Y1q§;
         this.§_-mw§ = true;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.point != null;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.point = null;
         this.§_-ms§();
      }
      
      override protected function activate() : void
      {
         this.§_-ms§();
         super.activate();
         if(!this.point || isNaN(this.point.x) || isNaN(this.point.y))
         {
            return;
         }
         this.hero.teleportTo(this.point);
         this.point = null;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               switch(param1[1])
               {
                  case §_-6L§.§_-HR§:
                     if(param1[2] != §_-S2I§.§_-EY§)
                     {
                        return;
                     }
                     if(param1[0] != this.hero.id)
                     {
                        return;
                     }
                     this.point = this.hero.position.Copy();
                     if(!this.§_-A38§)
                     {
                        this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-81R§);
                     }
                     this.§_-A38§.view.visible = true;
                     this.§_-A38§.view.§_-M2F§ = this.hero.x;
                     this.§_-A38§.view.§_-Cg§ = this.hero.y;
                     this.§_-A38§.start();
                     this.hero.game.map.§_-G12§.§_-83v§(this.§_-A38§.view);
                     break;
                  case this.§_-i2D§:
                     super.§_-o2C§(param1);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-ms§() : void
      {
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.view.visible = false;
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}

