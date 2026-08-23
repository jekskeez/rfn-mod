package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.StateChechire;
   import flash.utils.setTimeout;
   import protocol.§_-s2l§;
   
   public class §_-J2M§ extends §_-is§
   {
      
      public function §_-J2M§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-N2T§;
         this.§_-i1J§ = true;
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
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:StateChechire = null;
         if(this.hero == null)
         {
            return;
         }
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
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               _loc2_ = new b2Vec2(param1[5].x,param1[5].y);
               _loc3_ = new StateChechire(_loc2_);
               this.hero.behaviourController.§_-W10§(_loc3_);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-w2U§() : void
      {
         super.§_-w2U§();
         setTimeout(super.§_-c2j§,600);
      }
   }
}

