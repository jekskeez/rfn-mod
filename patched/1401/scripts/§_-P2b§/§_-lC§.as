package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-83V§.§_-o29§;
   import §_-B1O§.§_-A1f§;
   import §_-ZS§.§_-93d§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-lC§ extends §_-H2N§
   {
      
      private static const §_-y1J§:Number = 2;
      
      private static const §_-c1F§:Number = 4;
      
      private static const §_-p6§:Number = -50;
      
      private var squirrels:Array = [];
      
      private var §_-r22§:b2Vec2 = new b2Vec2(0,§_-p6§);
      
      private var §_-c17§:Boolean = false;
      
      public function §_-lC§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-Cy§;
         this.§_-mw§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.active || this.hero.id != Game.selfId)
         {
            return;
         }
         this.§_-R8§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:GameBody = null;
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§ || this.hero.id == param1[1])
               {
                  return;
               }
               switch(param1[3])
               {
                  case 2:
                     _loc5_ = 0;
                     _loc6_ = int(this.hero.game.map.§_-8q§().length);
                     while(_loc5_ < _loc6_)
                     {
                        _loc3_ = this.hero.game.map.§_-8q§()[_loc5_];
                        if(Boolean(_loc3_ && _loc3_ is GameBody && _loc3_.visible && !(_loc3_ is §_-A1f§) && !(_loc3_ is §_-P2o§)) && Boolean(!(_loc3_ is §_-o29§)) && !(_loc3_ is §_-Q1J§))
                        {
                           _loc2_ = _loc3_;
                           if(Boolean(_loc2_) && _loc2_.id == param1[2])
                           {
                              _loc2_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-r22§));
                           }
                        }
                        _loc5_++;
                     }
                     break;
                  case 1:
                     _loc4_ = this.hero.game.squirrels.get(param1[2]);
                     _loc4_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-r22§));
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         super.activate();
         this.hero.runSpeed *= §_-y1J§;
         this.§_-c17§ = true;
         this.hero.applyEffect(§_-93d§.§_-pT§);
         this.hero.applyEffect(§_-93d§.§_-L15§,-1);
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isSelf || _loc1_.isHare || _loc1_.inHollow))
            {
               this.squirrels.push(_loc1_);
            }
         }
      }
      
      override protected function deactivate() : void
      {
         this.squirrels = [];
         super.deactivate();
         if(this.§_-c17§)
         {
            this.hero.runSpeed /= §_-y1J§;
            this.§_-c17§ = false;
         }
         this.hero.disableEffect(§_-93d§.§_-pT§);
         this.hero.disableEffect(§_-93d§.§_-L15§);
      }
      
      private function §_-R8§() : void
      {
         var _loc3_:Hero = null;
         var _loc1_:* = int(this.squirrels.length);
         var _loc2_:b2Vec2 = null;
         if(Math.abs(this.hero.velocity.Length()) < 10)
         {
            return;
         }
         while(_loc1_--)
         {
            _loc3_ = this.squirrels[_loc1_];
            if(!(_loc3_.inHollow || _loc3_.isDead))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc3_.position);
               if(_loc2_.Length() <= §_-c1F§)
               {
                  _loc3_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-r22§));
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc3_.id,1);
               }
            }
         }
         this.§_-23y§();
      }
      
      private function §_-23y§() : void
      {
         var _loc1_:GameBody = null;
         var _loc2_:* = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.hero.game.map.§_-8q§().length);
         while(_loc4_ < _loc5_)
         {
            _loc2_ = this.hero.game.map.§_-8q§()[_loc4_];
            if(Boolean(_loc2_ && _loc2_ is GameBody && _loc2_.visible && !(_loc2_ is §_-A1f§) && !(_loc2_ is §_-P2o§)) && Boolean(!(_loc2_ is §_-o29§)) && !(_loc2_ is §_-Q1J§))
            {
               _loc1_ = _loc2_;
               _loc3_ = this.hero.position.Copy();
               _loc3_.Subtract(_loc1_.position);
               if(_loc3_.Length() <= §_-c1F§)
               {
                  _loc1_.body.SetLinearVelocity(this.hero.body.GetWorldVector(this.§_-r22§));
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc1_.id,2);
               }
            }
            _loc4_++;
         }
      }
   }
}

