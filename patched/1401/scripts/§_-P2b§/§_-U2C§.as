package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.StateChechire;
   import flash.utils.setTimeout;
   import protocol.§_-S2I§;
   
   public class §_-U2C§ extends §_-x2Q§
   {
      
      public function §_-U2C§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-Y1q§;
         this.§_-mw§ = true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get startCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 5;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 20;
      }
      
      override protected function get maxRadius() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 200;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:StateChechire = null;
         if(this.hero == null)
         {
            return;
         }
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
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               _loc2_ = new b2Vec2(param1[5].x,param1[5].y);
               _loc3_ = new StateChechire(_loc2_);
               this.hero.behaviourController.§_-gz§(_loc3_);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function §_-D2T§() : void
      {
         super.§_-D2T§();
         setTimeout(super.§_-os§,600);
      }
   }
}

