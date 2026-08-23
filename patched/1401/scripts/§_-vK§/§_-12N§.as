package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8I§.SquirrelEvent;
   
   public class §_-12N§ extends §_-21O§
   {
      
      private static const §_-c1F§:Number = 11;
      
      public function §_-12N§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-51S§;
      }
      
      override public function get totalCooldown() : Number
      {
         return §_-41W§ ? 0 : 30;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.addEventListener(SquirrelEvent.§_-G1f§,this.§_-12I§);
         if(!this.buff)
         {
            this.buff = §_-T1G§(0);
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-G1f§,this.§_-12I§);
         this.hero.removeBuff(this.buff);
      }
      
      private function §_-12I§(param1:SquirrelEvent) : void
      {
         var _loc4_:Hero = null;
         var _loc5_:b2Vec2 = null;
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:int = param1.player.heroView.§_-026§;
         var _loc3_:* = int(§_-Nu§());
         for each(_loc4_ in this.hero.game.squirrels.players)
         {
            _loc5_ = this.hero.position.Copy();
            _loc5_.Subtract(_loc4_.position);
            if(!(!this.§_-qu§(_loc4_) || _loc5_.Length() > §_-c1F§ && !this.§_-41W§))
            {
               if(_loc3_-- == 0)
               {
                  break;
               }
               _loc4_.§_-U2J§(_loc2_);
            }
         }
         if(_loc3_ == §_-Nu§())
         {
            return;
         }
         this.active = false;
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-k2W§ || param1.isDead || param1.inHollow || param1.isHare || param1.shaman);
      }
   }
}

